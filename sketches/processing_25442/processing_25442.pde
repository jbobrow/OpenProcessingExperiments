
void setup() {
  size (400,400);
  smooth();
  
  
}


 
void draw () {
  int x=mouseX;
  int y=mouseY;
  background(127);
  
  
  


int a = 20;
fill(219, 124, 202);
ellipse( a+50, a+50, 20, 20);
ellipse(a+ 200, a+250, a, a);
ellipse(a+100, a+300, a, a);
ellipse(a+300, a+20, a, a);
ellipse(a+250, a+60, a, a);
ellipse(a+140, a+80, a, a);
ellipse(a+300, a+200, a, a);
  
 

beginShape();
strokeWeight(2);
strokeJoin(ROUND);
fill (255, 255, 0, 200);


arc(x, y, 80, 80, radians(40), radians(330));
endShape(CLOSE);

fill(0);
ellipse(x+10, y-20, 5, 5);

}

