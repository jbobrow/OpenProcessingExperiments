
//Tracy Carlin
//January 28,2012
//Week 3 - Conditionals and Iterations
//size(x,y)
float heartX=400.0;
float heartY=300.0;
float rightTip=heartX+225+125;
float leftTip=heartX-225-125;
//float speed = 1.0; //for side to side movement
int direction = 1; //for side to side movement
float fireOriginX = heartX+100; //source of fire - in bird mouth
float fireOriginY = heartY-195; 
float circleRadius = 10.0; // biggest circle
color beak = #FFBF58; //beak, crest and feet color
color bird = #9D0000; //tummy, wing and tail color
color bg = #B4B4B4;
int limbs = 5; //stroke Weight for neck and legs
int outline = 3; //stroke Weight for bird shapes
void setup() {
  size(800, 600);
  smooth();
}

void draw() {
  background(bg);
  makeBird();
  if(mousePressed) {
    fireBall();
  } else {
  fireOriginX = heartX+100;
  circleRadius = 10;
  
}
}

void makeBird() 
{
  leftWing();
  rightWing();
  neck();
  leftLeg();
  rightLeg();
  leftFoot();
  rightFoot();
  tail();
  body();
  crest();
  head();
  eye();
  if (mousePressed) {
  openBeak();
  }
  else {
  topBeak();
  bottomBeak();
  }
}

void leftWing() {
  fill(bird);
  strokeWeight(outline);
  //left wings - original layer
  ellipse(heartX-225, heartY, 250, 30);
  ellipse(heartX-215, heartY-30, 250, 30);
  ellipse(heartX-215, heartY+30, 250, 30);
  ellipse(heartX-205, heartY-60, 250, 30);

  //left wings - new layer
  ellipse(heartX-125, heartY, 250, 30);
  ellipse(heartX-115, heartY-30, 250, 30);
  ellipse(heartX-115, heartY+30, 250, 30);
  ellipse(heartX-105, heartY-60, 250, 30);
}
//each "feather" is 30 pix wide, 250 px long, 30 px apart veritcally and offset by about 10 px
void rightWing() {
fill(bird);
  strokeWeight(outline);
  //right wings - original layer
  ellipse(heartX+225, heartY, 250, 30);
  ellipse(heartX+215, heartY-30, 250, 30);
  ellipse(heartX+215, heartY+30, 250, 30);
  ellipse(heartX+205, heartY-60, 250, 30);

  //right wings - new layer
  ellipse(heartX+125, heartY, 250, 30);
  ellipse(heartX+115, heartY-30, 250, 30);
  ellipse(heartX+115, heartY+30, 250, 30);
  ellipse(heartX+105, heartY-60, 250, 30);
}
//neck
void neck() {
  strokeWeight(limbs);
  line(heartX, heartY-100, heartX, heartY-200);
}

void leftLeg() {
  //legs
  strokeWeight(limbs);
  line(heartX-40, heartY-50, heartX-40, heartY+200);
}
void rightLeg() {
  strokeWeight(limbs);
  line(heartX+40, heartY-50, heartX+40, heartY+200);
}

void leftFoot() {
  //feet - left
  strokeWeight(outline);
  fill(beak);
  rect(heartX-50, heartY+200, 20, 50);
  rect(heartX-65, heartY+200, 15, 30);
  rect(heartX-30, heartY+200, 15, 30);
}

void rightFoot() {
  //feet - right
  fill(beak);
  strokeWeight(outline);
  rect(heartX+30, heartY+200, 20, 50);
  rect(heartX+15, heartY+200, 15, 30);
  rect(heartX+50, heartY+200, 15, 30);
}

void tail() {
  fill(bird);
  strokeWeight(outline);
  //tail
  rect(heartX-195, heartY+55, 150, 30);
  //plume one
  rect(heartX-195, heartY+85, 30, 100);
  //plume two
  rect(heartX-165, heartY+155, 60, 30);
  //plume 3
  rect(heartX-135, heartY+105, 30, 50);
  //final plume
  rect(heartX-155, heartY+105, 20, 30);
}

void body() {
  //body
  //desired color = red
  fill(bird);
  strokeWeight(outline);
  //fill(255,0,0);
  ellipse(heartX, heartY, 200, 200);
}

void crest() {
  //crest
  fill(beak);
  strokeWeight(outline);
  rect(heartX-40, heartY-265, 50, 15);
  rect(heartX-60, heartY-275, 50, 10);
}

void head() {
  //head (main)
  fill(bird);
  strokeWeight(outline);
  ellipse(heartX, heartY-200, 100, 100);
}

void eye() {
  eyeball();
  pupil();
}

void eyeball() {
  //eyeball
  strokeWeight(2);
  fill(255);
  //it's blue because I say so
  ellipse(heartX+15, heartY-210, 25, 25);
}
void pupil() {
  //eye - pupil
  strokeWeight(1);
  fill(0);
  ellipse(heartX+15, heartY-210, 10, 10);
  strokeWeight(3);
}

void topBeak() {
  //beak (upper)
  fill(beak);
  ellipse(heartX+85, heartY-200, 70, 20);
}

void bottomBeak() {
  //beak (lower)
  fill(beak);
  ellipse(heartX+65, heartY-185, 30, 10);
}

void fireBall() {
  if (fireOriginX<=width-circleRadius) {
  //creating the fireball
  strokeWeight(1);
  fill(#D60D0D); //red
  //tail
  fill(#D60D0D); //red
  triangle(fireOriginX,fireOriginY-circleRadius/2,fireOriginX,fireOriginY+circleRadius/2,fireOriginX-circleRadius,fireOriginY);
  //ball
  fill(#D60D0D); //red
  ellipse(fireOriginX, fireOriginY, circleRadius, circleRadius);
  fill(#FFA703); //orange
  ellipse(fireOriginX, fireOriginY, circleRadius-5, circleRadius-5);
  fill(#FFF303); //yellow
  ellipse(fireOriginX, fireOriginY, circleRadius-9.5, circleRadius-9.5);
  }
  circleRadius = circleRadius + .5; //gets bigger as it moves
  fireOriginX = fireOriginX+1; //moves to the right
  //reset the drawing defaults
  outline = 3;
  strokeWeight(outline);
  stroke(0);
}

void openBeak() {
  rotate(radians(-1));
  topBeak();
  rotate(radians(2));
  bottomBeak();
}
//heartX+=speed*direction; //from processing pg. 280, 
//we are adding 1 to the heartx value and multiplying it by the direction
// the direction changes thanks to the if statement
//to get the bird to the right, 
//the "heart" must be on the right side of the screen AND
//and the tips should just touch the sides
//if ((heartX+350>width) || (heartX-350<0)) { //this if statement moves the bird to the right 
//until the tips hit the side of the screen
//direction = -direction; //makes the value of direction positive or negative only when wing tips go beyond the bounds of the screen 
//} 


