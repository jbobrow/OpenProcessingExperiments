
int x; 
int y; 

int d;

int r;
int g;
int b;
int a; 
void setup (){ 
  size (400,400);
  background(255); 
}
  void draw(){
 ellipseMode(CENTER);
ellipse(mouseX,mouseY,d,d);


x=int(random(300));
y=int(random(200));
d=int(random(100));
r=int(random(255));
g=int(random(255));
b=int(random(255));
a=int(random(255));

}
void mousePressed(){
  fill(r,g,b,a);
ellipse(mouseX,mouseY,d,d);
}


