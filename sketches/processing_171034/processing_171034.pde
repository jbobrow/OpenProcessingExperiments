
// DO NOT DETELE THIS
Umbrella umbrella;
Rain[] rain = new Rain [630];
int auxPosition;
int auxJumper;  
Guy guy;
float health;

// Set stuff here
int umbrellaSize;
int dropSize;
float dropSpeed;
float guySpeed;
int guySize;
float guyStartPosX;

boolean isGameRunning;

void setup(){
  
 size(600, 400);
 
auxPosition = 0;
auxJumper = 0;  
 
 // Set stuff here
umbrellaSize = 50;
dropSize = 10;
dropSpeed = 6;
guySpeed = 3.0f;
guySize = 19;
guyStartPosX = 0;

 
 umbrella = new Umbrella();
 umbrella.setSize(umbrellaSize);
 
 for (int i = 0; i < rain.length; i++){

    rain[i] = new Rain();
    if (i % 30 == 0) {
      auxPosition++;
      auxJumper = 0;
    } else {
      auxJumper++;
    }    
    rain[i].setDrop((auxJumper * 20) + dropSize, (auxPosition*20) - height, dropSize, dropSpeed);

  }
  guy = new Guy();
  guy.prime(guySpeed, guySize, guyStartPosX);
  
  health = 100;
  
  isGameRunning = true;
}

void draw(){
  background(255);
  
  if (health > 0){
   for (int j = 0; j < rain.length; j++){
    rain[j].drawDrop();
    rain[j].repeatDrop();
    rain[j].verifyCollision(umbrellaSize, guySize, guy.posX);
  }

  guy.Update();
  
  umbrella.drawUmbrella();
  drawHealthBar();
 }
 
 reset(); 
  
}

void drawHealthBar(){
 
 float hp = map (health, 0, 100, width, 0);
 fill(0,255,0);
 rect(hp,0,width,10);

}

void reset(){
  
  if (health <=0){
   isGameRunning = false;
   textSize(40);
   textAlign(CENTER, CENTER);
   fill(0);
   text ("Game Over", width/2, height/2);
   
   textSize(20);
   text ("Click to play again", width/2, height/2 + 100);
    
  }
  
}

void mouseClicked(){
  if (!isGameRunning){
   setup ();
  }
}



class Guy {

  float movement;
  float speed;
  int guySize;
  float posX;

  void prime(float _speed, int _size, float _x) {
    speed = _speed;
    posX = _x;
    guySize = _size;
  }

  void Update() {

    ellipse(posX, 390, guySize, guySize);
    posX += speed;
    
    if (posX >= width || posX < 0) {
      speed *= -1;
    }
  }
}
     
  
class Rain {
  
float posX, posY, dropSize, fallSpeed;

void setDrop(float _posX, float _posY, float _dropSize, float _fallSpeed){
  posX = _posX;
  posY = _posY;
  dropSize = _dropSize;
  fallSpeed = _fallSpeed;
  
}

void drawDrop(){
  fill(200);
  
  ellipse(posX, posY, dropSize/2, dropSize);
  
  posY += fallSpeed;
}

void repeatDrop(){
 
 if (posY > height + dropSize){
  
  posY = -dropSize/2;
   
 }
  
}

void verifyCollision(int umbrella, int guySize, float guyPosX){

if (posY + dropSize/2 >= height/2 - umbrella/2 &&
    posY - dropSize/2 < height/2 + umbrella/2 &&
    posX + dropSize/4 >= mouseX - umbrella/2 &&
    posX - dropSize/4 < mouseX + umbrella/2){
 
 posY = -height/2;
  
}

if (posY + dropSize/2 >= 390 - guySize/2 &&
    posY - dropSize/2 < 390 + guySize/2 &&
    posX + dropSize/4 >= guyPosX - umbrella/2 &&
    posX - dropSize/4 < guyPosX + umbrella/2){
 
 health -= 0.1;
 posY = -height/2;
  
}
}
}



class Umbrella {
  
PVector umbrellaPosition = new PVector(mouseX, height/2);
int umbrellaSize;

void setSize(int _size){
  umbrellaSize = _size;
}

void drawUmbrella(){
 fill(100);
 ellipse(mouseX, umbrellaPosition.y, umbrellaSize, umbrellaSize);
  
}
}
