
PFont Times;
PFont Arial;
float x = random(500);
float myscale = 1;
float myscalespeed = 0.01;
float xspeed = 1;
float rad1 = 45.0;
boolean runOnce = false;
float timer = 0;
PImage valley;
          
void setup()
{
  size(750,750);
  Times = createFont("Times New Roman",32);
  valley = loadImage("valley.jpg");
}

void draw()
{
  background(255);
  image(valley, 0, 0, width, height);
  textFont(Times);
  textAlign(CENTER, TOP);
  textSize(15);
  fill(0);
  text("The quest set, the path forged ahead. The journey begins.", 325, 150, 100, 100);
  
  pushMatrix();
  translate(162.5, 150);
  fill(255);
  text("Treasure and wealth.", 0, 0);
  popMatrix();

  pushMatrix();
  translate(162.5, 200);
  text("Glory.", 0, 0);
  popMatrix();  
  
  pushMatrix();
  translate(162.5, 250);
  text("Power.", 0, 0);
  popMatrix();  
  
  pushMatrix();
  translate(162.5, 300);
  text("Victory and satisfaction.", 0, 0);
  popMatrix();  
  
  pushMatrix();
  translate(512.5, 150);
  text("Strife.", 0, 0);
  popMatrix();  
  
   pushMatrix();
  translate(512.5, 200);
  text("Death.", 0, 0);
  popMatrix();  

 pushMatrix();
  translate(512.5, 250);
  text("Challenge.", 0, 0);
  popMatrix(); 
 
  pushMatrix();
  translate(512.5, 300);
  text("Destruction.", 0, 0);
  popMatrix(); 



 pushMatrix();
  translate(350, 500);
  text("The path is riddled with many challenges, the journey is yours.", 0, 0);
  popMatrix();    
}


