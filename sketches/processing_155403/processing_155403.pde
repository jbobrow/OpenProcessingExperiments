
int rect1;
int rect2;
int rect3;
int x;
boolean down;
 
void setup() {
 size(500, 500);
  background(0);
  x=200;
  rect1=int(500/1.3);
  rect2=500/5;
  rect3=500/2;
  float mouseY=height/1.060;
} 
 
void draw() {
   if(mouseY>rect1 && mouseY<rect1+30 && x > (500/2.5) && x < (500/2.5)+60){
     background(255,0,0);
   }   
   else if(mouseY>rect2 && mouseY<rect2+30  && x > (500/2.5) && x < (500/2.5)+60){
     background(255,0,0);
   }
   else if(mouseY>rect3 && mouseY<rect3+30  && x > (500/2.5) && x < (500/2.5)+60){
    background(255,0,0);
  }
  else{
    background(0);
  }
  //background(0);
  noStroke();
  fill(255);
  rect(500/2.5,0,60,490);
  fill(255,0,0);
  rect(500/2.5,0,60,60);
  fill(0,255,0);
  rect(500/2.5,420,60,60);
  fill(0,0,255);
  ellipse(500/2.2,mouseY,40,40);
  fill(255,255,0);
  rect(x,rect1,90,30);
    if(x>400){
      down=false;
    }
  if(x<0){
    down=true;
  }
  if(down==false){
    x=x-20;
  }
  if(down==true){
    x=x+20;
  }
 
 
 rect(x,rect2,90,30);
  rect(x,rect3,90,30);
  if(mouseY>50){
    fill(254,217,0);
      ellipse(300,40,40,40);
  }
  
  if(mouseY<50){
   fill(0,255,0);
    ellipse(300,40,40,40);
  }
  if(mouseY>400){
    fill(255,0,0);
    ellipse(300,40,40,40);
  }
  
  fill(255,255,255);
  ellipse(30,450,50,50);
  if(mousePressed){
    fill(0);
    ellipse(30,450,60,60);
  }
}
