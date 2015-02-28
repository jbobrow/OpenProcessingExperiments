
int xpos = 300;
int ypos = 300;
float angle;
float distance;
//Projectiles- properties
int power;
float velx;
float vely;
PVector position;
PVector velocity;
PVector acceleration;

//game
int consecShots = 0;
int shots = 0;
boolean miss = false;
boolean a = false;  //use ice
boolean s = false; //use fire
boolean shoots = false;
boolean startGame = false;
boolean gameOver = false;
boolean ballInMotion = false;
int counter = 0;
int actualTime;
int curTime = 0;
int counter2 = 0;
int totScore;
int score;
int time = 90;
int special;
int prevY = 290;
int curY;
int curTime2 = 0;
int counter3 = 0;
//screen
int h = 500;
int w= 700;
//Pfont font;

//images
PImage kirby;
PImage blueKirby;
PImage redKirby;
//PImage hoop;
PImage hoop2;
int ballradius;
int ballradius2;
int ballradius3;
int hoopwidth;
int hoopheight;


void setup(){
  size(w,h);
  //font = loadFont();
  frameRate(60);
  hoop2 = loadImage("hoop2.gif");
  //hoop = loadImage("newHoop.gif");
  redKirby = loadImage("redKirby.gif");
  blueKirby = loadImage("bluKirby.gif");
  kirby = loadImage("regKirby.gif");
 
  position = new PVector(xpos, ypos);
  velocity = new PVector(-10, -10);
  acceleration = new PVector(0,0.5);

  ballradius2 = redKirby.height/2;
  ballradius3 = blueKirby.height/2;
  hoopwidth = hoop2.width;
  hoopheight = hoop2.height;

  //prevY = curY;
 //curY = (int)position.y;
 
} 
void draw(){
 
 
  if(!startGame){
      background(0);
      //textFont(font);
      if(!gameOver){
        textAlign(CENTER);
        text("Press space to start!", width/2, height/2);
      }else{
        textAlign(CENTER);
        text("Game Over! Press Space to start up again!", width/2, height/2);
        textAlign(CENTER);
        text("Score: " + totScore, width/2, height/2 + 20);
        consecShots = 0;
        special = 0;
        counter2 = 0;
        counter3 = 0;
        curTime2 = 0;
        curTime = 0;
        a = false;
        s = false;
      }
  }
  else {
      /*if(curY != -1){
        prevY = curY;
      }    
      curY = (int)position.y;*/
      //println(prevY + "," + curY);
      background(255);
      fill(220,0,220);
      textAlign(LEFT);
      text("actualTime: " + actualTime, 50,50);
      textAlign(CENTER);
      text("Consective Hoops Made: " + consecShots, width/2 ,50);
      textAlign(CENTER);
      text("Specials( press a or s): " + special, width/2 ,70);
      textAlign(RIGHT);
      text("score: " + totScore,width - 50 ,50);
      textAlign(LEFT);
      text("Time of ice special: " + curTime, 50,70);
      textAlign(LEFT);
      text("Time of fire special: " + curTime2, 50,90);
      image(kirby, position.x, position.y);
      image(hoop2, 0, 300);  
     
      actualTime = (int)(counter/60); 
      //counter++;
      //println(prevY + "," + curY);
 
      if(actualTime == 90){
        startGame = false;
        counter = 0;
        gameOver = true;
      }
      if(curY != -1){
        prevY = curY;
      }        
      if(!shoots){
        line(position.x , position.y,mouseX,mouseY);
      
      }else{
        movement();
  
       }
       curY = (int)position.y;
      //freeze
      if(a == true ){
       
        image(blueKirby, position.x, position.y);
       
        if(curTime == 30){
           a = false;
           counter2 = 0;
        }
         if(s ==true){
             if(curTime2 == 20){
                s = false;
                counter3 = 0;
              }
              counter3++;
         }
        curTime = (int)(counter2/60);
        curTime2 = (int)(counter3/60);
        counter2++;
      }
      //fire
      else if(s == true ){
        image(redKirby, position.x, position.y);
        
        if(curTime2 == 20){
          s = false;
          counter3 = 0;
        }
        if(a == true){
          if(curTime == 30){
             a = false;
             counter2 = 0;
          }
          counter2++;
        }
        curTime2 = (int)(counter3/60);
        curTime = (int)(counter2/60);
        counter3++;
        
        counter++;
  
      }else{
        counter++;
      }
 
       //collision detection
      if ( position.y + ballradius >= h ||
            position.y + ballradius2 >= h||
            position.y + ballradius3 >= h) {
          resetShot();

      }
      if ( position.x + ballradius >= w||
             position.x + ballradius2 >= w||
             position.x + ballradius3 >= w) {
          velocity.x = -velocity.x;
       
      }
      if ( position.x - ballradius <= 0 ||
              position.x - ballradius2 <= 0 ||
              position.x - ballradius3 <= 0) {
          velocity.x = -velocity.x;
      
      }        
      if((hoop2.width * 3 / 4 > position.x+ ballradius && position.x + ballradius > hoop2.width / 4)&&
         (prevY < 300 && curY >= 300) && velocity.y >= 0){ 
             score();
             acceleration = new PVector(0,3);
             velocity.y = 0;
             velocity.x = 0;
      }else{
          //velocity.x = -velocity.x;
      }
     if((position.x > hoop2.width)&&
         (position.y >= 300&& position.y <= 350)&& velocity.y >= 0){ 
           println(hoop2.width);
             consecShots = 0;
             //velocity.y = -velocity.y;

      }
      if((hoop2.width * 3 / 4 < position.x && position.x < hoop2.width / 4)&&
         (prevY < 300 && curY >= 300)){ 

             //velocity.y = -velocity.y;
             velocity.x = -velocity.x;
      }
      
  }
}
void keyPressed(){
  if (!startGame) {
     if (keyCode == 32) {
       startGame = true;
       totScore = 0;
    
     } 
  }
  if( special > 0){
    if(key == 'a'){
      freeze();
      special--;
     
    }
    if(key == 's'){
      fire();
      special--;
        
    }
  }
}
void mouseClicked(){
  if((startGame) && (shoots == false)){
    image(kirby, position.x,position.y);
    shoot();
    shoots = true; 
  }
}
//30 seconds
void freeze(){
 
  a = true;
   
}
//20 seconds
void fire(){
 
  s = true;
}
void shoot(){
    velocity.x = (mouseX - position.x) / 15;
    velocity.y = (mouseY - position.y) / 15;
}
void movement(){
     
  //acceleration = new PVector(0, 0.01);
    velocity.add(acceleration);
    position.add(velocity);
    ballInMotion = true;
}

void resetShot(){
   position.x = hoopwidth + 100 + (int)random((350));
   position.y = hoopwidth + (int)random((350));
   shoots = false;
 
  velocity = new PVector(-10, -10);
  acceleration = new PVector(0,1);
  
}
void score(){
    if(s == true){
      score = 80;
    }else{
      score = 40;
    }
    totScore += score;
    consecShots++;
    //special
    if(consecShots % 5 == 0){
         special++;
    } 
    

  
}


