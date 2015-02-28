
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;
int y;
int spatie;
int stop;



void setup(){
size(500,500);
background(255,255,255);
monsterY = 500;
monsterX = 100;  
richting = 6;
teller = 0;
test = true;
y = 0;
spatie = 25;
stop = 600;
  


}
 
void draw(){
background(255,255,255);
Background();
Move();
Monster();
}

void Background(){  
  while(y < stop){
    println("test");
   noStroke();
   fill(143,157,187);
   rect(0,y,1000,10);
   y = y + spatie;
}
y=0;
}

void Move(){
if (monsterY <-120 || monsterY >660) {
  richting= -richting;
  teller = teller +1;
}
  
if (teller == 10) {
  teller = 0;
  test = !test;
}
  }

   
   
void Monster(){
  fill(0,200,200);
ellipseMode(CENTER);
ellipse(monsterX+30,monsterY+80,50,20);
 
fill(0,200,200);
ellipseMode(CENTER);
ellipse(monsterX-30,monsterY+80,50,20);
   
  stroke(0);
fill(0,200,150);
ellipseMode(CENTER);
ellipse(monsterX-80,monsterY+20,30,30);
 
stroke(0);
fill(0,200,150);
ellipseMode(CENTER);
ellipse(monsterX+80,monsterY+20,30,30);
 
stroke(0);
fill(0,200,255);

ellipseMode(CENTER);
ellipse(monsterX,monsterY,150,150);
 
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(monsterX-40,monsterY-30,60,60);
 
stroke(0);
fill(0);
ellipseMode(CENTER);
ellipse(monsterX+40,monsterY-30,60,60);
 
 
 
stroke(0);
fill(0);
rectMode(CENTER);
rect(monsterX,monsterY+30,100,40);
 
stroke(0);
fill(255);
rect(monsterX-30,monsterY+20,15,15);
 
stroke(0);
fill(255);
rect(monsterX-10,monsterY+20,15,15);
 
stroke(0);
fill(255);
rect(monsterX+10,monsterY+20,15,15);
 
stroke(0);
fill(255);
rect(monsterX+30,monsterY+20,15,15);
 
monsterY = monsterY + richting;

}
