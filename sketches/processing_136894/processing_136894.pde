
int x = 0;
int speed = 2;
float d = random (400);
float a = random (300,400);
void setup (){
  size (400,400);
  smooth();
}
void draw(){
  //ufo
  frameRate (30);
  noStroke();
  smooth();
  background (0);
  fill (255,60);
  rect (0,300,40,100);
  rect (40,330,40,100);
  rect (80,200,50,300);
  rect (130,270,60,200);
  rect (200,300,40,100);
  rect (240,270,40,200);
  rect (290,230,45,200);
  rect (335,300,40,100);
  rect (375,350,40,100);
  fill (205,193,197);
  ellipse (x+20,10,10,10);
  fill (139,131,134);
  ellipse (x+20,15,20,5);
   x=x+speed;
  if ((x<0)||(x>=180)){
    speed=speed*-1;
  }
  {
  smooth();
  fill (67,205,128,90);
  if (mousePressed==true){
      for (int i=0; i<400;i=i+20){
      ellipse (i+x+10,i+10,i,5);
      }
      {
        fill (255,236,139);
        rect (30,350,7,7);
        rect (50,380,5,5);
        rect (240,360,5,5);
        rect (300,270,7,7);
        rect (90,240,5,5);
        rect (170,290,5,5);
        rect (340,340,7,7);
        rect (130,330,5,5);
}
}
if (mousePressed==false){
}
}
}

