
//Pick a theme or central focus
import ddf.minim.*;

Minim minim;
AudioSample scream;

void setup(){
  size(800,600);
  background(255);
  minim=new Minim(this);
  scream=minim.loadSample("scream.mp3");
}
// Bat
void draw(){
  if (mousePressed)scream.trigger();
  if(mousePressed)background(#FF0000);
  if (mousePressed){
  fill(#000000);
  triangle(370,160,375,140,380,160);
  triangle(420,160,425,140,430,160);
  triangle(100,320,400,500,700,320);
  triangle(250,200,100,320,400,320);
  triangle(550,200,700,320,400,320);
  fill(#151515);
  triangle(390,420,400,500,410,420);
  noStroke();
  fill(#000000);
  ellipse(400,200,100,100);
  ellipse(400,320,150,200);
  stroke(#151515);
  arc(400,205,40,40,0,3.14);
  ellipse(400,200,20,25);
  fill(#ffffff);
  ellipse(380,180,20,10);
  ellipse(420,180,20,10);
  fill(#000000);
  ellipse(380,180,5,5);
  ellipse(420,180,5,5);
  fill(#ffffff);
  ellipse(395,206,5,7);
  ellipse(405,206,5,7);
  stroke(#151515);
  fill(#000000);
  beginShape();
  vertex(350,380);
  vertex(325,430);
  vertex(350,480);
  vertex(365,480);
  vertex(335,430);
  vertex(365,380);
  endShape();
  beginShape();
  vertex(450,380);
  vertex(470,430);
  vertex(450,480);
  vertex(435,480);
  vertex(460,430);
  vertex(435,380);
  endShape();
  frame.setTitle(mouseX + ", " + mouseY);
  }
}
void keyReleased(){
   if(key==DELETE)background(#FFFFFF);
   if(key=='s'||key=='S')saveFrame("image.jpg");
   if(key=='b'||key=='B')background(#006464);
}

