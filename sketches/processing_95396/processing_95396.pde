

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

//draw zoog head
fill(255);
ellipse(x+21,y-30,25,25);

//draw zoog eyes
if (mousePressed) {
fill(255);
ellipse(x+25,y-32,5,5);
ellipse(x+15,y-32,5,5);
fill(000);
ellipse(x+24,y-33,2,2);
ellipse(x+14,y-33,2,2);
} else {
fill(000);
ellipse(x+25,y-32,5,5);
ellipse(x+15,y-32,5,5);
}

//draw zoog mouth
if (mousePressed) {
// syntax for curve(x1, y1, x2, y2, x3, y3, x4, y4)
  curve(x+21,y-25,x+18,y-27,x+20, y-27,x+23,y-23);
  
} else {

fill(255);
ellipse(x+21,y-25,3,3);
}
//draw zoog feet
if(mousePressed) {
  fill(255);
  ellipse(x-20,y-100,5,5);
  ellipse(x-15,y-50,8,8);
  ellipse(x-10,y-75,6,6);
  ellipse(x-35,y-75,4,4);
  ellipse(x-4,y-35,3,3);
  ellipse(x+10,y+25,3,3);
  ellipse(x+30,y+25,3,3);
}
line(x+10,y+25,x+10,y);
line(x+30,y+25,x+30,y);

}






