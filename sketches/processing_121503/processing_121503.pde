
int numBalls = 20;
float spring = 0.2;
float gravity = 0.085;
float friction = -0.6;
Ball[] balls = new Ball[numBalls];
int activeIndex = 0;
PImage background1;
PImage background2;
PImage background3;
PFont jokerman;
int gameState = 0;
int score = 0;

int numSegments = 20;
float[] segX = new float[numSegments];
float[] segY = new float[numSegments];
float[] segDiameter = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 35;
float targetX, targetY;
float timer = 0;
float healthKraken = 100;
float healthTown1 = 100;
float healthTown2 = 200;
float healthTown3 = 300;
float MAX_HEALTHkraken = 100;
float MAX_HEALTHtown = 100;
float rectWidth = 200;
boolean readyToShoot = true;



void setup() {
  size(1200, 750);

  segX[segX.length-1] = width;     
  segY[segY.length-1] = height/2;
  
  for (int i = 0; i < numSegments; i++)
  {
    segDiameter[i] = (i+20)*2;
    
    if (segDiameter[i] < 80)
    {
      segDiameter[i] = 80;
    }
  }
 
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(width/2, 1100, 50, i, balls);
  }
 
  
  noStroke();
  fill(255, 204);
  
  background1 = requestImage("background1.jpg");
  background2 = requestImage("background3.jpg");
  background3 = requestImage("background2.jpg");
  jokerman = createFont("Jokerman",64);
  
  
  
}

