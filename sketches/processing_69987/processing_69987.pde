
float angle;
float speed;
float rad;
float xOrigin, yOrigin;
float xPos;
float yPos;

int xdirection = 1;

void setup(){
  size(600,600);
  rad = 100;
  xOrigin = width/2;
  yOrigin = height/2;

}

void draw(){
  background(0);
  //in this case we're just using the sin
  //because we are animatin just one axis
   
  if (xOrigin > 0 || xOrigin < width){
   
    xdirection *= 1;
  }
  
  if(xOrigin < 0 || xOrigin > width){

    xdirection *= -1;
  }

  
  
  
  xOrigin = xOrigin + (2 * xdirection);

  
  //we are using the (-1 to 1) that sin returns and multiplying it by the radius
  //we use frameCount in this case just to make the angle used in the sin calculation grow
  xPos = sin(frameCount * 0.05) * rad; 
  yPos= cos(frameCount * 0.05) * rad;
  ellipse (xOrigin, yOrigin +yPos, 20,20); 
//  ellipse (xOrigin + xPos, yOrigin +yPos, 20,20);  
//  ellipse (xOrigin+xPos, yOrigin, 20,20); 
}

