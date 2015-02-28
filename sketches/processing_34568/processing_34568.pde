
PImage canvas;
PImage brush;

void setup(){
  size(800,800);
  stroke(128);
  smooth();
  canvas = createImage(width,height,ARGB);
  brush = loadImage("brush.png");
}

void draw(){
  background(255);
  image(canvas,0,0);
  //draw cursor
  line(mouseX-5,mouseY-5,mouseX+5,mouseY+5);
  line(mouseX+5,mouseY-5,mouseX-5,mouseY+5);
  //blend brush pixels into canvas if mouse is pressed
  if(mousePressed) canvas.blend(brush, 0, 0, brush.width, brush.width, (int)(mouseX-brush.width*.5), (int)(mouseY-brush.height*.5), brush.width, brush.width,MULTIPLY);
}

