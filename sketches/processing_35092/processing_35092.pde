
void setup() {
  size(200, 200);
  frameRate(30);
}

int x = 0; 

void draw() {
  background(126,151,175); 
  strokeWeight(2); 
  line(x, 0, x, height);
  x++;
  
  //black rectangles disappearing
  strokeWeight(0.5);  
  fill(0); 
  int a = 50; 
  rect(x,a,200,10); 
  int b = 100;
  rect(x,b,200,10);
  int c = 150; 
  rect(x,c,200,10);
 
 //small circle both axis
  smooth(); 
  fill(0,99); 
  ellipse(x, x, 75, 50);
  x++; 
 
  //revealing circles 
  fill(0); 
  ellipse(c-95,a+5,10,10); 
  ellipse(c-40,a+55,10,10); 
  ellipse(c+15,a+105,10,10); 

 //large circle y axis
  int y = 0;
  fill(148, 188, 137); 
  ellipse(x, y, 100, 100);
  ellipse(y, x, 90, 90);
  x--;

}


