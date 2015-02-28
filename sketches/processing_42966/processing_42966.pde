
PImage car;
PImage back;

void setup()
{ 
  size (500, 500);
  car = loadImage("car.png");
  back = loadImage("background.png");
}

int centerX = -130;
int centerY = 100;

void draw() {
background(255);
  image(back, 0, 0, width, height);
  for ( float i = 0; i<1; i = i+2)
  { 
    for (float j =0; j<1; j = j+1)
    { 
       
      
     float posX = (centerX*i)+frameCount;
     float posY = (centerY*j)+frameCount;
    pushMatrix();

      image(car, posX, (posY+300)/2, 124, 76);
popMatrix();

    }
 
  }
}


