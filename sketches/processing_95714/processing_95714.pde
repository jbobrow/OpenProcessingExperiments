
//Rosa Han
//April 8,2013
//Assignment with Sin and Cos 



int numbers = 40;
float degrees = 360/numbers;
float angleOffset = 0;
float distance = 10;
void setup() {
  size(400,400);
  noStroke();
}
void draw() {
  background(100,random(100,200), 200);
  strokeWeight(.5);
  distance = 5; 
  fill(255, 255, 0);
  if(mousePressed==true) {
      fill(random(100,200),random(100,200),random(100,200),80);
    }

  for ( int i =0; i<numbers; i++) {
    float xOffset = cos( radians(degrees * i + angleOffset)) * distance;
    float yOffset = sin( radians(degrees * i + angleOffset)) * distance;
    line(mouseX + xOffset*.5, mouseY + yOffset, 30, 30);
    ellipse(width/2 + xOffset, height/2 + yOffset, mouseX,5);
    line(width/2 + xOffset*1.5, height/2 + yOffset*1.5, 30, 30);
    ellipse(width/2 + xOffset*.5, height/2 + yOffset*1.7, 40, 40);
    ellipse(width/2 + xOffset*.3, height/2 + yOffset, mouseX,5);
    line(width/2 + xOffset*1.5, height/2 + yOffset*1.5, 20, 20);
    ellipse(width/2 + xOffset*.45, height/2 + yOffset*1.7, 30, 30);

    distance+=5;
  }
  
  
  angleOffset -= 3;
  }
