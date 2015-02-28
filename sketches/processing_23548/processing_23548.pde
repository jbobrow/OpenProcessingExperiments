
int x = 150;
int y = 150;

void setup () {
  size(300,300);
}


void draw () {

  background(225);
  smooth();
  stroke(152,139,103);
  strokeWeight(6);
  line(x-20,y+20,x-50,y+50); //left arm
  line(x+20,y+20,x+50,y+50); //right arm
  fill(249,197,152);
  stroke(249,114,68);
  strokeWeight(2);
  ellipse(x-50,y+50,15,15); //left hand
  ellipse(x+50,y+50,15,15); //right hand

  fill(226,0,120);
  noStroke();
  rect(x-20,y+50,15,40);
  rect(x+5,y+50,15,40);
  rect(x-20,y+50,40,20); //pants

  noStroke();
  fill(58,106,116);
  ellipse(x-17,y+90,25,10); //left foot
  ellipse(x+17,y+90,25,10); //right foot

  fill(152,139,103);
  noStroke();
  rect(x-20,y,40,60); //body
  fill(75,121,123);
  ellipse(x,y+30,7,7);//1st button
  ellipse(x,y+40,7,7); //2nd button

  fill(249,197,152);
  stroke(249,114,68);
  strokeWeight(2);
  ellipse(x-40,y-20,30,30); //ear left
  ellipse(x+40,y-20,30,30); //ear right

  fill(226,0,120);
  noStroke();
  triangle(x,y-100,x-30,y-30,x+30,y-30); //hat
  ellipse(x, y-100, 15,15); //hat tip

  stroke(249,114,68);
  strokeWeight(2);
  fill(249,197,152);
  ellipse(x,y-20,80,80); //face
  
  noStroke();
  fill(207,2,38);
  ellipse(x,y,50,20); //mouth

  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(x-20,y-30,22,22); //left eye
  fill(0);
  noStroke();
  ellipse(x-20,y-25,11,11);

  stroke(0);
  fill(255);
  ellipse(x+20,y-30,20,20); //right eye
  fill(0);
  noStroke();
  ellipse(x+20,y-35,9,9);
}


