
PImage[] ojosi= new PImage[13];
PImage[] ojosd= new PImage[13];
PImage[] cejai= new PImage[12];
PImage[] cejad= new PImage[12];
PImage[] boca= new PImage[13];
PImage[] nariz= new PImage[13];
//Codigo de sonido
import ddf.minim.*;

Minim minim;
AudioInput in;
 float promedio = 0;
 int pums = 0;
 boolean arriba=false;
 //Cierre codigo de sonido


void setup(){
  size(700,700);
  colorMode(HSB);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
 noStroke();

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
 
  background(0);
  stroke(255);
  
  int posicion = int(mouseY*(10.0/height))+1; 
image(ojosi[posicion],height*3/8, width/2,145,71);

 
image(ojosd[posicion],height*5/8, width/2,145,71);


image(cejai[posicion], height*3/8, (width/2)-40,82*2,25*2);

 
image(cejad[posicion], height*5/8, (width/2)-40,93*1.8,25*1.8);


image(boca[posicion],(height/2)-25, (width*7/9)-10,570/3,226/3);

 
image(nariz[posicion],height/2, (width*5/8)-15,97*1.3,87*1.3);

//Codigo de sonido
float amplitud = in.mix.get(0);
  fill(100,255,255);
  ellipse(15,amplitud*500,10,10);
  promedio = (promedio*0.99)+(amplitud*0.01);
   rect(100,promedio*500,10,10);
//  println(amplitud);
//println(abs(amplitud-promedio));
if(abs(amplitud-promedio)>0.09){
  pums++;
  
  fill(255,255,255);
}else{
   fill(255);
   if(pums>0){
    // pums--;
   }
   println(pums);
   if(pums>20){
     pums=0;
   }
}
  String monitoringState = in.isMonitoring() ? "enabled" : "disabled";
  text( "Input monitoring iscurrently " + monitoringState + ".", 5, 15 );
boolean pums= true;
if(pums){
for (int oi = 1; oi<13; oi ++ ) {
  ojosi[oi]=loadImage("o"+oi+".jpg");
}
}
//Codigo de sonido


}


void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    } else
    {
      in.enableMonitoring();
    }
  }
}



