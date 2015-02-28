
void setup () {
  size (400,400);
  smooth();
  frameRate (30);
  
}




int x=100;
int frank=340;
int speed=20;
int speed2= 12;

void draw(){}
void mousePressed () {
  fill (70,100,210);
  background(40,40,250);
  fill (250,(int(random(20))),40,250);
  ellipse (x,frank,20,20);
  fill (250);
  ellipse (0,400,100,100);
  fill (20);
  quad (40,390,10,360,100,320,120,350);
  if (mouseX >200){
    ellipse (x,frank,30,30);
  }
  x=x+speed;
  frank=frank-speed2;
  if ((x<20)||(x>=380)){
    speed=speed*-1;
  }
  if ((frank<20)||(frank>380)){
    speed2=speed2*-1;
  }
  }


