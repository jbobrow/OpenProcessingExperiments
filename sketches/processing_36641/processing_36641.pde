
void setup() {
  size(500, 250);
  background(122, 140, 247);
  smooth();
  noStroke();
  fill(244);
  ellipse(450, 70, 50, 50);
}

float count=0;
float num=500;
float x;
float y;

void draw() {
  y=random(-height);//varying heights
  fill(175);
  rect(0, 220, width, 30);
  //x=random(50, 70);
  if (count < num) {//stops the skyline at the width of the screen
    //if (num % 20== 0) {
    fill(40);
    rect(count * 50, height, random(10, 70), y);
  } 
  else {
    rect(count, height-20, 20, 20);
  }
  //if(y>= -300){
  //// if(random(30,70)>=30 &&  random(30,70)<=50){
  //fill(255);
  //rect(count*60,random(10,70), 20,20);







  count++;
  //num++;
}



