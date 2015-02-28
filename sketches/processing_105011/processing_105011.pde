

float xPos2;  //X PO\osition
float yPos2;  //Y Position
float speed;  //speed on x
float radius2;  //radius
float speedy;   //speed on y
float gravity; //gravity

void setup() {
  size(500, 500);


  xPos2=10; //initial x postion
  yPos2=10;  // initial y position
  radius2=20; //defined radius
  speed=random(0, 10);  //random speed for x
  speedy=random(0, 10);  //random speed for y
  ellipse(xPos2, yPos2, radius2, radius2); //set ellipse
  gravity=.9; //set number for gravity
}

void draw() {
  fill(255, 0, 0);
  background(255);
  ellipse(xPos2, yPos2, radius2, radius2);
  xPos2=xPos2+speed;
  if (xPos2>=width-radius2/2) {    //ball bounces off right wall
    speed=speed*-1;
  }
  if (xPos2<=0+radius2/2) {  //ball bounces off left wall
    speed=speed*-1;
  }
  speedy=speedy+gravity;
  yPos2=yPos2+speedy;    //ball bounces off bottom
  if (yPos2>=height-radius2/2) {
    speedy=speedy*-0.95;
  }
  if (yPos2<=0+radius2/2) {   //ball bounces off top
    speedy=speedy*-1;
  }
  if ((yPos2>=height-radius2/2)&&(speedy<=0)){
    yPos2=height-radius2/2;
    xPos2-=speed;}
  
  
  
  
}



