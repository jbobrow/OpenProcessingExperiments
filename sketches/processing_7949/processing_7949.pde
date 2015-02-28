
float ang; 
float vx,vy;
void setup(){
  size(500,500);
  smooth();
  background(0,255,0);
}
void draw(){
  nero2(250,300);
 
  scale(2.4);
  rotate(ang);
  nero(100,250);
   nero(125,250);
  nero(150,250);
   nero(175,250);
  nero(200,250);
  nero(225,250);
   nero(250,250);
  nero(275,250);
   nero(300,250);
  nero(325,250);
   nero(350,250);
  nero(375,250);
   nero(400,250);
}
void nero(float x,float y){
  pushMatrix();
  
  translate(x,y);
  rotate(x+millis()/100.0);
  fill(255,0,0);
  ellipse(0,0,100,100);
    rotate(y+millis()/100.0);
  fill(0,0,0);
  ellipse(25,0,50,50);
  fill(255,0,0);
  rect(0,200,400,400);
  fill(100,255,100);
  triangle(100,200,100,100,200,100);
  
 popMatrix();
 }
void nero2(float a,float b){
  scale(0.4);
rotate(ang);
  nero(100,250);
   nero(125,250);
  nero(150,250);
   nero(175,250);
  nero(200,250);
  nero(225,250);
   nero(250,250);
  nero(275,250);
   nero(300,250);
  nero(325,250);
   nero(350,250);
  nero(375,250);
   nero(400,250);
}

