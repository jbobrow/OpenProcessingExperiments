
//Zeewan Lee
//moving plant 02/25/2011
int time1=2000;
int time2=4000;
float x=300.0;
float y=300.0;
PImage flower;
PImage night;
PImage redflower;
float angle=0.0;
float angleDirection=1;
float speed=0.01;

void setup() {
 size (500,500);
flower=loadImage("flower.png");
night=loadImage("night.jpg");
redflower=loadImage("red.png");
smooth();  
fill(0);

 

}

void draw(){
  background(night);
  //make a cactus here
  noStroke();
  
  pushMatrix();
  translate(210,290);
  fill(#333333);
  ellipse(0,0,100,40);
  translate(-70,-50);
  rotate(-radians(20));
  ellipse(0,0,60,130);
  popMatrix();
  
  pushMatrix();
  translate(300,350);
  fill(random(50,80),random(0,100),random(0,100));//(#336633);
  rotate(-radians(20));
  ellipse(0,0,70,240);
  translate(40,-150);
  rotate(radians(40));
  ellipse(0,0,100,150);
  translate(-80,-30);
  rotate(-radians(50));
  ellipse(0,0,60,100);
  translate(20,-70);
  ellipse(0,0,40,70);
  popMatrix();
  
  pushMatrix();
  translate(350,430);
  rotate(-radians(30)-angle*1.2);
  fill(50,random(50,200),random(0,100));
  ellipse(0,0,100,70);
  translate(40,0);
  rotate(-radians(100)-angle/4.5);
  ellipse(20,80,130,160);
  translate(30,0);
  rotate(-radians(20)+angle*2);
  ellipse(30,170,80,170);
  popMatrix();
  
  pushMatrix();
  translate(300,450);
  rotate(PI+angle);
  fill(#669966);
  ellipse(0,0,80,40);
  translate(40,0);
  rotate(angle*2.0);
  ellipse(30,20,90,60);
  translate(30,0);
  rotate(-angle/2*3.0);
  ellipse(40,30,60,30);
  popMatrix();
  
  pushMatrix();
  translate(320,100);
  rotate(angle);
  fill(#006600);//(#006600);
  ellipse(0,0,40,80);
  translate(0,-70);
  rotate(angle*2.0);
  ellipse(30,20,60,80);
  translate(30,0);
  popMatrix();
  
  angle += speed * angleDirection;
  if ((angle>QUARTER_PI)||(angle<0)){
    //QUARTER_PI
    angleDirection *= -1;  
  }
 
  if (mousePressed){
  if(mouseButton==LEFT){
    if ((angle>QUARTER_PI)||(angle<0)){
    //QUARTER_PI
    angleDirection *= -2; 
     }   
     }
  }
  
  if (keyPressed){
    if (key=='a'){
    image(flower,random(100,400),random(50,300));
   }
 }
  
  if(keyPressed){
    if(key=='s'){
      image(redflower,random(150,400),random(50,250));
    }
  }  
 
  
}

