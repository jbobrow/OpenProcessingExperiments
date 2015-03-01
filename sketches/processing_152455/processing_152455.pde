
PImage ana;
PImage ana2;
PImage jose;
PImage jose2;
boolean onoff = false;
boolean onoff2 = false;
int savedTime;
int totalTime;
  


//Catcher2 anita;
Catcher josito;
Catcher anita;


Timer timer;
Drop [] drops;
int totalDrops = 0;

void setup(){
  size(800,600);
  smooth();
  frameRate(40);
  
  ana = loadImage("ana.gif");
  ana2 = loadImage("ana2.gif");
   jose = loadImage("jose.gif");
  jose2 = loadImage("jose2.gif");
  
  anita = new Catcher (ana.width);
  josito = new Catcher (jose.width/2);

  
  drops = new Drop [50];
  timer = new Timer(1400) ;
  
  timer.start();
  josito.startt();
}

void draw(){
  background (255);
  
  //RAINDROPS
  //Initialize one drop
  /*drops [totalDrops] = new Drop();
  totalDrops++;
  
  //If we hit the end of the array
  if(totalDrops >= drops.length){
    totalDrops = 0;
  }*///JOSE CATCHER
  
  for(int i = 0; i < totalDrops; i++){ // NEW!! We no longer move and display all drops,
    drops[i].move();                   // but rather only "totalDrops" that are currently 
    drops[i].display();                // present in the game
    if (josito.intersect(drops[i])) {
       drops[i].caught();
       onoff = true;
       savedTime = millis();
    }else{
     josito.display1(); 
     
    }
  }
  
    if (onoff==true){
    josito.display2();
    
  }

  
  // ANITA CATCHER
   for(int i = 0; i < totalDrops; i++){ // NEW!! We no longer move and display all drops,
    drops[i].move();                   // but rather only "totalDrops" that are currently 
    drops[i].display();                // present in the game
    if (anita.intersect2(drops[i])) {
       drops[i].caught();
       onoff2 = true;
       savedTime = millis();
    }else{
     
      anita.display3(); 
    }
  }
  
    if (onoff2==true){
    anita.display4();
    }
    
  
  int passedTime = millis() - savedTime;
  totalTime = 800;
   if (passedTime > totalTime){
     //image(black,200,20); this would replace the backdrop rect
     
     onoff=false;
     onoff2=false;
   }
   
     
    
   
   //CATCHERS
    josito.setLocation(mouseX,mouseY);
    anita.setLocation2();

   
  
  
  //TIMER
  if(timer.isFinished()){
    
    drops [totalDrops] = new Drop();
    totalDrops++;
  
  //If we hit the end of the array
  if(totalDrops >= drops.length){
    totalDrops = 0;
  }
    timer.start();
  }
  
  
}
class Catcher{
  float r;
  float x,y;
  
  int savedTime; //esta variable la usaremos en dos funciones
  int totalTime;
  float w = 60;
  float h = 60;
  float x2,y2;


  
  Catcher(float r_){
    PImage jose;
    PImage ana;
    r = r_;
    x = 0;   // No es necesario iniciar las variables que son = a 0, ya que            
    y = 0;   // se inician en ese valor por defecto 
    x2 = width/2;
    y2 = height/2;
    
  }
  
  void setLocation(float x_, float y_){
    x = x_;
    y = y_;
  }
  
  void display1(){
       
    jose = loadImage("jose.gif");
   
    // Draw jose's body
  stroke(0);
  fill(150);
  rectMode(CORNER);
  rect(x-w/12,y,w/6,h*2);

  
  // Draw jose's legs
  stroke(0);
  line(x-w/12,y+h,x-w/4,y+h+10);
  line(x+w/12,y+h,x+w/4,y+h+10);
  
  line(x-w/12,y+h*2,x-w/4,y+h*2+20);
  line(x+w/12,y+h*2,x+w/4,y+h*2+20);
  
  image(jose, mouseX - jose.width/2, mouseY-jose.height/2);
  
  }
    
