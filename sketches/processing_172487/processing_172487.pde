
PImage[] ojosi= new PImage[13];
PImage[] ojosd= new PImage[13];
PImage[] cejai= new PImage[12];
PImage[] cejad= new PImage[12];
PImage[] boca= new PImage[13];
PImage[] nariz= new PImage[13];


void setup(){
  size(700,700);
  
for (int oi = 1; oi<13; oi ++ ) {
  ojosi[oi]=loadImage("o"+oi+".jpg");
}

for (int od = 1; od<13; od ++ ) {
  ojosd[od]=loadImage("od"+od+".jpg");
}

for (int ci = 1; ci<12; ci ++ ) {
  cejai[ci]=loadImage("c"+ci+".jpg");
}

for (int cd = 1; cd<12; cd ++ ) {
  cejad[cd]=loadImage("cd"+cd+".jpg");
}
for (int n = 1; n<13; n ++ ) {
  nariz[n]=loadImage("nariz"+n+".jpg");
}

for (int b = 1; b<13; b ++ ) {
  boca[b]=loadImage("boca"+b+".jpg");
}
}
void draw(){
 int posicion = int(mouseY*(10.0/height))+1; 
image(ojosi[posicion],height*3/8, width/2,145,71);

 
image(ojosd[posicion],height*5/8, width/2,145,71);


image(cejai[posicion], height*3/8, (width/2)-40,82*2,25*2);

 
image(cejad[posicion], height*5/8, (width/2)-40,93*1.8,25*1.8);


image(boca[posicion],(height/2)-25, (width*7/9)-10,570/3,226/3);

 
image(nariz[posicion],height/2, (width*5/8)-15,97*1.3,87*1.3);
}



