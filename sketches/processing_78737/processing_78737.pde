
void setup() {

  size(400, 400);
  smooth();
  background(255);
}//end of setup

void draw() {
  noStroke();

  //seconds arc

  fill(200, 100, 100);
  arc(width/2, height/2, 150, 150, 0, radians(360/60)*second()+radians(6));
  fill(255);
  ellipse(width/2, height/2, 140, 140);

  if (second() == 0){
    ellipse(width/2, height/2, 151, 151);
  };

  //minutes arc

  fill(100, 200, 100);
  arc(width/2, height/2, 120, 120, 0, radians(360/60)*minute());
  fill(255);
  ellipse(width/2, height/2, 110, 110);

  if (minute() == 0){
    ellipse(width/2, height/2, 121, 121);
  };


  //hours arc

  fill(100, 100, 200);
  arc(width/2, height/2, 100, 100, 0, radians(360/24)*hour());
  fill(255);
  ellipse(width/2, height/2, 90, 90);
  
    if (hour() == 0){
    ellipse(width/2, height/2, 101, 101);
  };
}//end of draw
