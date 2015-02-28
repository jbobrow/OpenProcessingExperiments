
//Credits: t.m.s. (OpenProcessing) 
//Used modified verion of their "rain code" 
class SpinDog {
  
  float speed = 2.5;
  float x;
  float y;
  
  
  SpinDog(float tempX, float tempY){
    x=tempX;
    y=tempY;
   

  }
  
  void move(){
    x+= random(-speed, speed);
    y+= random(-speed, speed);
  }
  
  void display() {  
 int p= 255;
 int n= 196;
 int k= 210;
 int a= 15;
 translate(x,y);
   
//HAT
fill(255);
ellipse(136,170,80,90);

//Tail
//fill(p,n,k);
//arc(560, 290, 210, 120, PI, PI+QUARTER_PI, CHORD);
 
//LEGS
fill(255);
ellipse(210,360,20,60);
fill(255,121,157);
ellipse(170,350,20,60);
fill(p,n,k);
ellipse(420,360,20,60);
fill(203,249,255);
ellipse(380,350,20,60);
 
//BODY
fill(255,233,209);
ellipse(210,300,150,120);
fill(255,246,193);
ellipse(400,300,150,120);
fill(p,n,k);
rect(210,240,80,120);
fill(203,249,255);
rect(280,240,10,120);
fill(255,121,157);
rect(290,240,110,120);

 
//FACE
fill(p,n,k);
ellipse(120,230,120,120);

//Tear
fill(205,254,255);
textSize(35);
text("!", 88, 241);
 
//EAR
//fill(255,233,209);
//arc(140, 220, 60, 120, 0, PI+QUARTER_PI, CHORD);
 
//EYE
fill(0);
ellipse(90,210,20,20);
 
//NOSE
ellipse(65,250,10,10);
 
//Spots
fill(255);
ellipse(310,270,a,a);
ellipse(375,290,a,a);
ellipse(305,342,a,a);
ellipse(350,320,a,a);
ellipse(375,338,a,a);
ellipse(320,300,a,a);
ellipse(355,260,a,a);
 
//Hat Front
fill(255);
ellipse(165,190,42,28);
ellipse(100,170,39,25);
ellipse(132,178,50,20);
 
//CONE
fill(185,151,122);
triangle(110,130,185,20,180,160);
  }
}




SpinDog dog;

void setup(){
  size(600,600);
  smooth();
  noStroke();
  
  dog = new SpinDog(60, 100);
  
}

void draw(){
  background(201,214,216);
  //snow
  /*for (int i = 0; i < 10; i++) {
  int theX = int(random(width));
  int theY = int(random(height));
  fill(255);
 
  int random = (int)random(2);
  String snow = (random == 0)? "*" : "+";
 
  text(snow, theX, theY);
  }
  */
  
  dog.move();
  dog.display();
  

 
}



  
  



