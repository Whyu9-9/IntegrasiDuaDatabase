import pymysql
import time



print("Program sedang berjalan...")
while (1):
    try:
        flag_toko = 1
        try:
            connToko = pymysql.connect(host='localhost', user='root', password='Dragoncit1234', db='db_tokoo', charset='utf8mb4')
            curToko = connToko.cursor()
        except:
            continue
            flag_toko = 0

        try:
            connBank = pymysql.connect(host='localhost', user='root', password='Dragoncit1234', db='db_bankk', charset='utf8mb4')
            curBank = connBank.cursor()
        except:
            continue

        sql_select = "SELECT * FROM tb_transaksi"
        curBank.execute(sql_select)
        result = curBank.fetchall()

        sql_select = "SELECT * FROM tb_integrasi"
        curBank.execute(sql_select)
        integrasi = curBank.fetchall()

        # insert listener
        if (len(result) > len(integrasi)):
            print("-- INSERT DETECTED --")
            for data in result:
                a = 0
                for dataIntegrasi in integrasi:
                    if (data[0] == dataIntegrasi[0]):
                        a = 1
                if (a == 0):
                    print("-- RUN INSERT FOR ID = %s" % (data[0]))
                    val = (data[0], data[1], data[2], data[3], data[4])
                    insert_integrasi_bank = "insert into tb_integrasi (id_transaksi, no_rekening, tgl_transaksi, total_transaksi, status) values(%s,%s,%s,%s,%s)"
                    curBank.execute(insert_integrasi_bank, val)
                    connBank.commit()

                    if (flag_toko == 1):
                        insert_integrasi_toko = "insert into tb_integrasi (id_transaksi, no_rekening, tgl_transaksi, total_transaksi, status) values(%s,%s,%s,%s,%s)"
                        curToko.execute(insert_integrasi_toko, val)
                        connToko.commit()

                        insert_transaksi_toko = "insert into tb_transaksi (id_transaksi, no_rekening, tgl_transaksi, total_transaksi, status) values(%s,%s,%s,%s,%s)"
                        curToko.execute(insert_transaksi_toko, val)
                        connToko.commit()

        # delete listener
        if (len(result) < len(integrasi)):
            print("-- DELETE DETECTED --")
            for dataIntegrasi in integrasi:
                a = 0
                for data in result:
                    if (dataIntegrasi[0] == data[0]):
                        a = 1
                if (a == 0):
                    print("-- RUN DELETE FOR ID = %s" % (dataIntegrasi[0]))

                    delete_integrasi_bank = "delete from tb_integrasi where id_transaksi = %s" % (dataIntegrasi[0])
                    curBank.execute(delete_integrasi_bank)
                    connBank.commit()
                    if (flag_toko == 1):
                        delete_integrasi_toko = "delete from tb_integrasi where id_transaksi = %s" % (dataIntegrasi[0])
                        curToko.execute(delete_integrasi_toko)
                        connToko.commit()

                        delete_transaksi_toko = "delete from tb_transaksi where id_transaksi = %s" % (dataIntegrasi[0])
                        curToko.execute(delete_transaksi_toko)
                        connToko.commit()

        # update listener
        if (result != integrasi):
            print("-- EVENT SUCCESS OR UPDATE DETECTED --")
            for data in result:
                for dataIntegrasi in integrasi:
                    if (data[0] == dataIntegrasi[0]):
                        if (data != dataIntegrasi):
                            val = (data[1], data[2], data[3], data[4], data[0])
                            update_integrasi_bank = "update tb_integrasi set no_rekening = %s, tgl_transaksi = %s, total_transaksi = %s, status = %s where id_transaksi = %s"
                            curBank.execute(update_integrasi_bank, val)
                            connBank.commit()
                            if (flag_toko == 1):
                                update_integrasi_toko = "update tb_integrasi set no_rekening = %s, tgl_transaksi = %s, total_transaksi = %s, status = %s where id_transaksi = %s"
                                curToko.execute(update_integrasi_toko, val)
                                connToko.commit()
                                update_transaksi_toko = "update tb_transaksi set no_rekening = %s, tgl_transaksi = %s, total_transaksi = %s, status = %s where id_transaksi = %s"
                                curToko.execute(update_transaksi_toko, val)
                                connToko.commit()

    except (pymysql.Error, pymysql.Warning) as e:
        print(e)
    time.sleep(5)