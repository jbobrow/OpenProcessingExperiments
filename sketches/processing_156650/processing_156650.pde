
boolean gameStart = false;

float posX;
float posY;

int diameter = 50;

void setup(){
  size(800,600);
}

void draw(){
  background(0);
  
  if(gameStart == false){
    fill(#78BCA3);
    textAlign(CENTER);
    text("That's Draw Something!",width/2, height/2);
    posX = random(width);
    posY = random(height);
  }
    

    
    fill(255,100);
    
    posX+= (mouseX-posX)*0.5;
    posY+= (mouseY-posY)*0.5;
    
    noStroke();

    ellipse(posX, posY, 50,50);
  
  }



