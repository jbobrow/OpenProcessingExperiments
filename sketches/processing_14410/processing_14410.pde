
PImage flower;
float inc=0.0;
float x,y;
float r=50;
void setup(){
  size(600,600);
  smooth();
  flower = loadImage("flower.png");
}
void draw(){
  background(10,100,250);


  float d= dist(mouseX,mouseY,x,y);
  if(d<r){
    r++;
  }
  else{
    if(r>=10){
      r-=5;
    }}
  
  inc+=.0;
  float angle = sin(inc)/10.0+sin(inc*1.2)/10.0;
  pushMatrix();
  translate(300,600);
  for(int i = 10;i>0;i--){
    stroke(random(255),random(255),random(255));
    strokeWeight(i);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
}
  popMatrix();
  
  
   pushMatrix();
  translate(320,600);
  for(int i = 15;i>0;i--){
    strokeWeight(i);
    line(0,0,0,-20);
    translate(0,-20);
    rotate(angle/1.2);
}
  popMatrix();
  
  
   pushMatrix();
  translate(220,600);
  for(int i = 9;i>0;i--){
    strokeWeight(i);
    line(0,0,0,-30);
    translate(0,-30);
    rotate(angle);
}
  popMatrix();
  grass(100,600,10,0.02);
  grass(500,600,11,0.02);
    grass(200,600,12,0.02);
  grass(100,600,22,0.01);
    grass(150,600,21,0.01);
  grass(400,600,20,0.01);

   grass(110,600,10,0.02);
  grass(510,600,11,0.02);
    grass(210,600,12,0.02);
  grass(110,600,22,0.01);
    grass(160,600,21,0.01);
  grass(410,600,20,0.01);

   grass(120,600,10,0.02);
  grass(520,600,11,0.02);
    grass(220,600,12,0.02);
  grass(120,600,22,0.01);
    grass(170,600,21,0.01);
  grass(420,600,20,0.01);
  
     grass(140,600,10,0.02);
  grass(540,600,11,0.02);
    grass(240,600,12,0.02);
  grass(140,600,22,0.01);
    grass(190,600,21,0.01);
  grass(440,600,20,0.01);
  
     grass(160,600,10,0.02);
  grass(560,600,11,0.02);
    grass(260,600,12,0.02);
  grass(160,600,22,0.01);
    grass(210,600,21,0.01);
  grass(460,600,20,0.01);
  
     grass(180,600,10,0.02);
  grass(20,600,11,0.02);
    grass(100,600,12,0.02);
  grass(700,600,22,0.01);
    grass(30,600,21,0.01);
  grass(50,600,20,0.01);
  
    rect(270,300,50,340);
       fill(30,255,0);
     image(flower,0,0);
   
     
  
     grass(25,600,10,0.02);
  grass(60,600,11,0.02);
    grass(100,600,12,0.02);
  grass(550,600,22,0.01);
    grass(430,600,21,0.01);
  grass(400,600,20,0.01);
  
     grass(480,600,10,0.02);
  grass(400,600,11,0.02);
    grass(400,600,12,0.02);
  grass(480,600,22,0.01);
    grass(630,600,21,0.01);
  grass(700,600,20,0.01);
  
     grass(10,600,10,0.02);
  grass(30,600,11,0.02);
    grass(50,600,12,0.02);
  grass(90,600,22,0.01);
    grass(200,600,21,0.01);
  grass(450,600,20,0.01);
  
       grass(580,600,10,0.02);
  grass(700,600,11,0.02);
    grass(340,600,12,0.02);
  grass(580,600,22,0.01);
    grass(130,600,21,0.01);
  grass(200,600,20,0.01);
  
     grass(150,600,10,0.02);
  grass(330,600,11,0.02);
    grass(560,600,12,0.02);
  grass(760,600,22,0.01);
    grass(340,600,21,0.01);
  grass(530,600,20,0.01);


  
}

void grass(int x, int y,int segmentLength, float Increment){
 inc+=.001;
  float angle =sin(inc)/10.0+sin(inc*1.2)/10.0;
  pushMatrix();
 translate(x,y);
 for(int i=20;i>0;i--){
   strokeWeight(i);
   line(0,0,0,-segmentLength);
   translate(0,-segmentLength);
   rotate(angle);
 }
 popMatrix();
 

  
}


