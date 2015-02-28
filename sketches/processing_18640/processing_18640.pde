
float posX, posY;
float frameRate = 50;

void setup(){
  size(250,250);
  background(0);
}

void draw(){
  stroke(color(random(100),random(100),random(100)));
  strokeWeight(random(3));
  point(posX,posY);

 ellipse(posX, posY+4,12, posY-10);
 ellipse(posY-10, posX, 10,100);

 ellipse(posY, posX+4,12, posY-10);
 ellipse(posX-10, posY, 10,100);
 
 

  posX = mouseX;
  posY = mouseY;
  
    rect(0,0,width,height);
    fill(0,0,0,5);
    noStroke();
  }


  

