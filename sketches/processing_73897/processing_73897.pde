
//Lillie Ferris
//October 1st 2012
//liferris@andrew.cmu.edu
 
float gameState;
float bx, by, bd, bxSpeed, bySpeed;
float px, py, pSize, pxSpeed, pySpeed;
float px1, px2, px2gravity, px2speed;
float easingCircleX, easingCircleY, distX, distY, easingCoefficient;
 
PImage p;
PFont font;
int count, hits;
 
void setup() {
  size(400, 400);
  smooth();
  font = loadFont("DIN-Medium-48.vlw");
  textFont(font);
  bx = 0;
  by = random(height);
  bd = 80;
  bxSpeed = 5;
  //gameState = 0; gameTime =
   
  //loads moon
  p = loadImage( "moon.png");
  imageMode( CENTER );
  px = 70;
  py = random(height);
  pSize = 70;
  pxSpeed = 3;
  pySpeed = 3;
   
  //controls wrap
  bx = random(0,400);
  by = random(0,400);
  bd = 50;
  bxSpeed = random(3, 5);
  bySpeed = random(3, 5);
    
  //controls bounce
  px = random(0,400);
  py = random(0,400);
  pSize = 70;
  pxSpeed = random(3, 3.2);
  pySpeed = random(3, 3.2);
  px1 = width/2;
  px2 = height/1.75;
   
  //eases lasso
//  easingCircleX = width/2;
//  easingCircleY = height/2;
  easingCoefficient = .02; //sets easing coefficient
}
 
 
void draw() {
  if(gameState == 0){
    showInstructions();
  }
  else if(gameState == 1){
  prepWindow();
  drawBall(bx, by, bd);
  drawImage(px, py, pSize);
  moveBall();
  moveImage();
  collisionDetect();
  countHits();
  displayTime();
  }}
  
  void prepWindow(){
    PImage img;
    img = loadImage("sky.png");
    background(img);
    rect(0, 0, width, height);
  }
   
  // displays instructions before start
  void showInstructions( ) {
   if (gameState == 0){
   background(0);
   textAlign(CENTER, CENTER);
   textSize(width/25);
   text( "TRY AND LASSO THE MOON. \nPRESS SPACE TO BEGIN.", width/2, 150 );
   fill(#D4FFD2);
    
   image(p, px1, px2, pSize, pSize);
   imageMode(CENTER);
   
  if(key == ' ' ){
    gameState = 1;
  }
 
}}
 
//moves moon 
void moveImage() {
 
  px = px + pxSpeed;
  py = py + pySpeed;
    
  if (px > width - 35 || px < 35){    //russell andrews copyright
    pxSpeed *= -1;
  }
  if (py > height - 35 || py < 35) {
    pySpeed *= -1;
  }
}
 
//draws moon
void drawImage(float px, float py, float pSize)
{
 // fill (0, 0, 255);
 // ellipse(px, py, pSize*1.5, pSize*2);
  image(p, px, py, pSize, pSize);
}
   
   
   
//moves lasso
void moveBall (){
bx = bx + bxSpeed;
by = by + bySpeed;
   
if (bx > width + 35 || bx < -35){    //russell andrews copyright
    bx = -35;
}
if (by > height + 35 || by < -35){
    by = -35;
  }
}
//draws lasso 
  void drawBall (float x, float y, float d)
  {
    noFill();
    ellipse (mouseX, mouseY, d, d);
    strokeWeight(2);
    stroke(100);
    }
     
    //draws lasso 
//  void drawBall (float x, float y, float d)
//  {
//    noFill();
//    pSize = pSize + (pSize * easingCoefficient);        //John
//    pSize = pSize + (pSize * easingCoefficient);
//    ellipse (pSize, pSize, mouseX, mouseY);
//    strokeWeight(2);
//    stroke(100);
//    }
 
//sensing hits
void collisionDetect()
{
     float d = dist( px, py, mouseX, mouseY );
     if ( d <= pSize/4)
     {
      background(0);
      hits++;
      gameState = 1;
      px = random(0, width);
      py = random(0, height);
        
     } }
//counting hits    
void countHits(){
  textAlign(CENTER);
  textSize(width/30);
 // fill(255);
  String shits = nf(hits, 1);             //Jim Roberts
  text("Lassos:" + "  " + hits, width/2, height/1.10);
  }
 
//displays the time
void displayTime(){
  millis();
  String scount = nf(count, 1);
 //fill (#D4FFD2);
  text("Time:" + "  " + count++/25, width/2, height/1.05);
}

