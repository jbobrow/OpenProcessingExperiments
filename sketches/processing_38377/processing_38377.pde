
void setup() {
  size(500, 500);
  colorMode(RGB, width);
  noStroke();
  fill(490, 290, 290, 40);
  smooth();
}

int a = 150; 
int b = 100;
int c =200;
int t=1;
float count = 500; 
float circleSize;
float rectSize;
float e;
float margin =200;
float d = 5;    
float incr = 0.8;

void draw() {

  pushMatrix();

  translate(width/2, height/2);

  e += incr;
  for (int f = 0; f < 30; f++)
  {
    stroke(600, 750, 950, 100);
    noFill();
    rotate(e*t*d);
    rect(t/e*d, a/d, margin+ circleSize*a*t, margin+ t/a*b*c*d);
    //Add stacked rectangles rotating around varrying central ellipse
  }
  translate(width/2, height/2);  
  rotate(radians(a));          
  translate(100, 100);           
  rotate(radians(b*100)); 
  fill(230, 460, 606, 10);
  noStroke();
  ellipse(250, 250, random(height), circleSize);   
  //adds transparent blue ellipse- increasing percieved depth  

  popMatrix();

  circleSize = random(a, b);
  stroke(99, 490, 300, 10);//Draws changing elongated vertical ellipses background


  ellipse(random(width), random(height), circleSize/10, circleSize*10);
  //Centralized ellipse that grows until count > 10
  strokeWeight(1);
  stroke(590, 210, 190, 20);
  pushMatrix();

  translate(width/random(height), height/100);  
  rotate(radians(a++));          

  popMatrix();

  //Sets innermost ellipse: first decreasing, then increasing


  b++;
  a++;
  c=150*b*a;

  rectMode(CENTER);
  fill(600, 190, 180, 20);
  stroke(250, 400, 900, 10);
  for (int rectSize=100; rectSize >= 40; rectSize -=10) {

    rect(random(width), random(height), rectSize, rectSize);
  }
  count--;

  if (frameCount > 450) {
    noLoop();//Freezes frame at 450 to stop the loop
  }
}

void mouseClicked() {
  pushMatrix();
  translate(250, 250);

  e ++;
  for (int f = 0; f < 100; f++)
  {
    noStroke();
    fill(random(width), 233, 677, 20);
    rotate(e*t*d);
    rect(mouseX, mouseY, circleSize, circleSize);
    //produces rotating rectangle stacks about origin when clicked
  }           
  popMatrix();
}


