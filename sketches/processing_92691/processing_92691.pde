
int angle = 30;
boolean stalk = false;
float f;

void setup() {
  size(640, 360);
  background(102);
  smooth();
  fill(0, 102);
}

void draw() {

   float x = (float)mouseY;
   f = x/360;
  drawGrass();
      stroke(0,255,0);
  if(mousePressed){
    drawHighGrass();
  }
 
}

void mousePressed(){
   strokeWeight(1);
  drawFlower();
}

void drawGrass(){

stroke(50);
 strokeWeight(1);
 float x = (random(50)+20)*f;
 float y = (random(20)-10)*f;
 line(mouseX,mouseY, mouseX+y,mouseY-x);

 }
 
void drawHighGrass(){
   strokeWeight(1);
 stroke(20); 
 float x = (random(80)+50)*f;
 float y = (random(40)-20)*f;
 line(mouseX,mouseY, mouseX+y,mouseY-x);
}

void drawFlower(){
  float x = mouseX;
  float y = mouseY;
  float y1= y-(200*f);
  float d = (20*f);
  float h = (50*f);
  float b = (50*f);
  float h1 = (40*f);
  float b1= (40*f);
  
  fill(50);
  strokeWeight(3);
  line(x,y,x,y1);
  stroke(50);
  ellipse(x,y1-d,h,b);
  ellipse(x,y1+d,h,b);
  ellipse(x+d,y1,h,b);
  ellipse(x-d,y1,h,b);
  
  ellipse(x+d,y1-d,h1,b1);
  ellipse(x+d,y1+d,h1,b1);
  ellipse(x-d,y1+d,h1,b1);
  ellipse(x-d,y1-d,h1,b1);
  
  stroke(20);
  fill(20);
  ellipse(x,y1,h1,b1);

}
