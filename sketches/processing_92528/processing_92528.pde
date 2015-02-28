

int x;
int y;
void setup(){
 
  size(500,500); 

}

void draw(){
  
  background(255);
  x=mouseX;
  y=mouseY;
  beginShape(TRIANGLE_STRIP);
fill(110);
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


