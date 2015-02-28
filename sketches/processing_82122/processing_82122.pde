
float angle = 0;
float xAmount=0;
float yAmount=0;
float d=50;
int changeColor = 1;

void setup() {
  size(800, 600);
  strokeWeight(2); 
}
 
 void draw() {
 if(changeColor>255){
  changeColor=0; 
 }
    changeColor++; 
  
  
 textSize(32);
 fill(50);
 eye();
 eye2();
 eyeFrame();
 text(mouseX,-390,-260);
 text(changeColor,-390,-220);

}

void eyeFrame(){
fill(255,20);
strokeWeight(6);
stroke(0, 0, 0);
bezier(-290, 0, 90, -250, -30, -90, 380, 20);
bezier(-290, 0, 70, 260, 90, 90, 380, 20);
}
 
 void eye(){
   // FLOATS
   float distance=40;
   float x1=map(mouseX,0,600,xAmount-distance,xAmount+distance);
   float y1=map(mouseY,0,400,yAmount-distance,yAmount+distance);
   //EVERYTHING ELSE  
  background(25);
  stroke(20);
  rectMode(CENTER);
  colorMode(HSB);
  translate(width/2,height/2);
  color(255,100,80); 
  strokeWeight(60);
  int counter =0 ; 
  noFill();
  strokeWeight(20);
     
      //Lines in eye
      while(counter<60) {
      stroke(changeColor,changeColor+10,changeColor*10-3,80);
      line(x1,y1,0,100);
      rotate(radians(6));
      counter++;
      }
 }


void eye2(){
  noStroke();
  fill(200);  
  //Right
    ellipse(300,200,120,80);
    float xAmount2=280;
    float yAmount2=180;
    float distance2=50;
  //Left
    ellipse(160,200,120,80);
    float xAmount3=150;
    fill(25);
    float x2=map(mouseX,0,800,xAmount2-distance2,xAmount2+distance2);
    float y2=map(mouseY,0,600,yAmount2-distance2,yAmount2+distance2);
    float x3=map(mouseX,0,800,xAmount3-distance2,xAmount3+distance2);
    float y3=map(mouseY,0,600,yAmount2-distance2,yAmount2+distance2);
   //Right
    ellipse(x2,y2,d,d);
   //Left
    ellipse(x3,y3,d,d);
}
