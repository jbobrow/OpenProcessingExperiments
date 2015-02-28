
//Horace Hou
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section A
//9.11.12

float randomdiameter= 0;     //global variable - float
float strokegray = 0;        //global variable - float

void setup() {
 size(1200,600);
 background(255,0,0);
  for(int i=0; i<300;i=i+3) {
  smooth();
    stroke(190,0,0);
  strokeWeight(1);
  line(i,0,i*10,600);
}


}

void draw() {

  for(int i=1200;i>400;i=i-15){
  stroke(255,200,0);
  strokeWeight(3);
  line(100,i,i*4,30);
}
  smooth();
  stroke(strokegray);
  strokeWeight(3);
  fill(255,127,0);
  //randomdiameter = random(20,100);
  if (randomdiameter <100){
    randomdiameter++;
  }
  else{
    randomdiameter=0;
  }
  
  rect(mouseX,mouseY,randomdiameter,randomdiameter*2);
  strokeWeight(2);
  fill(0,0,128);
  ellipse(random(1200),random(600),randomdiameter,randomdiameter);

}
void mouseClicked() {
  if(strokegray==0) {
    strokegray = 255;
  }
  else{
    strokegray=0;
  }
}


void keyPressed(){
 if (key =='s'){
  save ("HoraceHou.png"); 
 }
 
 if (key =='p'){
for(int i=0; i<300;i=i+3) {
  stroke(190,0,0);
  strokeWeight(1);
  line(i,0,i*10,600);
}
 }
 
 if (key =='f'){
   noStroke();
   fill(255, 192, 203);
   rect(0,0,width,height);
 }
}
