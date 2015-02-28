
for(int i=0;i<RasterGröße-1;i++){
    //alle bis auf das Letzte Element
    for(int j=i+1;j<RasterGröße;j++){
        //Vergleiche Raster[i] mit Raster[j]!
        if(Raster[i].counter==Raster[j].counter){
            Raster[i].setColor(200,0,0);
            Raster[j].setColor(200,0,0);
        }else{
            Raster[i].setColor(0,200,0);
            Raster[j].setColor(0,200,0);
        }
    }
}

