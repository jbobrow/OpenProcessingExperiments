

int w = 300;
int h = 300;

void setup () {
  size(w,h);
}


void draw () {
  int x = mouseX;
  int y = mouseY;

  background(225);
  smooth();



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

  //facial expression
  if((x>w/2)) { 
    stroke(249,114,68);
    strokeWeight(2);
    fill(249,197,152);
    ellipse(x,y-20,80,80); //face

    noStroke();
    fill(207,2,38);
    arc(x,y,50,20,0,PI); //mouth
    fill(255);
    rect(x-20,y,10,5);

    stroke(0);
    strokeWeight(1);
    fill(255);
    arc(x-20,y-30,22,22,PI,TWO_PI); //left eye outer
    line(x-31,y-30,x-9,y-30);
    fill(0);
    noStroke();
    ellipse(x-20,y-37,5,5);//inner

    stroke(0);
    fill(255);
    arc(x+20,y-30,20,20,PI,TWO_PI); //right eye
    line(x+10,y-30,x+30,y-30);
    fill(0);
    noStroke();
    ellipse(x+20,y-35,9,9);

    stroke(152,139,103);
    strokeWeight(6);
    line(x-20,y+20,x-60,y-10); //left arm
    line(x+20,y+20,x+60,y-10); //right arm
    fill(249,197,152);
    stroke(249,114,68);
    strokeWeight(2);
    ellipse(x-60,y-10,15,15); //left hand
    ellipse(x+60,y-10,15,15); //right hand
  } 
  else {
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

    stroke(152,139,103);
    strokeWeight(6);
    line(x-20,y+20,x-50,y+50); //left arm
    line(x+20,y+20,x+50,y+50); //right arm
    fill(249,197,152);
    stroke(249,114,68);
    strokeWeight(2);
    ellipse(x-50,y+50,15,15); //left hand
    ellipse(x+50,y+50,15,15); //right hand
  }
}


