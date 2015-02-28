

int x;
int y;

color red= color(255,0,0);
color green= color(0,255,0);
color blue= color(0,0,255);
color yellow=color(255,255,0);
color purple=color(255,0,255);

void setup(){
 
  size(500,500); 


}

void draw(){
  background(255);
 
  x=mouseX;
  y=mouseY;
  println(x);
  beginShape(TRIANGLE_STRIP);
  
//draw zoogs body
if (mouseX<width/2 &&mouseY<height/2) {
 fill(yellow); 
} else if (mouseX<width/2 &&mouseY>height/2) {
fill (blue);
}

if (mouseX>width/2 && mouseY<height/2) {
 fill(red); 
} else if (mouseX>width/2&&mouseY>height/2) {
 fill(green);
}

if (mousePressed) {
 fill(purple); 
} 

vertex(x, y);
vertex(x+10, y-20);
vertex(x+20, y);
vertex(x+30, y-20);
vertex(x+40, y);
endShape();

fill(255);
ellipse(x+21,y-30,25,25);
fill(000);
ellipse(x+25,y-32,5,5);
ellipse(x+15,y-32,5,5);
fill(255);
ellipse(x+21,y-25,3,3);

line(x+10,y+25,x+10,y);
line(x+30,y+25,x+30,y);

}






