
float x=300;
float y=50;
float geschwindigkeitX = random(1);
float geschwindigkeitY = random(1);
float xoff = 0.0;


void setup(){
  size(500,500);
}

void draw(){
background(random (50), random( 50), 255);
smooth();
  x = x + geschwindigkeitX;
  y = y + geschwindigkeitY;
  if (x > 400 || x < 0) {
    geschwindigkeitX = -geschwindigkeitX;
  }
  if  (y > height/2 || y < 0) {
    geschwindigkeitY = -geschwindigkeitY;
 
  }
  
  stroke(50,200,50);
  strokeWeight(5);
  line(110,190,x,y);
  line(260,290,x,y);
  noStroke();
  fill(50,200,50);
  ellipseMode(CORNER);
  ellipse(x - 5,y - 20,150,50);
  fill(255,0,0);
  noStroke();
  ellipse(50,170,100,100);
 
  fill(255);
  ellipse(120,200,30,30);
  fill(0);
  ellipse(135,210, 15,15);
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  //if (n > 380 || x < 350);
  fill(255,0,0);
  noStroke();
  ellipse(n-70,270,100,100);
  fill(255);
  ellipse(n,300,30,30);
  fill(0);
  ellipse(n+15,310,15,15);
  
}



