
int x = 0;
int speed = 2;
void setup (){
size (300,300);
smooth ();
}
void draw (){
  spider ();
}
void spider (){
  frameRate (30);
  background (x+150,x+100,x+100);
  smooth ();
  //web
  strokeWeight (3);
  stroke (205,193,197);
  line (150,x,150,0);
  noStroke ();
  fill (0);
  //body
  ellipse (150,x,35,35);
  ellipse (150,x+20,15,15);
  strokeWeight (2);
  stroke (0);
  //left legs
  line (150,x,130,x-20);
  line (130,x-20,125,x-15);
  line (150,x,125,x-5);
  line (125,x-5,120,x);
  line (150,x,125,x+10);
  line (125,x+10,123,x+15);
  line (150,x,125,x+25);
  line (125,x+25,135,x+35);
  //right legs
  line (150,x,170,x-20);
  line (170,x-20,175,x-15);
  line (150,x,175,x-5);
  line (175,x-5,180,x);
  line (150,x,175,x+10);
  line (175,x+10,177,x+15);
  line (150,x,175,x+25);
  line (175,x+25,165,x+35);
  //eyes
  noStroke ();
  fill (139,37,0);
  ellipse (146,x+25,5,5);
  ellipse (154,x+25,5,5);
  //back
  triangle (143,x+5,150,x-5,157,x+5);
  triangle (143,x-10,150,x,157,x-10);
  x=x+speed;
  if ((x<0)||(x>=180)){
    speed=speed*-1;
  }
}
