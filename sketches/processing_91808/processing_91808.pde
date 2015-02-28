
int angle = 30;
boolean stalk = false;

void setup() {
  size(640, 360);
  background(102);

  fill(0, 102);
}

void draw() {
  drawGrass();
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
 float x = random(50)+20;
 float y = random(20)-10;
 line(mouseX,mouseY, mouseX+y,mouseY-x);

 }
 
void drawHighGrass(){
   strokeWeight(1);
 stroke(20); 
 float x = random(80)+50;
 float y = random(40)-20;
 line(mouseX,mouseY, mouseX+y,mouseY-x);
}

void drawFlower(){
  fill(50);
 strokeWeight(3);
  line(mouseX,mouseY,mouseX,mouseY-200);
  ellipseMode(CORNER);
  stroke(50);
  ellipse(mouseX,mouseY-200,50,50);
  ellipse(mouseX,mouseY-200,-50,50);
  ellipse(mouseX,mouseY-200,50,-50);
  ellipse(mouseX,mouseY-200,-50,-50);
  
   ellipse(mouseX-25,mouseY-200,60,60);
  ellipse(mouseX,mouseY-200-25,-60,60);
  ellipse(mouseX,mouseY-200+25,60,-60);
  ellipse(mouseX+25,mouseY-200,-60,-60);
  
  ellipseMode(CENTER);
  stroke(20);
  fill(20);
  ellipse(mouseX,mouseY-200,30,30);

}