void draw() {
  
  println("x: " + mouseX + " y: " + mouseY);

  
  if(gameState == 0)
  {
    background(0);
  image(background2, 0, 0, width, height);
  fill(0);
  textFont(jokerman);
  textSize(70);
  text("Kraken's Salvation", 300, 300);
  textSize(25);
  text("Help Protect the Kraken from the Evil Villagers, Whack away as many balls", 120, 400);
  text("as you can to Save the innocent Kraken from the heartless Village", 160,450);

    
  }
    
    if(gameState == 1)
  {
    background(0);
  image(background2, 0, 0, width, height);
  fill(0);
  textFont(jokerman);
  textSize(70);
  text("Level   1", 450, 287);
  textSize(40);
  text("Destroy The Village before they Kill the Kraken.",150,360); 
   textSize(25);
  text("HINT: Hit the ball slowly for more control of the ball",270,600);
    
  }

  if(gameState == 2){
  background(0);
  image(background1, 0, 0, width, height);
  
  
  
  strokeWeight(1.0);
  stroke(0, 0, 255);
  reachSegment(0, mouseX, mouseY);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=segX.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<segX.length; i++) {
    segment(segX[i], segY[i], angle[i], (i+1)*2); 
  }
  
  fill(255);
  textFont(jokerman);
  textSize(65);
  text("Kraken", 880, 70);
  text("Villagers", 70, 70);
  
  if (healthKraken < 25)
  {
    fill(255, 0, 0);
  } 
  else if (healthKraken < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
   noStroke();
  
  float drawWidthkraken = (healthKraken / MAX_HEALTHkraken) * rectWidth;
  rect(900, 100, drawWidthkraken, 50);
   
  
  
    if (healthTown1  < 25)
  {
    fill(255, 0, 0);
  } 
  else if (healthTown1  < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
   noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidthtown1 = (healthTown1 / MAX_HEALTHtown) * rectWidth;
  rect(100, 100, drawWidthtown1, 50);
   


  
  // COLLISION DEBUG DRAWING
  /*for(int i=0; i<segX.length; i++) {
    fill(0, 255, 0);
    noStroke();
    ellipse(segX[i], segY[i], segDiameter[i], segDiameter[i]); 
  }*/
  
 
  timer += 0.0167;
  if (timer > 1)// && readyToShoot == true)
  {
    //readyToShoot = false;
  balls[activeIndex].active = true;
  balls[activeIndex].y = 580;
  balls[activeIndex].x = 240;
  balls[activeIndex].vx = random(5,9);
  balls[activeIndex].vy = random(-8,-4);
    balls[activeIndex].fillColor = color(20,0,0);
  activeIndex += 1;
  timer = 0;
  
  if (activeIndex == numBalls)
  {
    activeIndex = 0;
  }  
  
  }
  
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].collideTentacle();
    balls[i].move();
    balls[i].display();  
  }
  
  if (healthTown1 == 0)
  {
    gameState++;
    healthTown2 = 200;
    healthKraken = 100;
  }
  
  if (healthKraken == 0)
  {
    gameState = 15;
  }
  
  }
  
      if(gameState == 3)
  {
    background(0);
  image(background2, 0, 0, width, height);
  fill(0);
  textFont(jokerman);
  textSize(70);
  text("Level   2", 450, 287);
  textSize(40);
  text("Congratulations! Now the Villagers have improved",150,360);
  text("their town and learned to shoot faster!",220,420); 
   textSize(25);
 
    
  }
  
  if(gameState == 4){
  background(0);
  image(background1, 0, 0, width, height);
  
  
  
  strokeWeight(1.0);
  stroke(0, 0, 255);
  reachSegment(0, mouseX, mouseY);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=segX.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<segX.length; i++) {
    segment(segX[i], segY[i], angle[i], (i+1)*2); 
  }
  
  fill(255);
  textFont(jokerman);
  textSize(65);
  text("Kraken", 880, 70);
  text("Villagers", 70, 70);
  
  if (healthKraken < 25)
  {
    fill(255, 0, 0);
  } 
  else if (healthKraken < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
   noStroke();
  
  float drawWidthkraken = (healthKraken / MAX_HEALTHkraken) * rectWidth;
  rect(900, 100, drawWidthkraken, 50);
   
  
  
    if (healthTown2  < 50)
  {
    fill(255, 0, 0);
  } 
  else if (healthTown2  < 100)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
   noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidthtown2 = (healthTown2 / MAX_HEALTHtown) * rectWidth;
  rect(100, 100, drawWidthtown2, 50);
   


  
  // COLLISION DEBUG DRAWING
  /*for(int i=0; i<segX.length; i++) {
    fill(0, 255, 0);
    noStroke();
    ellipse(segX[i], segY[i], segDiameter[i], segDiameter[i]); 
  }*/
  

  timer += 0.0167;
  if (timer > 0.7)// && readyToShoot == true)
  {
    //readyToShoot = false;
  balls[activeIndex].active = true;
  balls[activeIndex].y = 580;
  balls[activeIndex].x = 240;
  balls[activeIndex].vx = random(7,20);
  balls[activeIndex].vy = random(-10,-6);
    balls[activeIndex].fillColor = color(20,0,0);
  activeIndex += 1;
  timer = 0;
  
  if (activeIndex == numBalls)
  {
    activeIndex = 0;
  }  
  
  }
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].collideTentacle();
    balls[i].move();
    balls[i].display();  
  }
  
  if (healthTown2 == 0)
  {
    gameState++;
    healthTown3 = 300;
    healthKraken = 100;
  }
  
  if (healthKraken == 0)
  {
    gameState = 15;
  }
  
  
  }
  
  if(gameState == 5)
  {
    background(0);
  image(background2, 0, 0, width, height);
  fill(0);
  textFont(jokerman);
  textSize(70);
  text("Level   3", 450, 287);
  textSize(40);
  text("Congratulations! The Villagers are now angry and heavily ",50,360);
  text("fortified their town and hired mercanries to control",50,420); 
  text("their canon. Good Luck!",320,480);
   
  }
  
    if(gameState == 6){
  background(0);
  image(background1, 0, 0, width, height);
  
  
  
  strokeWeight(1.0);
  stroke(0, 0, 255);
  reachSegment(0, mouseX, mouseY);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=segX.length-1; i>=1; i--) {
    positionSegment(i, i-1);  
  } 
  for(int i=0; i<segX.length; i++) {
    segment(segX[i], segY[i], angle[i], (i+1)*2); 
  }
  
  fill(255);
  textFont(jokerman);
  textSize(65);
  text("Kraken", 880, 70);
  text("Villagers", 70, 70);
  
  if (healthKraken < 25)
  {
    fill(255, 0, 0);
  } 
  else if (healthKraken < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
   noStroke();
  
  float drawWidthkraken = (healthKraken / MAX_HEALTHkraken) * rectWidth;
  rect(900, 100, drawWidthkraken, 50);
   
  
  
    if (healthTown3  < 75)
  {
    fill(255, 0, 0);
  } 
  else if (healthTown3  < 150)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
   noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidthtown3 = (healthTown3 / MAX_HEALTHtown) * rectWidth;
  rect(100, 100, drawWidthtown3, 50);
   


  
  // COLLISION DEBUG DRAWING
  /*for(int i=0; i<segX.length; i++) {
    fill(0, 255, 0);
    noStroke();
    ellipse(segX[i], segY[i], segDiameter[i], segDiameter[i]); 
  }*/
  

  timer += 0.0167;
  if (timer > 0.4)// && readyToShoot == true)
  {
    //readyToShoot = false;
  balls[activeIndex].active = true;
  balls[activeIndex].y = 580;
  balls[activeIndex].x = 240;
  balls[activeIndex].vx = random(7,20);
  balls[activeIndex].vy = random(-10,-6);
    balls[activeIndex].fillColor = color(20,0,0);
  activeIndex += 1;
  timer = 0;
  
  if (activeIndex == numBalls)
  {
    activeIndex = 0;
  }  
  
  }
  
 
  
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].collideTentacle();
    balls[i].move();
    balls[i].display();  
  }
  
  if (healthTown3 == 0)
  {
    gameState++;
  }
  
   if (healthKraken == 0)
  {
    gameState = 15;
  }
  
  }
  
   if(gameState == 7)
  {
    background(0);
  image(background2, 0, 0, width, height);
  fill(0);
  textFont(jokerman);
  textSize(70);
  text("VICTORY!", 450, 287);
  textSize(40);
  text("Congratulations!",450,360);
  text("You have defeated the town! You are now free to roam",50,420); 
  text("the Seven Seas. Just dont run into anymore towns!",80,480);
  
  text("REPLAY?",480,600); 
   
  }
  
    if(gameState == 15)
  {
    background(0);
  image(background2, 0, 0, width, height);
  fill(0);
  textFont(jokerman);
  textSize(70);
  text("DEFEAT!", 420, 287);
  textSize(40);
  text("The Town has killed You! ",360,450);
  text("RETRY?",480,600); 

   
  }
  
  
  
}

