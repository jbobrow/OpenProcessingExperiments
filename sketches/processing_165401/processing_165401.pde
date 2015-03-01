
float boatX;
float boatY;

void setup() { size(500,400);
}
void draw(){
  background(255);
  translate(200,200);

  ellipseMode(CENTER);
  
  
  stroke(0);
  fill(500);
 
  ellipse(boatX,boatY,100,100);
  boatX = random(50);
  boatY = random(50);
  fill(boatX,boatY);
  
  ellipse(boatX,boatY,220+1,220+1);
  ellipse(boatX,boatY,100+75,100+75);
  

  
  boatY = boatY+5;

}


