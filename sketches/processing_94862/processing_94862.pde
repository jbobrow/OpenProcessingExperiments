

void setup(){
background(255);//background color white
size(275, 240);//size of canvas
noStroke();//no stroke
colorMode(HSB);//what type of color it is going to be
}
int col=0;//defines col
void draw(){
  background(col, 255, 255);//changes color
  jack(110, 10);//calls jack
}
void mousePressed(){
  col+=5;//add 34 to col
  col%=255;//changes the color
  println(col);//what the name is
}

void jack(int x, int y){
 fill(167, 150, col);//changes color
 rect(110, 10, 70, 10);//top of head(in order)
 rect(90, 20, 20, 10);//to the right of top of head(in order)
 rect(70, 30, 20, 10);
 rect(60, 40, 10, 10);
 rect(50, 50, 10, 10);
 rect(40, 60, 10, 20);
 rect(30, 80, 10, 20);
 rect(20, 100, 10, 60);//the far right of head(in order)
 rect(30, 150, 10, 30);//to the left of far right of head(in order)
 rect(40, 160, 10, 10);//rigth part of mouth
 rect(40, 180, 10, 10);
 rect(50, 190, 10, 10);
 rect(60, 200, 10, 10);
 rect(70, 210, 20, 10);
 rect(90, 220, 60, 10);//bottom of head(in order)
 rect(150, 210, 40, 10);//to the right of bottom of head(in order)
 rect(190, 200, 20, 10);
 rect(200, 190, 20, 10);
 rect(220, 180, 10, 10);
 rect(230, 130, 10, 50);
 rect(240, 80, 10, 80);//far right of head
 rect(230, 60, 10, 20);//to the left of the far part
 rect(220, 50, 10, 20);
 rect(210, 40, 10, 10);
 rect(200, 30, 10, 10);
 rect(180, 20, 20, 10);//the 10x20 right before the top of the head
 //mouth
 rect(220, 150, 10, 20);//first part on left (in order from left to right)
 rect(210, 170, 10, 10);
 rect(200, 160, 10, 20);
 rect(190, 180, 10, 10);//right of +
 rect(180, 170, 10, 30);//middle of +
 rect(170, 180, 10, 10);//left of +
 rect(80, 190, 90, 10);//long rectangle in middle of mouth
 rect(150, 180, 10, 10);//the top, right one in middle of mouth
 rect(140, 200, 10, 10);//the bottom, right one in middle of mouth
 rect(120, 180, 10, 10);//the 2nd top, in middle of mouth
 rect(110, 200, 10, 10);//the 2nd botttom, in middle of mouth
 rect(100, 180, 10, 10);//the 3rd top, in middle of mouth
 rect(90, 200, 10, 10);//the last bottom , left one in middle of mouth
 rect(70, 170, 10, 20);
 rect(60, 180, 10, 10);
 rect(50, 170, 10, 10);//end of mouth
 //nose
 rect(100, 130, 10, 10);//left nostril
 rect(120, 130, 10, 10);//right nostril, end of nose
 //eyes
 rect(120, 100, 10, 10);//right eye, far left of eye(from left to right , in order)
 rect(130, 80, 10, 30);
 rect(140, 70, 10, 50);
 rect(150, 60, 10, 70);
 rect(160, 50, 10, 90);
 rect(170, 140, 10, 10);//single square on bottom of eye
 rect(170, 40, 10, 90);
 rect(180, 50, 10, 80);
 rect(190, 60, 10, 60);
 rect(200, 70, 10, 30);//end of right eye
 rect(90, 100, 10, 10);//left eye, far right of eye(from right to left , in order)
 rect(80, 90, 10, 40);
 rect(70, 80, 10, 60);
 rect(60, 70, 10, 70);
 rect(50, 80, 10, 50);//far left of left eye
 rect(50, 140, 10, 10);//the single square on bottom of eye
}


