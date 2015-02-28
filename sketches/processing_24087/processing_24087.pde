
//Alexxandra Basa
//Ex 2_PROJECT


float x;
float y;
float directionX;
float directionY;

void setup(){
  
  size(400,400);
 smooth();
 frameRate(30);
 x=200;
 y=130;
 directionX = 2;
 directionY = 1;

}


void draw(){
  
  background(250,179,91);
  
  noStroke();
  fill(115,214,252);
  ellipseMode(CENTER);
  ellipse(100,100,150,150);
  
  noStroke();
  fill(255);
  ellipse(110,80,70,70);
  ellipse(60,80,70,70);
  
  noStroke();
  fill(0);
  ellipse(mouseX,mouseY,20,20);
  ellipse(mouseX+60,mouseY,20,20);
  
  noStroke();
  fill(255);
  ellipse(100,150,90,10);
  
  
 fill(mouseX,10,mouseY);
  ellipse(x, y, 60, 60);
 
  x += directionX;
  y += directionY;
  if(y > height){
    directionY = -1;
    }
  if(y < 0){
  directionY = 1;
    }
  if(x > width){
  directionX = -2;
    }
  if(x < 0){
  directionX = 2;
    }


}

void mousePressed(){
  
  noStroke ();
  fill(117,7,178);
  ellipse(100,100,150,150);
  
}

void keyPressed(){
  stroke(0);
  println("I can't decide between purple and blue");
}

