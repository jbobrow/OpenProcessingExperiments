
float x = 100;
float y = 300;

float speedX = 2;
float speedY = 2;
float gravTimer = 1;

void setup() {
  size(500,500);
  smooth();
}

void draw() {

  background(255); //reset bg
  x = x + speedX;
  y = (y + speedY);

  if ((x > (width-20)) || (x < 20) && y != 479) {  //horizontal ball boundary
    speedX = speedX * -1; //X reversal
  }
  
  if (((y > (height-20)) || (y < 20)) && y != 479) { //vertical ball boundary
    speedY = (speedY * -1);// * gravTimer; //Y reversal
  } 
  


/*
  gravTimer += .00001; //grav increasing with time
  speedY = speedY / gravTimer; //time slowing down the speed of Y
  
  if (speedY < .2 && speedY > 0 && y != 479) {
    y = y +1;
    if (y >= 480.01){
      y = 479;
    }

  }
   if (y==479) {
     x = x * 0.9;
   }
*/
  
  strokeWeight(3);
  fill(255,0,0);
  ellipse(x,y,40,40);
  fill(255);
  strokeWeight(1);
  ellipse(x-5,y-5,5,7);
}
