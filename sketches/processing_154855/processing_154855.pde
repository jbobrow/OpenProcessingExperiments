
PImage canvas;
PImage brush;
float counter;
PImage img;

void setup() {
  size(1480, 590);
  smooth();
  canvas = loadImage("art1.jpg");
  brush = loadImage("deer2.png");
  counter=0.0;
  img=loadImage("ballsmore.png");
}

void draw(){
  image(canvas,0,0);
  
  line(mouseX-5,mouseY-5,mouseX+5,mouseY+5);
  line(mouseX+5,mouseY-5,mouseX-5,mouseY+5);
 
  if(mousePressed) canvas.blend(brush, 0, 0, brush.width, brush.width, (int)(mouseX-brush.width*.5), (int)(mouseY-brush.height*.5), brush.width, brush.width,MULTIPLY);
  
  counter++;
  translate(width/4-img.width/6, height/2-img.height/2);
  rotate(counter*PI/180);
  // rect(-26, -26, 52, 52);
  image(img,0,0);
  }




