
float l4 = 0;
float i4 = 0;
float n4 = 0;
float e4 = 0;
float x = 0;
float y = 0;
float spacing = 10;
int endLines = 1000;
int lineCount = 1;
int speed = 1;

void setup () {
  size(1000,600);
  background(255);
  smooth();
  frameRate(30);
}

void draw () {
  
  
  float x = random(0,1000);
  stroke(0);
  if(x < endLines) {
  line(x*width/1000,0,x*width/1000,y);
  x++; //random(0,1000);
  y+=10;
  } else if (y > height) { 
   stroke(0);
   line(x,0,x,y);
   x = x + spacing;
   y+=10;
  }
}


  
  /*stroke(0);
  if(x < width) {
    line(x,0,x,y);
    x = x + spacing;
    y = y + 1; 
  } else {
    speed = speed * -1;
  }
 
  //vars for randomization
  //l expands the x area of the lines over the canvas
  //i pushes the y vertice father down the canvas
  //n pushes the bottom point farther to the right
  //e adjusts straightness of line & makes the line longer on the y axis
  
  /*l4 = random(0,1000);
  i4 = random(0,0);
  n4 = random(0,1000);
  e4 = random(7000,10000);
  
  randomized set of lines
  stroke(15);
  line(l4,i4,n4,e4);
  l4 = l4 + speed;
  if (endLines < lineCount) {
    speed = speed * -1;
  }*/

