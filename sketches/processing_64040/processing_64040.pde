
PImage logo;



void setup() {
  size(600, 600);
  background(255);
  smooth();

  
  logo = loadImage("nasa_logo.png");
}

void draw() {
  noStroke();
 
  
  float xpos = random (width);
  float ypos = random (height);
  
  color temp = logo.get(int(xpos), int(ypos)); //getting color
  
  if (dist(width/2, height/2, mouseX, mouseY)<=180){
  if(blue(temp) < 100 )
{
    noStroke();
    fill(237, 27, 47);
    ellipse(xpos, ypos, 12, 12);
    ellipse(xpos, ypos, 12, 12);
    ellipse(xpos, ypos, 12, 12);
    ellipse(xpos, ypos, 12, 12);
    }
    }
}
    

