
//Initialize Global Variables
int count = 0;
int r;
int g;
int b;
int a;
int x;
int y;
int shapeMode;
int countSpeed = 30;

void setup() {
  //Set up Canvas Size 200x200
  size(200,200);
  //White background
  background(255);
}

void draw() {
  
  if (count >= countSpeed) {
    //Reset the Counter, 'count'
    count = 0;
    
    //Randomize the Shape's Variables
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
    a = int(random(0,255));
    x = int(random(0,width));
    y = int(random(0,height));
    shapeMode = int(random(0,3));
    
    //Set the Color and Stroke Weight
    fill(r,g,b,a);
    stroke((255-r)*.75,(255-g)*.75,(255-b)*.75,(255-a)*.75);
    strokeWeight(int(random(5)));
    
    //Draw the Shape depending on the result of 'shapeMode'
    //CIRCLE
    if (shapeMode == 0) {
      ellipse(x,y,20,20);
    }
    //TRIANGLE
    if (shapeMode == 1) {
      triangle(x,y,x+10,y+15,x-10,y+15);
    }
    //SQUARE
    if (shapeMode == 2) {
      rectMode(CENTER);
      rect(x,y,20,20);
    }


  
  } else {
    //increase the counter
    count ++;
  }
}


