
int a=0;
int b=0;
int secx=415;
int x=110;
float r=0;
float g=0;
float l=0;
PImage violinback;
void setup() {
  size(500,400);
 violinback=loadImage("data/darkwood.jpg"); 
}
void draw() {
  image(violinback,0,0,500,400);
  smooth();
if (mousePressed) {
  if(mouseButton==LEFT) {
  translate(mouseX-215,mouseY-210);
}
}
/*if (keyPressed) {
  if(keyCode==UP) {
    rotate(QUARTER_PI);
  }
}
if (keyPressed) {
  if(keyCode==DOWN) {
    rotate(QUARTER_PI*-1);
  }
}*/
pushMatrix(); 
//treble cleff
beginShape();
strokeJoin(ROUND);
vertex(90-a,250-b);
strokeWeight(6);
stroke(r,g,l);
noFill();
vertex(80-a,240-b);
vertex(90-a,230-b);
vertex(110-a,250-b);
vertex(90-a,270-b);
vertex(60-a,240-b);
vertex(90-a,210-b);
vertex(130-a,250-b);
vertex(90-a,290-b);
vertex(40-a,240-b);
vertex(110-a,170-b);
vertex(90-a,120-b);
vertex(70-a,170-b);
vertex(90-a,190-b);
vertex(90-a,330-b);
vertex(60-a,300-b);
endShape();
popMatrix();

strokeWeight(3);
//staff
line(x,190,secx,190);
line(x,210,secx,210);
line(x,230,secx,230);
line(x,250,secx,250);
line(x,270,secx,270);
rectMode(CENTER);
fill(r,g,l);
pushMatrix();
//notes
rect(150,270,25,20);
line(162,270,162,185);
rect(220,240,25,20);
rect(275,230,25,20);
rect(335,220,25,20);
rect(395,220,25,20);
line(232,240,232,155);
line(287,230,287,145);
line(347,220,347,135);
line(407,220,407,135);
line(232,155,287,145);
popMatrix();
if(mousePressed) {
  if(mouseButton==RIGHT){   
 r=random(200);
  g=random(100);
  l=random(255);
  }
   
 }



}


