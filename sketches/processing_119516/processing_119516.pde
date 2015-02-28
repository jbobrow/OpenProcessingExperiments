
PFont times;
PFont comic;
float angle = 0;
float x = 0;
float speed = 1;
PImage jock;
PImage nerd;
float timer = 0;

void setup()
{
  size(500,500);
  times = createFont("Blackoak Std", 64);
  comic = createFont("Comic Sans MS", 64);
  
  jock = requestImage("football.png");
  nerd = requestImage("game.png");
}


 
void draw()
{
  timer += 0.0167;
  
  if (timer < 15)
  {
    image(jock, 0, 0, width, height);
    
      

   
  angle += 0.1;
  x += speed;
  fill(0);
  textSize(100);
  textFont(times);

  pushMatrix();
  translate(100, 100);
  rotate(angle);
  fill (255, 255, 255);
  textAlign(RIGHT);
  text("Win", 0, 0);
  popMatrix();

  pushMatrix();
  translate(x, 100);
  scale(x / 200);
  textFont(comic);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("Jock", 0, 0, width, 200);
  textAlign(LEFT);
  popMatrix();
  
  pushMatrix();
  translate(x, 200);
  textAlign(CENTER);
  textFont(times);
  fill(255, 255, 0);
  text("BOLD", 0, 0, width, 100);
  textAlign(RIGHT);
  popMatrix();
 
  pushMatrix();
  translate(30, 400);
  textAlign(CENTER);
  textFont(times);
  fill(255, 0, 0);
  text("FIGHT", 0, 0, width, 100);
  textAlign(RIGHT);
  popMatrix();
    
    
  }
  if (timer > 15) 
  {
    image(nerd, 0, 0, width, height);
    
      angle -= 0.1;
  x -= speed;
    
  pushMatrix();
  translate(100, 100);
  rotate(angle);
  fill (255, 255, 255);
  textAlign(RIGHT);
  text("game", 0, 0);
  popMatrix();

  pushMatrix();
  translate(x, 100);
  scale(x / 200);
  textFont(comic);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("Nintendo", 0, 0, width, 200);
  textAlign(LEFT);
  popMatrix();
  
  pushMatrix();
  translate(x, 200);
  textAlign(CENTER);
  textFont(times);
  fill(255, 255, 0);
  text("Nerdy", 0, 0, width, 100);
  textAlign(RIGHT);
  popMatrix();
 
  pushMatrix();
  translate(30, 400);
  textAlign(CENTER);
  textFont(times);
  fill(255, 0, 0);
  text("DND", 0, 0, width, 100);
  textAlign(RIGHT);
  popMatrix();

  }
  

   
 

}



