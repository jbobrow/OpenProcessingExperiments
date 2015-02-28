
//Attributes for the main file:
PImage[]img = new PImage [3];
float x, y;
float SPEED = 0.01;
float xSpeed,ySpeed = 0;
float JUMP = -10.1;
float GRAVITY = .10;
ArrayList<Platforms> platforms = new ArrayList<Platforms>();
int NUMPLATFORMS = 15;
int MAXHEIGHT = 30;
int MAXWIDTH = 250;
int PLAYERWIDTH = 20;
float MAXJUMPSPEED = 5.0;
Person player;
boolean GAMESTART = false;
int timer =0;
float xccel = 0;
int state = 1;
int GAMESTATE = 0; // 0 is airplane 1 is relativistic

void setup() {
  size(640, 360);
  if (GAMESTATE == 0){
  for(int i = 0; i<3; i++){
    img[i] = loadImage("airplane" + (i+1) + ".png");
  } 
  player = new Person(PLAYERWIDTH,PLAYERWIDTH,height/2,width/2);
  noStroke();
  for(int i = 0; i<NUMPLATFORMS;  i++){
    Platforms temp = new Platforms(random(MAXWIDTH)+50, random(MAXHEIGHT)+20 ,random(height) + 20, random(width)+100);
    platforms.add(temp);
  }
}
}
void draw(){
  if(GAMESTART == false){
    background(color(100,200,100));
    PFont f = createFont("Arial",20,true);
    textFont(f, 20);
    text("Press 1 for paper airplane mode or 2 for relavistic fun", 10, 50);
  }
  else {
    game();
  }
}
void game() {
  background(color(120, 180,200));
  generatePlayer(player);
  
  boolean isPlayerColliding = false;
  for(Platforms p: platforms){
    if( p.isColliding(player)){
      isPlayerColliding = true;
      break;
    }
  }
  if(GAMESTATE == 0){
    if(millis()%200 == 0){
      auto();
    }
    if (isPlayerColliding && ySpeed>0){
     ySpeed= 0;
    } else if (isPlayerColliding && ySpeed == 0)
    {}else{
      ySpeed += GRAVITY;
    }
  }else{
      if (isPlayerColliding && ySpeed>0){
   ySpeed= 0;
   xSpeed += xccel;
  } else if (isPlayerColliding && ySpeed == 0)
  {
    xSpeed += xccel;
  }else{
    ySpeed += GRAVITY;
    xSpeed += xccel;
  }

  }
  
  for(int i = 0; i<platforms.size(); i++){
    platforms.get(i).scrolling(xSpeed);
    boolean onScreen = platforms.get(i).jumping(ySpeed);
    if(!onScreen){
      platforms.remove(i);
      platforms.add(new Platforms( random(MAXWIDTH)+50,random(MAXHEIGHT)+20 , height, random(width)+20));
    }
  }
  
}

void auto(){
  if(GAMESTATE == 0){
    xSpeed = 5.0-random(10);
    ySpeed = 5.0-random(10);
    if(abs(xSpeed) < 1.0 && abs(xSpeed) >0){
      state = 1;
    }
    else if(xSpeed >0){
      state = 2;
    }else if(xSpeed <0){
      state = 0;
    }
  }else{
    xccel = .0005-random(.001);
    ySpeed = 5.0-random(10);
  }
}
void keyPressed(){
  switch(key){
    case '1':
      GAMESTART = true;
      GAMESTATE = 0;
      break;
    case '2':
      GAMESTART = true;
      GAMESTATE = 1;
      break;
    case 'm':
      GAMESTATE = -1;
  }
  switch(keyCode){
  case RIGHT :
    xccel = -SPEED;
    break;
  case LEFT:
    xccel = SPEED;
    break;
  case UP:
    ySpeed = JUMP;
  case DOWN:
    ySpeed = -JUMP;
    break;
  case 'P':
  case 'p':
    GAMESTART = true;
    break;
  }
}

void keyReleased(){
  switch(keyCode){
  case RIGHT:
    xccel = 0;
  case LEFT:
    xccel = 0;
    break;
  case UP:
  case DOWN:
    timer = 0;
    ySpeed = 0;
    break;
  }
}
void generatePlayer(Person p){
  smooth();
  pushMatrix();
  fill(0);
  translate(p.getX(), p.getY());
  if(GAMESTATE == 0){
    image(img[state], 0,0);
  }else {
    rect(0,0, p.getWidth(),p.getHeight());
  }
  popMatrix();
}



class Tangible{
  //Attributes
  float pHeight, pWidth, yPos, xPos;
  Tangible(float wid, float heig, float y, float x){
    pWidth = wid;
    pHeight = heig;
    yPos = y;
    xPos = x;
  }
  /*
  boolean isColliding(Tangible t){ // Player is always t
    float yDist = yPos - t.yPos;
    if(t.xPos+t.pWidth/2 >= xPos && t.xPos + t.pWidth/2 <= xPos+pWidth){
      if (yDist < 4){
        return true;
      }
    }
    return false;
  }
  */
  boolean isColliding(Tangible t)
  {
    return !(xPos > t.xPos+t.pWidth || xPos+pWidth < t.xPos || 
              yPos > t.yPos+t.pHeight || yPos+pHeight < t.yPos);
  }
  float getHeight(){
    return pHeight;
  }
  float getWidth(){
    return pWidth;
  }
  float getY(){
    return yPos;
  }
  float getX(){
    return xPos;
  }
  void setX(float newX){
    xPos = newX;
  }
}
class Person extends Tangible{
  //Attributes
  float DOWN_FORCE = 2;
  float ACCELERATION = 1.3;
  float DAMPENING = 0.75;
  float pX, pY;
  Person(float wid, float heig, float y, float x){
    super(wid, heig, y, x);
  }
}
class Platforms extends Tangible{
  //Attributes
  PVector velocity;
  Platforms(float wid, float heig, float y, float x){
    super(wid, heig, y, x);
  }
  
  boolean scrolling(float xSpeed){
    smooth();
    pushMatrix();
    xPos = xPos - xSpeed;
    translate(xSpeed, 0);
    fill(255);
    rect(xPos, yPos , pWidth, pHeight);
    popMatrix();
    return xPos + pWidth > 0;
  }
  
  boolean jumping(float ySpeed){
    
    smooth();
    pushMatrix();
    yPos = yPos - ySpeed;
    //ySpeed = ySpeed - GRAVITY;
    //println(ySpeed);
    translate(0, ySpeed);
    fill(255);
    rect(xPos, yPos , pWidth, pHeight);
    popMatrix();
    return yPos + pHeight > 0;
  }

}


