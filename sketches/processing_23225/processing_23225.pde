
void setup(){
  size(500,500);
  background(77,247,203);
//circle
stroke(136,77,247);
fill(136,77,247);
ellipse(250,250,450,300);
//nose
fill(247,242,77);
rect(225,220,50,30);
//mouth
ellipse(250,325,300,125);
//left ear
stroke(136,77,247);
fill(136,77,247);
ellipse(30,250,50,80);
//right ear
stroke(136,77,247);
fill(136,77,247);
ellipse(470,250,50,80);

}
void draw(){
}

void mousePressed(){
  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,130,130);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,100,100);
}

void keyPressed(){
    background(77,247,203);
//circle
stroke(136,77,247);
fill(136,77,247);
ellipse(250,250,450,300);
//nose
fill(247,242,77);
rect(225,220,50,30);
//mouth
ellipse(250,325,300,125);
//left ear
stroke(136,77,247);
fill(136,77,247);
ellipse(30,250,50,80);
//right ear
stroke(136,77,247);
fill(136,77,247);
ellipse(470,250,50,80);
}

