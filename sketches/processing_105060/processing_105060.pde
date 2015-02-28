
//declarify the variables
float xPos;
float yPos;
float a;
float speed1;
float speed2;
float gravity=1;

//setup the variations
void setup () {
  size(500, 500);
  background(255);
  xPos = random(0, width);
  yPos = random(0, height/2);
  a = random(40, 41);
  speed1=random(3, 7);
  speed2=random(2, 8);
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);


  speed2+=gravity;
  xPos+=speed1;
  yPos+=speed2;


  if ((xPos <= a/2) ||(xPos >= width - a/2)) {
    speed1 = -speed1;
  }

  if ((yPos <= a/2)||(yPos >= height - a/2)) {
    speed2 = -speed2*0.9;
    speed1=speed1*0.9;
    
  }

  if (yPos>= height-a/2) {
    yPos=height-a/2;
  }
  fill(random(100,255),random(100,255),0);
  noStroke();
  ellipse(xPos, yPos, a, a);
  
}



