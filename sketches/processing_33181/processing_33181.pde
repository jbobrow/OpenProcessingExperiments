
PFont helvet;
int circleX; 
int circleY;
// = round(random(20, 300));
int diffX;
int diffY;
int rad = 40;
boolean click = false; 
int velX = round(random(10, 20));
int velY = round(random(10, 20));
int r = round(random(0,255));
int g = round(random(0,255));
int b = round(random(0,255));

void setup(){
 size (500, 500);
 background (r, g, b);
 helvet = createFont("Helvet", 30);
 smooth();
 frameRate(30);
}

void mouseClicked(){
  circleX = mouseX;
  circleY = mouseY;
  click = true;
}

void draw(){
  
  textFont(helvet);
  text("Click where you would like", 30,height/2);
  text("to place the ball.", 30,height/2 + 40);  
  if(click == true){
  background(r, g, b);
  noStroke();
  fill(255);
  

  
  if (circleX == 20 || circleX == width - (rad/2)){
    velX = -velX;
         if(velX < 0){
        velX = velX + 5;
      }

  }
  
  if (circleY == 20 || circleY == height - (rad/2)){
    velY = -velY;
    
      
  if (velY < 0){
    velY = velY + 5;
  }
  
 
    
  }
  circleX = circleX + velX;
  circleY = circleY + velY;
  



  if(circleX > width - 20){
    
    circleX = 480;
    
  }
  else if(circleX < 20){
      circleX = 20;
    }
  if(circleY > height - 20){
    circleY = 480;
  }
  
  else if(circleY < 20){
   circleY = 20; 
  }
  
  ellipse(circleX, circleY, rad, rad);
  
  
  } 
}