void mouseReleased()
{

  if((gameState == 7 || gameState == 15) && mouseButton == LEFT)
  {
    gameState = 0;
    healthKraken = 100;
    healthTown1 = 100;
    healthTown2 = 200;
    healthTown3 = 300;
    
  }
  else if(gameState != 2 && gameState != 4 && gameState != 6 && mouseButton == LEFT)
  {
    gameState += 1;
 
  }
  

}

void positionSegment(int a, int b) {
  segX[b] = segX[a] + cos(angle[a]) * segLength;
  segY[b] = segY[a] + sin(angle[a]) * segLength; 
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - segX[i];
  float dy = yin - segY[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
  boolean dead = false;
       
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
      
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
      
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
         
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);
         
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
    
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
        
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
   
     
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
         
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

class Ball {
  
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  boolean active = false;
  color fillColor = color(255, 0, 0);
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void collide() {
    if (active == true)
    {
      for (int i = id + 1; i < numBalls; i++) {
        float dx = others[i].x - x;
        float dy = others[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = others[i].diameter/2 + diameter/2;
        if (distance < minDist && others[i].active == true) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - others[i].x) * spring;
          float ay = (targetY - others[i].y) * spring;
          vx -= ax;
          vy -= ay;
          others[i].vx += ax;
          others[i].vy += ay;
        }
      } 
    }  
  }
  
  void collideTentacle() {
    if (active == true)
    {
      for (int i = 0; i < numSegments; i++) {
        float dx = segX[i] - this.x;
        float dy = segY[i] - this.y;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = segDiameter[i]/2 + diameter/2;
        if (distance < minDist) { 
          float angle = atan2(dy, dx);
          float targetX = x + cos(angle) * minDist;
          float targetY = y + sin(angle) * minDist;
          float ax = (targetX - segX[i]) * spring;
          float ay = (targetY - segY[i]) * spring;
          vx -= ax;
          vy -= ay;
          //x[i].vx += ax;
          //y[i].vy += ay;
        }
      }
    }   
  }
  
  void move() {
    if (active == true)
    {
      vy += gravity;
      x += vx;
      y += vy;
      if (x + diameter/2 > width) {
        //x = width - diameter/2;
        //vx *= friction;
       readyToShoot = true;
       active = false;
       healthKraken -= 10;
       
       
      }
      else if (x - diameter/2 < 0) {
        //x = diameter/2;
       // vx *= friction;
       readyToShoot = true;
       active = false;
       healthTown1 -= 20;
       healthTown2 -= 20;
       healthTown3 -= 15;
       
      }
      if (y + diameter/2 > height) {
        //y = height - diameter/2;
        //vy *= friction; 
        readyToShoot = true;
        active = false;
        score++ ;
      } 
      else if (y - diameter/2 < 0) {
        //y = diameter/2;
        //vy *= friction;
        readyToShoot = true;
        active = false;
        score++ ;
      }
    }
  }
  
  void display() {
    if (active == true)
    {
      fill(this.fillColor);
      ellipse(x, y, diameter, diameter);
    }
  }
}



