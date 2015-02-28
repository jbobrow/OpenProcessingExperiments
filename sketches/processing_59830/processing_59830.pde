
PFont funfont;
PFont fonta;
PImage happy;
PImage smile;


void setup(){
  size(500,500);
  background(100,100,255);
  happy = loadImage("jellyfish.jpeg");
  smile = loadImage("up house.jpg");
 
 
 funfont = loadFont("Apple-Chancery-48.vlw"); 
 fonta = loadFont("Braggadocio-48.vlw");


  smooth();


}

int i = 0;
float x; 
float y;
float easing = 0.01;

void draw(){
  
  
  float targetX = mouseX+10; 
  float targetY = mouseY-10;
  x += (targetX - x) * easing; 
  y += (targetY - y) * easing;
  
  background(0);
  //body
  stroke(155);
  fill(255,201,201,240);
  rect(x,y,200,200); //orig x = 250, y = 200
  noStroke();
  fill(245,50,53,210);
  rect(x+8,y,150,180);
  fill(255,164,173,190);
  rect(x+30,y,145,130);
  fill(random(150),100,106,130);
  rect(x+20,y,135,135);
  fill(255,222,178,230);
  rect(x+20,y,120,120);
  fill(255,213,59,220);
  rect(x+20,y,115,115);
  
  //face
  fill(255,236,90,255);
  rect(x+30,y,110,110); 
  fill(80);
  
  if(!mousePressed){
    ellipse(x+90,y+70,10,15); //L eye open
    ellipse(x+70,y+70,15,15); //R eye open
    noFill();
    strokeWeight(2);
    stroke(80);
    rect(x+80, y+90,50,25,15,PI); //:)
  }else{
    noStroke();
    rect(x+80, y+95, 22,30,2,PI); //:D
    fill(50); 
    strokeWeight(2);
    rect(x-0,y+10, 15,15,PI, TWO_PI); //L eye squint
    rect(x+50,y+10, 15,15,PI, TWO_PI); //R eye squint
    stroke(80);
  }
    
  
  //leaf propellor
   ellipse(x+60,y-100,0,0);
  line(x+20,y-0, x+20, y-127);
  fill(random(157),random(236),155,155);
  
  
  if(i<3){
    ellipse(x+50,y-127,50,25);
    ellipse(x-15,y-127,50,25);
    i+=1;
  }else if(i>=3 && i < 6){
    ellipse(x+30,y-127,35,30);
    ellipse(x-5,y-127,40,30);
    i+=5;
  }else if(i>=6 && i< 8){
    ellipse(x+35,y-127,30,25);
    ellipse(x,y-127,20,25);
    i+=5;
  }else if(i>=8 && i< 11){
    ellipse(x+30,y-127,30,25);
    ellipse(x-5,y-127,30,25);
    i=0;
  

   fill(100,100,90);
   textFont(fonta);
   text("Float On",100,300);
 

  fill(250,50,100); 
  textFont(funfont);
  text("Up",mouseX,mouseY);
 
 
  tint(255,100,255,50);
  
  image(happy,0,0,500, 500);
  image(smile,0,0,500,500);
  
}
  
  
}

