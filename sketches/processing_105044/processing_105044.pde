
int r=100; //radius of the ball
float xPos; //x coordinate attribute
float yPos; //y coordinate attribute

float xSpeed=3; //x speed
float ySpeed=3; //y speed
float gravity=1; //gravity 

void setup() {
  size(500, 500);
  xPos=random(r/2, width-r/2);
  yPos=random(r/2, height-r);
}

void draw() {

  fill(255,70);
  rect(0,0,width,height); //motion blur
  
  fill(255, 0, 0);
  ySpeed=ySpeed+gravity; //accelation of gravity
  xPos=xPos+xSpeed;
  yPos=yPos+ySpeed;


  if (xPos>=width-r/2||xPos<=0+r/2) {
    xSpeed*=-1;
  }

  if (yPos>=height-r/2||yPos<=0+r/2) {
    ySpeed*=-1;
  }

  if (yPos>=height-r/2&&ySpeed<=0) {

    yPos=height-r/2;
    
  }
  
    if (yPos<=height-r/2&&ySpeed<=0) {
    xSpeed=xSpeed*.99; //decrease x speed
   
    
  }

  ellipse(xPos, yPos, r, r);
}



