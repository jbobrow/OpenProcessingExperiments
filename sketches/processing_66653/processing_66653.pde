
 int startTime=millis();
int intervalTime=500;
  int currentTime;

void setup() {
  size(800, 800);
frameRate(12);
 smooth();
  background(0);


}

void draw(){

  currentTime = millis();
   PImage b;
  b = loadImage("Unknown.png");
  imageMode(CENTER);
   fill(0,80);
   rect(0,0,width,height);

   if(currentTime-startTime >= intervalTime){
   for (int i=0; i<3; i++) {  
 Vortex(int(random(width)), int(random(height)),0.3,1); 
 startTime=millis();
   }
   }

Vortex(width/2,height/2,1,2);
image(b, width/2, height/2);


}


void Vortex(int xloc, int yloc, float transp, int sWeight) {    
    for (int i=0; i<60; i++) {
      stroke(255,255-sq(transp*i));
      strokeWeight(sWeight);
      noFill();
      ellipse(xloc, yloc, sq(1.2*i), sq(1.2*i));
    }
}






/*void mouseClicked(){ 
 int vortexacel=10;
 for (int i=0; i<20; i++){
 stroke(255,255-12*i);
 noFill();
 ellipse(mouseX,mouseY,(20*i)+vortexacel, (20*i)+vortexacel);
 
 } */



