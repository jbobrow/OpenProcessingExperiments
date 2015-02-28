
PFont beth;
String bill = "L3X";
String steve = "1R3";

void setup(){
  size(250,250);
  smooth();
  beth = createFont("Arial",200);
}
 
 
void draw(){
  background(0,0,255);
  fill(255,180,0,50);
  textFont(beth,60);
  for(int i=0;i<200;i++){

    rotate(radians(random(20)));
    text(bill,random(150),random(150));
    text(steve,random(240),random(240));
    if(mousePressed){
      rect(250,250,width,height);
      fill(0,0,255,20);
      if(keyPressed){
        rect (250,250,width,height);
        fill(255,0,90);
      }
    }
  }
  
  }

