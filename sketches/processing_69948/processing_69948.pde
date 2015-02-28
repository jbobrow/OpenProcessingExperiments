
float angle;
float speed;
float rad;
float xOrigin, yOrigin;
float yPos;
boolean goingLeft;


void setup() {
  size(600, 600);

  rad = 100;

  yOrigin = height/2;
  goingLeft = false;
}

void draw() {
  background(0);
  yPos = sin(frameCount * 0.05) * rad; 
  ellipse (xOrigin, yOrigin + yPos, 20, 20);
  //in this case we're just using the sin
  //because we are animatin just one axis
  if (goingLeft==false) {
    //we are using the (-1 to 1) that sin returns and multiplying it by the radius
    //we use frameCount in this case just to make the angle used in the sin calculation grow
    xOrigin=xOrigin+2;
    if (xOrigin>600) {
      goingLeft=true;
    }
  }
  else {
    xOrigin=xOrigin-2;
    if (xOrigin<0) {
      goingLeft=false;
    }
  }
}


