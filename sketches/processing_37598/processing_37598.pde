
int x=150;
int y=100;
int a=1;
int b=1;
 
void setup () {
  size (300,200);
  smooth();
  //frameRate(10);
}
 
void draw() {
  background(128);
  noStroke();
  ellipse(x,y,10,10);
  stroke(255);
  line(mouseX-10,height-10,mouseX+10,height-10);
  line(mouseX-10,10,mouseX+10,10);
  line(10,mouseY-10,10,mouseY+10);
  line(width-10,mouseY-10,width-10,mouseY+10);
  x=x+1*a; 
  y=y+1*b;
  println(x);
  
  if(((x-5==10) && ((y>mouseY-10) && (y<mouseY+10))) || (x+5==width-10) && ((y>mouseY-10) && (y<mouseY+10))) 
  {
    a=a*-1;     
  }
   
  if(((y-5==10) && ((x>mouseX-10) && (x<mouseX+10))) || ((y+5==height-10) && ((x>mouseX-10) && (x<mouseX+10))))
  {
    b=b*-1;
  }  
}

