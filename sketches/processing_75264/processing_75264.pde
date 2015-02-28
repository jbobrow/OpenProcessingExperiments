
PImage fromFile;
PImage source;
PImage target;

size(300*2,300);

fromFile = loadImage("2.jpg"); 
image(fromFile,0,0,width/2,height);


source = get(0,0,width/2,height);
target = createImage(width/2,height,RGB);
source.loadPixels();
target.loadPixels();

for (int y=0; y<source.height; y++){
  for (int x=0; x<source.width; x++){
    int pixelLocation = x+y*source.width;
    color c = source.pixels[pixelLocation];
     
     int compareLocation = 0;
     while (brightness (c) < brightness (target.pixels[compareLocation])){
       compareLocation++;
     }
     while (saturation (c) < saturation (target.pixels[compareLocation])){
       compareLocation++;
     }
     while (hue (c) < hue (target.pixels[compareLocation])){
       compareLocation++;
     }
     
     for (int i= pixelLocation; i>compareLocation; i--){
       target.pixels[i] = target.pixels[i-1];
     }
     target.pixels[compareLocation] = c;
     
     println("pixelLocation: "+pixelLocation+"  compareLocation: "+compareLocation);
     
  }
}
image(target,width/2,0);


