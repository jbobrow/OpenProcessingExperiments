
float diam;
int x = 0;
float y;
float ySpeed;

int xpos = 5;

void setup(){
  noStroke();
  background (0);
  size(600,600);
  diam = 2;
  ySpeed = 2;

}

void draw (){
  background (0);
  int xpos = x;


for (int i=0;i<6;i = i+1){

  fill(255);
  ellipse(xpos,y,diam,diam);
  xpos = xpos + 140;

}

y = y + ySpeed;

if (y>height){
  ySpeed = - ySpeed;
}

if (y<0){
  y = 0;
  ySpeed = -ySpeed;
}

diam = diam +.25;

if (diam>20){
  diam = 0;

println(x);
}}


