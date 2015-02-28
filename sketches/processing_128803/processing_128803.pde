
//if statements, for loops, response, 

int timer = 0;
float fX = 200;
float fY = 200;
float eX = 250;
float eY = 250;
float pX = 300;
float pY = 300; 
float easing = .07; 
color pColor = color(#0E6295);

void setup () {
  size (500,500);
  frameRate (24);
}

void draw () {
  bGround (                              );
  food ();
  player1 ();
  collisions ();
} 

void food (){
  //respawn
  timer ++; 
  if (timer >= 48){
    fX = random(width);
    fY = random(height);
    timer = 0;
}
fill (#557A51);
ellipse(fX,fY,30,30);
}

void player1 (){
 float targetX = mouseX;
 float targetY = mouseY;
 pX += (targetX - pX) * easing;
 pY += (targetY - pY) * easing;
 fill(pColor);
 ellipse (pX,pY,30,30);
}

void collisions (){
  float pDist = dist(pX,pY,fX,fY);
  if(pDist <= 30){
    pColor = color(#9B251B);
  }
  else{ 
    pColor = color(#0E6295);
  }
}

void bGround (){
  strokeWeight (.5);
for(int i = 25; i < width; i += 50){
    line (i,0,i + i/2,400);
  }
}



