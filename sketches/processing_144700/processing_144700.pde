
int X;
int Y;
 
/*
int richting;
int teller = 0;
boolean test = true;
*/
 
void setup(){
   size(500,500);
/*  monsterX = 250;
  monsterY = 250;
  richting = 10; */
  background(255);
  X = height/2;
  Y = 0;
}
 
void draw(){
for (int i = 1; i < 4; i = i + 1){
teken((i*125),X);
}
}
  
void teken(int monsterX, int monsterY) {
   
  /*head*/
  stroke(0);
  ellipseMode(CENTER);
   fill(218,56,110);
  ellipse(monsterX,monsterY,250,250);
  
  
   
  /*eyes*/
  fill(255,255,255);
ellipse(monsterX-50,monsterY-80,100,100);
ellipse(monsterX+50,monsterY-80,100,100);
fill(0);
ellipse(monsterX-50,monsterY-80,50,50);
ellipse(monsterX+50,monsterY-80,50,50);
fill(255,255,255);
ellipse(monsterX-60,monsterY-60,10,10);
fill(255,255,255);
ellipse(monsterX+40,monsterY-60,10,10);

  
  
  
 

   
fill(225,80,130);
 
ellipse(monsterX-35,monsterY+80,80,80);
fill(225,80,130);
ellipse(monsterX+35,monsterY+80,80,80);
}



