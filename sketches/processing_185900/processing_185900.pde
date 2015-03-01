
Bowling bowlingball1;
Basket basketball1;
Base baseball1;
Lead leadball1;
Tennis tennisball1;
int holding;



 
void setup()
{
  size (800, 600);
  
  bowlingball1 = new Bowling();
  basketball1 = new Basket();
  baseball1 = new Base();
  leadball1 = new Lead();
  tennisball1 = new Tennis();
  
}
 
 
void draw()
{
  background(255);
 
  bowlingball1.update();
  bowlingball1.display();
  baseball1.update();
  baseball1.display();
  
  leadball1.update();
  leadball1.display();
  tennisball1.update();
  tennisball1.display();
  
  basketball1.update();
  basketball1.display();

  
}



class Ball{
float xSpeed;
float ySpeed;
float xPosition;
float yPosition;
float spring;
float rot, frot; 
float dia;
float weight;
PImage basketball;
int rolling = 0;
int parea;
int id;

  
 Ball(){
   xSpeed = random(10);
   ySpeed = random(10);
  rot = 0;
  frot = rot;  
  xPosition = random(width);
  yPosition = random(height);
 }

void update(){  
  
  if(holding==0 && mousePressed && dist(mouseX,mouseY,xPosition,yPosition)<parea){
   parea = width;
   holding = id;    
  }else{
   holding = 0;
   parea = int(dia);
  }
  
  
  
  if(holding == id){
   
//  if(mousePressed && dist(mouseX,mouseY,xPosition,yPosition)<parea){
//   parea = width;
  
 // pparea = width;
  rolling = 0;

  xPosition = mouseX;
  yPosition = mouseY;
  
  xSpeed = (mouseX - pmouseX)*weight;  
  if((mouseY - pmouseY)<0){
  ySpeed = (mouseY - pmouseY)*weight;
  }else{
  ySpeed = mouseY - pmouseY;
  }
  


  }else{

  xPosition = xPosition;
  yPosition = yPosition;
//    pparea = int(dia);
    
  if (rolling == 1){
  rot+=map(xSpeed,0,width,0,(PI*dia)*(width/(PI*dia)));
  }else{
  rot=rot;
  }
  
  frot += (rot - frot) *.5;

  
  ySpeed +=1;
  xSpeed *=.9975;
  xPosition += xSpeed;
  yPosition += ySpeed;
 // changing directions after hitting the right wall
  if (xPosition > width-dia/2)
  {
    xPosition=width-dia/2;
    xSpeed=-xSpeed*spring;
    rolling = 1;
  }
  
// changing directions after hitting the left wall
  if (xPosition<dia/2)
  {
    xPosition=dia/2;  
    xSpeed=-xSpeed*spring;
    rolling = 1;
  }
  
// loosing height after each bounce
  if (yPosition > height-dia/2)
  {
    yPosition=height-dia/2;
    ySpeed = -ySpeed*spring;
    rolling = 1;
  }
  
// slow the ball down faster when it is rolling.
  if (yPosition > height-dia/2-1)
  {
    xSpeed *=.9975;
  }
  } 
}   
}
class Base extends Ball{
  
 Base(){
  spring = .5;
  dia = 35;
  weight = .75;
  id = 1;
 }
 

 
 void display(){
  baseball(xPosition, yPosition, dia, frot); 
 }
    
}
class Basket extends Ball{
  
 Basket(){
  spring = .8;
  dia = 110;
  weight = .5;
  id = 2;
 }
 

 
 void display(){
  bball(xPosition, yPosition, dia, frot); 
 }
    
}
class Bowling extends Ball{
  
 Bowling(){
  spring = .4;
  dia = 100;
  weight = .25;
  id = 3;
 }
 

 
 void display(){
  bowlingball(xPosition, yPosition, dia, frot); 
 }
    
}
class Lead extends Ball{
  
 Lead(){
  spring = .1;
  dia = 60;
  weight = .1;
  id = 4;
 }
 

 
 void display(){
   stroke(0);
   fill(45);
  ellipse(xPosition, yPosition, dia, dia); 
 }
    
}
class Tennis extends Ball{
  
 Tennis(){
  spring = .7;
  dia = 33.5;
  weight = .9;
  id = 5;
 }
 

 
 void display(){
   tennisball(xPosition, yPosition, dia, frot); 
 }
    
}
void bowlingball(float x,float y,float d,float r){
   
   pushMatrix();
   translate(x,y);
   rotate(radians(r));
   ///
   stroke(0);
   strokeWeight(3);
   fill(100); 
   ellipse(0,0,d,d);
   fill(0);
   ellipse(-d/9,d/9,d/9,d/9);
   ellipse(d/9,d/9,d/9,d/9);
   ellipse(0,(d/9)*3,d/8,d/8);
   ///
   popMatrix();  
}

void bball(float x,float y,float d,float r){
 pushMatrix();
   translate(x,y);
   rotate(radians(r));
   ///
   stroke(0);
   strokeWeight(3);
   fill(200,100,0); 
   ellipse(0,0,d,d);
   stroke(100,50,0);
   noFill();
   arc(-d*.7,0,d*.8,d,radians(-36),radians(36));
   arc(d*.7,0,d*.8,d,radians(144),radians(216));
   line(0,-d/2,0,d/2);
   line(-d/2,0,d/2,0);

   ///
   popMatrix();  
}

void baseball(float x,float y,float d,float r){
   
   pushMatrix();
   translate(x,y);
   rotate(radians(r));
   ///
   stroke(0);
   strokeWeight(3);
   fill(215); 
   ellipse(0,0,d,d);
   stroke(100,50,0);
   noFill();
   arc(-d*.65,0,d*.8,d,radians(-36),radians(36));
   arc(d*.65,0,d*.8,d,radians(144),radians(216));

   ///
   popMatrix();  
}

void tennisball(float x,float y,float d,float r){
   
   pushMatrix();
   translate(x,y);
   rotate(radians(r));
   ///
   stroke(0);
   strokeWeight(3);
   fill(100,200,0); 
   ellipse(0,0,d,d);
   stroke(225);
   noFill();
   arc(-d*.6,0,d*.8,d,radians(-36),radians(36));
   arc(d*.6,0,d*.8,d,radians(144),radians(216));

   ///
   popMatrix();  
}

