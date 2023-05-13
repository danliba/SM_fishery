import ftplib
from datetime import date
import datetime

ftp = ftplib.FTP('ftp.ifremer.fr')
ftp.login('', '')

#hoy
today = date.today()
yesterday = today - datetime.timedelta(days=7)#5 dias atrás
ytd=yesterday.strftime("%Y/%m/%d")
dast=int(ytd[8:10]) #dia de inicio
yy=int(ytd[:4])
mm=int(ytd[5:7])
#ftp
ftp.cwd('ifremer/argo/geo/pacific_ocean/%d/%02d' % (yy,mm))
print(ftp.cwd)
dir_list = []
ftp.dir(dir_list.append)

##find requested day
for ii in range(dast-1,len(dir_list),1):
    #print(ii)
    dir_list_sel=dir_list [ii][56:]
    file = open(dir_list_sel, 'wb')
    ftp.retrbinary('RETR ' + dir_list_sel, file.write)
    file.close()
    print('Float' + dir_list_sel +'file has been successfully downloaded')
