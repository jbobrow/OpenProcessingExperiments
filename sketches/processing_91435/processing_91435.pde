
//PImage sky;
int x=50;
int y=50;
int x2=150;
int spacing=10;
float r,g,b;

void setup() {
 //sky=loadImage("sky.jpg");
 size(400, 400);
 //image(sky,mouseX,mouseY,950,570);
  //kept getting an error =(
 background(14,255,145);
 //tried 2 load an image to make it more interesting~~~ gave up
}
void draw () {

  while(y<=height){
    stroke(0);
    fill(r,g,b);
    ellipse(x,y,40,40);
    ellipse(x2,y,40,40);
    y=y+spacing;
  
  
    r=random(190); 
    g=random(50);
    b=random(255);
  }
    
  { 
  rectMode(CENTER);
  stroke(0);
  fill(0);
  rect(100, 100, 20, 100);
  fill(36, 39, 111);
  rect(100, 80, 20, 100);

  fill(255);
  ellipse(100, 70, 70, 60);

  ellipse(80, 70, 30, 30);
  fill(0);
  ellipse(80, 70, 20, 20);
  noFill();
  ellipse(120, 70, 30, 30);
  fill(0);
  ellipse(120, 70, 20, 20);

  fill(150, 0, 0);
  ellipse(100, 90, 20, 15);

  stroke(0);
  fill(255);

  line(90, 150, 80, 160);

  line(110, 150, 120, 160);

  stroke(0);
  fill(255);

  line(90, 100, 50, 120);

  line(110, 100, 150, 120);
}}
