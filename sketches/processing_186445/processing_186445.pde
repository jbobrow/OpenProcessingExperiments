
Swimmer[] things = new Swimmer[75];


//begin class block
class Swimmer{
 ///////////////////////
  //begin class block
class Folbol{
  
float followerX = width/2;
float followerY = height/2;
float easing;

float targetX;
float targetY;

float diameter;

float mapper;

int colz;


 
 //class constructor (like setup function)
 Folbol(float d, float e, int c){
   
   colz = c;
   diameter = d;
   easing = e;
 }
 
 //method for the "math" behind the object
 void update(float x, float y){
  targetX = x;
  targetY = y;
  
  
  followerX += (targetX - followerX) * easing;
  followerY += (targetY - followerY) * easing;
  
//  mapper = dist(targetX,targetY,followerX,followerY);
  
//   easing = map(mapper,0,width,.001,.9999);
 
  
 }
 

  
  //method for drawing the object to the screen
  void display(){
  strokeWeight(diameter);
  stroke(colz);
 
  

  line(followerX, followerY, targetX, targetY);

//  rect(followerX, followerY, targetX, targetY);

 
  }  
}
////////////////////////////////////////end class block
  Folbol f01, f02, f03, f04, f05, f06;
  Folbol f01b, f02b, f03b, f04b, f05b, f06b;

float speedy = random(.1,.2);

float posX;
float posY;
float dirX = 1;
float dirY = 1;

float counter = 0;

float ranX;
float ranY;

float waiter = 0;
float wait = random(1,75);

int dX = 0;
int dY = 0;

float big = random(5,25);
  
 //class constructor (like setup function)
 Swimmer(){
   
 f01 = new Folbol(2,random(.005,.001),150);
  f02 = new Folbol(big*.625,speedy,255);
  f03 = new Folbol(big*.95,speedy,255);
  f04 = new Folbol(big*.6,speedy,255);
  f05 = new Folbol(big*.45,speedy,255);
  f06 = new Folbol(big*.3,speedy,255);
  
 f01b = new Folbol(2,random(.005,.001),0);
  f02b = new Folbol((big*.625)+4,speedy,0);
  f03b = new Folbol((big*.95)+4,speedy,0);
  f04b = new Folbol((big*.6)+4,speedy,0);
  f05b = new Folbol((big*.45)+4,speedy,0);
  f06b = new Folbol((big*.3)+4,speedy,0);
  
  posX = random(width);
  posY = random(height);
 }
 
 //method for the "math" behind the object
 void update(){
   
  float ranMax = random(20,100);
  
  counter++;
  if(counter > ranMax){
   
  ranX = random(-50,50);
  ranY = random(-50,50);
    
    counter = 0;
  }
  
   if(mousePressed){
    
   waiter++;
   if(waiter>wait){
    
     waiter = wait;
     
    dX = mouseX+int(ranX*2);
    dY = mouseY+int(ranY*2);
    
    posX = dX;
    posY = dY;
   
    
  }else{
    
  
  
  posX += dirX;
  posY += dirY;
  }
   }else{
     waiter = 0;
  posX += dirX;
  posY += dirY;
   }
  
  if(posX >= width+100){
    dirX = random(-3)-.1;
  }
  if(posX <= 0-100){
    dirX = random(3)+.1;
  }
     if(posY >= height+100){
    dirY = random(-3)-.1;
  }
  if(posY <= 0-100){
    dirY = random(3)+.1;
  } 
    f01.update(posX+ranX,posY+ranY);
    f02.update(f01.followerX,f01.followerY);
    f03.update(f02.followerX,f02.followerY);
    f04.update(f03.followerX,f03.followerY);
    f05.update(f04.followerX,f04.followerY);
    f06.update(f05.followerX,f05.followerY);
    
      f01b.update(posX+ranX,posY+ranY);
        f02b.update(f01.followerX,f01.followerY);
    f03b.update(f02.followerX,f02.followerY);
    f04b.update(f03.followerX,f03.followerY);
    f05b.update(f04.followerX,f04.followerY);
    f06b.update(f05.followerX,f05.followerY);
  
 }
  
  //method for drawing the object to the screen
  void display(){


  

//  f01.display();
   
     f02b.display();
  

  f03b.display();
  

  f04b.display();
  

  f05b.display();


  f06b.display(); 

  f02.display();
  

  f03.display();
  

  f04.display();
  

  f05.display();


  f06.display();
  

}
}






void setup(){
  size(800,800);
  background(100);
  smooth();
  
  for(int i = 0; i < things.length; i++){
  things[i] = new Swimmer(); 
  }
  
}

void draw(){
  background(100);
  


  
  for(int i = 0; i < things.length; i++){
  things[i].update();
  things[i].display();
  }

    

  
  
  
}
  



