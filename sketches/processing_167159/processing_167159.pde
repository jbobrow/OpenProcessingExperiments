
PImage SPACE;
PImage photo;
int y;
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

float eSize; // ellipse size

void setup() {
  size(500,500,P3D);
  SPACE = loadImage("SPAAAACE.jpg");
 photo = loadImage("unicorn.jpg");
   eSize = width/6;
  stroke(55,250,0);
  
}

void draw() {

  if (mouseY < 170) {
    background(SPACE);
  } else {
    background(0);
  }
  noStroke();
  translate(height/2,width/2,0);
   if (mouseX > 250) {

  }else if (mousePressed) {


  } else {


  } 
  
  beginShape();
  endShape();
  ellipse(190 , 0, 50, 50);
  
  if (mousePressed) {
image(photo,-270,-270);
}
if (mouseX>700) {
  stroke(0,0,0,0);
  fill(90, 100, 90,20);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY, 30, 30);
}
if (mouseX>500) { 
stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,50);
  ellipse(mouseX, mouseY, 30, 30);
  }
  
  if (mouseX>500) { 
stroke(0,0,0,0);
  fill(255,0,250,50);
  ellipse(mouseX, mouseY, 90, 90);
  } else {
  stroke(0,0,0,0);
  fill(250,93,0,50);
  ellipse(mouseX, mouseY, 90, 90);
  }
  
  if (mouseY>200) {
  stroke(0,0,0,0);
  fill(0,250,99,50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
  stroke(0,0,0,0);
  fill(217,250,0,50);
  ellipse(mouseX,mouseY, 30, 30);
  }
  
  if (mouseY>200) {
  
  fill(217,250,0, 50);
  ellipse(mouseX, mouseY, 30, 30);
  } else {
 
  fill(0,250,28, 50);
  ellipse(mouseX, mouseY,30,30);
  
  }
  
if (mousePressed){ 
  stroke(255);
} else{
  stroke(0);
}
{ellipse (mouseX-1, mouseY, mouseX+1, mouseY);
tint(0,0,200);
ellipse (mouseX, mouseY-50, mouseX, mouseY+50);}

  if (mouseX>400){
    fill(10, 93,250,50);
  ellipse(mouseX, mouseY-15, 100, 100);
  } else 
  stroke(0,0,0,0);
  fill(220,270,200,50);
  ellipse(mouseX, mouseY-15, 100, 100);
  }
  





