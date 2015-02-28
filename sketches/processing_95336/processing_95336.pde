
//five objects aligned as circle around mouse
int number = 50;
float degrees = 360/number;
float distance = 10;
float angleOffset = 0;
float incrementer = 0;


void setup() {
  size(350,400);
  noStroke();
}

void draw () {
  background(0);
  fill(random(100,200),random(100,200),random(100,200),30);
  angleOffset-=2;
  for(int i = 0; i<number+1; i++) {
    float xOffset = cos(radians(degrees*i+angleOffset)) * distance*i/4;
    float yOffset = sin(radians(degrees*i+angleOffset)) * distance*i/4;
    ellipse(width/2 + xOffset, height/2 + yOffset, mouseX-50,5);
    ellipse(width/2 + xOffset, height/2 + yOffset, mouseX,5);
    ellipse(width/2 + xOffset*1.5, height/2 + yOffset*1.5, 3,600);
    ellipse(width/2 + xOffset*.5, height/2 + yOffset*1.7, 5,5);
    ellipse(width/2 + xOffset*.3, height/2 + yOffset*.75, 5,5);
    ellipse(width/2 + xOffset*.75, height/2 + yOffset*2.25, random(width),3);
  }
  
  float xoff = cos(incrementer*1.5) * 150;
  float yoff = sin(incrementer*5) * 220;
  fill(random(100,200),random(100,200),random(100,200),30);
  ellipse(width*.5 +xoff, height*.5+ yoff, 500, 500);
  ellipse(width*.5 - xoff,height*.5 -yoff, 500, 500);
  incrementer += .008;
}


