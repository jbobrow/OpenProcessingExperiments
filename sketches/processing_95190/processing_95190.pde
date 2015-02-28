
int WTFEYES1=200;
int WTFEYES2=-200;



void setup(){
  size(500,500);
  background(0);
  strokeWeight(4);
}

void draw(){
  fill(255,249,72);
  rect(100,250,100,100);
  rect(300,250,100,100);
  rect(125,125,250,250); //head
  fill(255);  //Color White
  WTFEYES1=WTFEYES1-1;
  WTFEYES1=max(0, WTFEYES1);
  rect(160-WTFEYES1,215,75,54); //eyes
  WTFEYES2=WTFEYES2+1;
  WTFEYES2=min(0, WTFEYES2);
  rect(265-WTFEYES2,215,75,54); //eyes
  fill(0);  //Color black
  rect(180,215,35,50);
  rect(285,215,35,50);
  fill(232,159,12);
  rect(213,275,75,40);  //mouth
  rect(213,315,75,40);  //mouth
  rect(175,375,25,25);
  rect(300,375,25,25);

}


