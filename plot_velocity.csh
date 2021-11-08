#!/bin/bash
#!/bin/bash

eps=desc_vel_remove7_reference_rung
region=112.576/112.866684/-7.379/-7.166667
color=SAR

gmt gmtset FONT_ANNOT_PRIMARY 9p

#resample DEM file

#gmt makecpt -Cgray -I -Z > hill.cpt

#plot DEM file
gmt grdimage dem_surabaya.grd -Idem_surabaya_int.grd -JM21c -R$region -Chill.cpt -K -Yc -Xc -V > $eps.ps

awk '$3 !~/1$/' ocean.xyz > ocean_only.txt


#Plot InSAR file
gmt makecpt -Cjet -T-20/10/1 -N  -V > $color.cpt

gmt psxy desc_0ref_rung_benar.txt -Ss0.1i -R$region -JM21c -O -K -V -CSAR.cpt >> $eps.ps

gmt psxy ocean_only.txt -R$region -J -O -Ss0.15 -Glightblue -h0  -K -V >> $eps.ps
gmt psxy Surabaya.txt -R -J -O  -K -W0.5,black -V >> $eps.ps
#gmt psxy gpslos_desc_0ref_rung.txt -R -J -Ss0.5i -O -W0.5 -Sc0.09i -K -V -CSAR.cpt >> $eps.ps
#gridding
gmt psbasemap -J -R$region -K -O --FONT_LABEL=8p --FONT_TITLE=10p -Bxa0.03333334f0.03333334 -Bya0.03333334f0.03333334  -Td112.81/-7.20+w2 -Lf112.83/-7.174/5/5k+u -V >> $eps.ps

#gmt psxy sesar_surabaya.txt -R -J -O  -K -W2,red -V >> $eps.ps
gmt psxy sesar_surabaya.txt -R -J -W2,red -Sf0.8i/0.08irt -G50/0/0 -K -O >> $eps.ps
gmt pstext -R -J -O -K -Dj0.1/0 -S8/255 -F+f10p,Courier-Bold,red+j -N sesar_sby.txt -V >> $eps.ps
gmt pstext -R -J -O -K -Dj0.1/0 -F+f10p,Courier-Bold,red+j -N sesar_waru.txt -V >> $eps.ps
#gmt psxy 1.txt -R -J -Sv0.1i -G0 -D-0.05i/-0.05i -O -K -V >> $eps.ps
#gmt psxy titik_gps.txt -R -J -Ss0.1i -O -W0.5 -Sc0.05i -K -V >> $eps.ps
gmt psxy titik_rung.txt -R -J -St0.2i -O -W0.5 -Gred -K -V >> $eps.ps
#gmt psxy ref.txt -R -J -Ss0.05i -O -W0.5 -Sd0.2 -K -V >> $eps.ps
gmt pstext -R -J -O -K -Dj0.3/0 -F+f13p,Courier-Bold,black+j -N titik_rung.txt -K -V >> $eps.ps
#gmt pstext -R -J -O -K -Dj0.3/0 -F+f10p,Courier-Bold,black+j -N 1.txt -K -V >> $eps.ps
#gmt pstext -R -J -O -K -Dj0.3/0 -F+f10p,Courier-Bold,black+j -N ref.txt -K -V >> $eps.ps


#scalebar
gmt psscale -D10/-0.1/19c/0.3h -C$color.cpt -B5:"":/:mm/yr:  -I -O  -Y-0.5i --FONT_LABEL=8p -V >> $eps.ps

gmt psconvert $eps.ps -A -P -Tf -V
gmt psconvert $eps.ps -A -P -Tg -V


