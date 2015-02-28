
PImage carbone;
void setup(){
  size(504,360);
  //strokeWeight(.1);
  //stroke(0,15);
  smooth();
  carbone = loadImage("carbone.gif");

  for(int i=0; i<100000; i++){
    int x=int(random(width));
    int y=int(random(height));
    color cp= carbone.get(x,y);
    float bright = brightness(cp);
     if(bright==0){
       rect(x,y,9,10);
       fill(random(150));
         }
 
  }
}
