
int i;
int dir= 1;
int x= 0;
int y= 0;
int value= 0;

void setup(){
  size (600, 450); //sets size to 600 pixels by 450 pixels
  background (125, 240, 50); //sets the background color 
  frameRate(30); //sets the frame rate
  strokeWeight(25); //sets how deep the strokes are
}

void draw() {
  x= (x+3) % 400; //defines how fast the pikachu moves
  y= (y+1) % 50; //defines how fast the pikachu moves
  background(125, 240, 50); //defines the background color
  fill(value);
  if (random(0,3) < 1) { //if the value is less than one then the strok will be the one below
    stroke(255, 200, 100); //stroke set to this color
  } else{
    stroke (random(0,255), random(0 , 255), random(0, 255)); //if value is not less than one, the stroke will be random
  }
  for (i=1; i < 10; i++) { 
    ellipse(random (1, 550), random (1, 100), random (1, 300), random (1, 300)); //draws the ellipse randomly
  }
  
  Pikachu(0+x, 0); //draws pikachu
  
}

void Pikachu(int x, int y){
  //face
  fill(255); //defines the color of the the stroke
  strokeWeight(5); //defines the weight
  stroke(value);
  fill(255, 255, 0); //defines the color of the ellipse
  ellipse(100+x, 370, 150, 150); //draws the pikachu's face
  //left ear
  triangle(60+x, 302, 40+x, 322, 40+x, 247); //left ear
  //right ear
  triangle(160+x, 320, 155+x, 250, 140+x, 305); //right ear
  stroke(value); 
  fill(0);  //defines the color of the triangle
  //right eye
  ellipse(130+x, 340, 25, 25); //right eye
//left eye
  ellipse(70+x, 340, 25, 25); //left eye
  stroke(255); //defines the stroke of the eye
  fill(255); //defines the color of the eyes
  //right pupil
  ellipse(125+x, 335, 8, 8); //the right pupil
  //left pupil
  ellipse(65+x, 335, 8, 8); //the left pupil
  //right cheek
  stroke(value); 
  fill(255, 0, 0); //defines the color of the right and left cheek
  ellipse(150+x, 380, 30, 30); //draws the right cheek
  //left cheek
  ellipse(50+x, 380, 30, 30); //draws the left cheek
  //nose
  stroke(value);
  fill(0); //defines the color of the nose
  triangle(90+x, 360, 100+x, 375, 108+x, 360); //draws the nose
  //mouth
  strokeWeight(4); //defines the stroke weight of the rectangle
  stroke(value);
  fill(250, 133, 120); //defines the color of the rectangle
  rect(75+x, 405, 50, 25); //draws the rectangle
}

void mouseClicked() {
  if(value == 0) { //if value is equal to zero, the color will be 255
    value = 255;
  } else {
    value = 0; //or else, the color will be white
  }
}