     void display2(){
    
    jose2 = loadImage("jose2.gif");
    image(jose2, mouseX - jose2.width/2, mouseY-jose2.height/2);
    
    }
  
  void startt(){
    savedTime = millis();
  }
  
  boolean dudaDisplay(){
  
  
  int totalTime = 1000; 
  int passedTime = millis() - savedTime;
    if (passedTime < totalTime){
      return true;
    } else {
      return false;
    }
    
  }

  //intersect jose
  boolean intersect(Drop d){
    float distance = dist (x,y,d.x,d.y);  
    if(distance < jose2.width + d.r){    
      
      return true;     
    } else {
      return false; 
    }  
  }
  

  
  

 void display3(){
       
    ana = loadImage("ana.gif");
   
    // Draw ana's body
  stroke(0);
  fill(150);
  rectMode(CORNER);
  rect(x2-w/12,y2,w/6,h*1.7);
  
  ellipseMode(CENTER);
  noFill();
  ellipse(x2-5,y2+60,10,10);
  ellipse(x2+5,y2+60,10,10);
  
  // Draw ana's legs
  stroke(0);
  line(x2-w/12,y2+h,x2-w/4,y2+h+10);
  line(x2+w/12,y2+h,x2+w/4,y2+h+10);
  
  line(x2-w/12,y2+h+40,x2-w/4,y2+h*2+10);
  line(x2+w/12,y2+h+40,x2+w/4,y2+h*2+10);
  
  image(ana, x2 - ana.width/2, y2-ana.height/2);
}

void display4(){
       
    ana2 = loadImage("ana2.gif");
  image(ana2, x2 - ana.width/2, y2-ana.height/2);
}

void setLocation2(){
     //UP DOWN -- cambios en variables
  if (key == CODED) {
    if (keyPressed == true && keyCode == UP) {
      y2 -= 20;
    }
  }
  
   if (key == CODED) {
    if (keyPressed == true && keyCode == DOWN) {
      y2 += 20;
    }
  }
  
   //LEFT & RIGHT -- cambios en variables
  if (key == CODED) {
    if (keyPressed == true && keyCode == LEFT) {
      x2 -= 20;
    }
  }
  
   if (key == CODED) {
    if (keyPressed == true && keyCode == RIGHT) {
      x2 += 20;
    }
  }
}



  //intersect ana
  boolean intersect2(Drop d){
    float distance = dist (x2,y2,d.x,d.y);  
    if(distance < jose2.width + d.r){    
      
      return true;     
    } else {
      return false; 
    }  
  }
}
 
 
  




  
class Drop{

  float x,y; // Variables for the drop location
  float s;
  float speed;
  color c;
  float r;
  
  Drop (){
    r = 8;
    x = random(width);
    y = -r*4; //Start a little above the window
    speed = random(1,5);
    c = color (50,100,150,random(50,150));
  }
  
  void move(){
    y += speed;
  }
  
  boolean reachedBottom(){
    if (y > height + r*4){
      return true;
    } else {
      return false; 
    }
  }

  void display(){
    fill(c);
    noStroke();
    for(int i = 1; i < r; i++){ // To create a more "drop-like" look is to draw a sequence of circles in the vertical direction, starting small, and getting larger as they move down
      ellipse(x,y+i*4,i*2,i*2);
    }
  }
  
  void caught(){
    speed = 0; //Stop the drop from moving by setting speed equal to zero
    y = -1000; //Set the location to somewhere off-screen
  }
}
class Timer{
  
  int savedTime;
  int totalTime;
  
  Timer(int totalTime_){
    totalTime = totalTime_;   
  }
  
  void start(){
    savedTime = millis();
  }
  
  boolean isFinished(){
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime){
      return true;
    } else {
      return false;
    }
  }
}


