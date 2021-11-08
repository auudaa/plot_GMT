#!/bin/bash
#!/bin/bash
#!Raudlah/2020

#awk '{print $3}' corr_ll_ok.xyz | gmt pshistogram corr_ll_ok.xyz -Bxa0.2f0.1+l"Koherensi" -Bya10f5+l"Frekuensi"+u"%" -BWSne+t"Histogram"+gorange -R-0.1/1.1/0/100 -JX5.8i/2.9i -Glightblue -Y3i -X3i -L1p -Z1 -W250 > grafik.ps

#awk '{print $3}' comparison_gps2los_desc.txt | \pshistogram -JX6.5i -W0.0009 \-Gblack -L1p -R-1/1/0/550 \-Ba:"RMSE (mm)":/a50:"Frekuensi":WSne \-P > grafik_comparison_gps2los_desc.ps

trend1d comparison_gps2los_asc.txt -Fxr -Np1 > grafik_comparison_gps2los_asc.ps
psxy comparison_gps2los_asc.txt -JX6.5 -R-5/2/-0.00008/0.00002 \-Ba1:"InSAR (mm)":/a0.00002:"GPS LOS (mm)":WSne \-Ss0.1 -W2/0 -A >> grafik_comparison_gps2los_asc.ps

#psxy comparison_gps2los_desc.txt -JX6.5i -R -W3ta -O >> grafik_comparison_gps2los_desc.ps

gmt psconvert grafik_comparison_gps2los_asc.ps -A -P -Tg
gmt psconvert grafik_comparison_gps2los_asc.ps -A -P -Tf
