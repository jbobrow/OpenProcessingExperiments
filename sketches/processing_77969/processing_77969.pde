
PFont f;
PImage img;
String message = "Laidback";
String messad = "Thoughtful";
String enemy="Stern";
String enemy2="Tall";
String concrete="T";
float theta;
float x=1;
float y=1;

boolean boo=true;
float enemyX=5;
float fontSize;

void setup() {
  size(500, 500);
  f = createFont("Arial",20,true);
  img=loadImage("myface.png");
}

void draw() { 
  fontSize+=1;
  background(255);
  image(img,126,50);
  fill(random(155));
  textFont(f,fontSize);
  text(enemy,enemyX,50);
  enemyX=enemyX+3;
  if (enemyX>790) {
    enemyX=random(5);
    fontSize=1;
  }



 
  fill(random(155));
  textFont(f,fontSize);
  text(enemy2,enemyX,460);
  enemyX=enemyX+3;
  if (enemyX>790) {
    enemyX=random(5);
    fontSize=1;
  }
  
  
    
  
  
  
  
  
  
  //background(255);
  fill(0);
  textFont(f,20);                  // Set the font
  translate(width/2,height/2);  // Translate to the center
  rotate(theta);                // Rotate by theta
  textAlign(CENTER);            
  fill(0,255,0);
  text(message,x,y); 
  fill(255,0,0);
  text(messad,.1,50);  
  theta += 0.10;                // Increase rotation
  
  
  
  
}

