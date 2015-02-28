
void setup(){
size(500,500);
}

void draw(){
  
  
background(255);

  myOOOO(0,0,1,255);
  myOOOO(300,0, 0.5,100);
}
void myOOOO(int x, int y, float s,int c) {
  translate(x,y);
  scale(s);
fill(c,180,20);
noStroke();
ellipse(200,200,160,180);

fill(134,201,20);
triangle(185,140,210,70,230,120);
triangle(185,140,155,90,210,120);
triangle(204,145,240,80,230,120);

stroke(2);
strokeWeight(3);
strokeCap(ROUND);
line(145,160,165,141);
line(210,190,237,171);
line(145,140,165,161);
line(210,170,237,191);
}

