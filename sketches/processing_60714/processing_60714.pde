
int xPos = 20;
float yPos = 20;

int way = 1;
float speed = 0;
float beschl = 0.2;


void setup (){
  size(300, 400);
  smooth();
  fill(0,115,115);
  stroke(210);
}

void draw (){
  background(255);
  
  xPos = xPos + way;
  yPos = yPos + speed;
  speed = speed + beschl;
  
  if (xPos > (width-20) || xPos < 20){
    way = way * - 1;
  }
  if (yPos > (height-20)){
    speed = speed * -0.9;
    fill(random(255),random(255),random(255));
    strokeWeight(random(1,20));
  }
  
  
  ellipse(xPos, yPos, 40, 40);
}


void keyPressed(){
  saveFrame("Zeichenautomat.png");
}

