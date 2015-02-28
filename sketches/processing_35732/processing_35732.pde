
int a = 0;
int b = 0;
int c = 0;
int ay = 0;
int by = 0;
float p = random (0,100);

void setup(){
  size ( 700,400);
  background(255);
  noStroke();
}

void draw(){
}


  
  

void mouseReleased (){
  if (mousePressed == true) {
    a = mouseX;
 ay = mouseY;
}
b = (mouseX + 50 );
c = (mouseX - 50);
by = (mouseY);
fill(p,20);
triangle(a,ay,b,by,c,by);

}

