
float circlex =230;
float circley =140;
float circlespeedx = -5;
float circlespeedy = -3;
int direction = 1;
void setup(){
  size(700, 700);
}

float r1=0;
int d=0;

void draw(){
  background(#F2AA89);
  circlex = circlex + circlespeedx;
  circley = circley + circlespeedy;
  noStroke();
//  fill(circlex,circley);
//  ellipse(circlex, circley, 200, 200);
arc(circlex,circley, 100,100, QUARTER_PI-r1,PI+HALF_PI+QUARTER_PI+r1);
if(QUARTER_PI-r1<=0)
  r1=0;
  if(d>=700)
  d=-100;
  r1=r1+0.05;
  d=d+5;


//if the circley goes off top screen
//put the circle on screen
//if circley is negative
  if (circley < 0){
  circlespeedy = 2;
  fill(#F7432F);
  }
//if the circley goes off bottom screen
//if the circley is greater than height 
  if (circley > height){
  circlespeedy = -3;
    fill(#2FF7F6);

  }
//if the circlex is of the left screen
//if the circlex is smaller than 0 
  if (circlex < 0){
  circlespeedx = 5;
  fill(#9B764E);

  }
//if the circlex is of the right screen
//if the circlex is greater than width 
  if (circlex > width){
  circlespeedx = -3;
  fill(#CBB912);

  }
}

