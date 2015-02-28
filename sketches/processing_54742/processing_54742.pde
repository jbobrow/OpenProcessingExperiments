
//DECLARING
Robot uno;
Robot dos;
Robot tres;

void setup()
{
  size(800,400);
  smooth();
  noStroke();
  uno = new Robot(0,0);
  dos = new Robot(250,0);
  tres = new Robot (-250,0);
}

void draw(){
  background(255);
  uno.display();
  uno.update();
  uno.wrap();
  
  //pushMatrix();
  //translate(250,0);
  dos.display();
  dos.update();
  dos.wrap();
  //popMatrix();
  
  //pushMatrix();
  //translate(-250,0);
  tres.display();
  tres.update();
  tres.wrap();
  //popMatrix();
}

void mousePressed(){
   redraw();
}

