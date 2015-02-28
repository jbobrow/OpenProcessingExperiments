
void setup(){
  size(300,300);
  colorMode(RGB);
  background(140,186,240);
  smooth(); 
}

float flyStartX = random(50,250);
float flyStartY = random(50,250);

void draw(){
  //setting up torso size
  int a=(150);
  int b=(250);
  background(150);
  
  //creating body and head
  ellipse(150,300,a,b);
  fill(255);
  ellipse(75,150,10,30);
  ellipse(225,150,10,30);
  fill(250,13,44);
  ellipse(150,300,a,b);
  fill(255);
  ellipse(150,200,100,150);
  ellipse(150,150,150,150);
  
  //creating eyes
  ellipse(190,140,15,15);
  ellipse(110,140,15,15);
  fill(0,0,0);
  ellipse(190,140,5,5);
  ellipse(110,140,5,5);
  
  //creating hat
  fill(134,39,110);
  ellipse(148,85,132,40);
  rectMode(CORNER);
  rect(45,110,170,5);
  rect(80,85,135,25);
 
 //setting up interaction with mouth (open and closed)
 if(mouseY>200){
   fill(255,77,104);
   ellipse(150,200,75,50);
 }
 else{
   fill(255,77,104);
   ellipse(150,200,75,1);
 }
  
  //setting up eyes to get bigger when burger is raised
  if(mouseY<150){
    fill(255);
    ellipse(190,140,30,30);
    ellipse(110,140,30,30);
    fill(0,0,0);
    ellipse(190,140,20,20);
    ellipse(110,140,20,20);
  }
  
  else{
    fill(255);
    ellipse(190,140,15,15);
    ellipse(110,140,15,15);
    fill(0,0,0);
    ellipse(190,140,5,5);
    ellipse(110,140,5,5);
    }
  
  //hammbburrgeeeerrrr  
  fill(222,168,67);
  ellipse(mouseX,mouseY,60,50);
  fill(67,58,42);
  rectMode(CENTER);
  rect(mouseX,mouseY,65,10);
  
  //change image allowing burger to go into mouth. 
  //everything else is the same as above
  if (mousePressed){
    background(b++*3);
  ellipse(150,300,a,b);
  fill(250,13,44);
  ellipse(150,300,a+300,b);
  fill(0,255,0);
  ellipse(150,200,100,150);
  ellipse(190,140,15,15);
  ellipse(110,140,15,15);
  fill(0,0,0);
  ellipse(190,140,5,5);
  ellipse(110,140,5,5);
  
 
 if(mouseY>200){
   fill(255,77,104);
   ellipse(150,200,75,1);
 }
 else{
   fill(255,77,104);
   ellipse(150,200,75,1);
 }
  
  if(mouseY<150){
    fill(255);
    ellipse(190,140,30,30);
    ellipse(110,140,30,30);
    fill(0,0,0);
    ellipse(190,140,20,20);
    ellipse(110,140,20,20);
    
  }
    fill(30,30,30);
    ellipse(flyStartX,flyStartY,10,5);
    flyStartX += random(-5,5);
    flyStartY += random(-5,5);
    
  }
  }
  



  
    
 


