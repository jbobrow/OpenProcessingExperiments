

void setup(){
  background(152,245,255);
  size(400,400);
}

int x=0;
int speed=3;
void draw (){
  background(152,245,255);
   //grass
   fill(50,127,89);
   noStroke();
   rect(0,200,400,200);
   //outer green
   strokeWeight(6);
   stroke(0,100,0);
   fill(0,100,0);
   ellipse(20,350,500,120);
   //inner green
   noStroke();
   fill(113,198,113,100);
   ellipse(40,350,300,60);
   //flag
   stroke(0);
   line(20,50,20,350);
   strokeWeight(3);
   fill(255,48,48);
   triangle(20,50,100,100,20,100);
   //ball
   frameRate(30);
  strokeWeight(1);
  fill(255);
  stroke(0);
  ellipse(x,300,10,10);
  x=x+speed;
  if ((x<0)||(x>=400)){
    speed=speed*-1;
  }
}


