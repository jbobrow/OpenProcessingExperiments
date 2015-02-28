
int monsterX;
int monsterY;



void setup(){
size(500,500);
background(255,255,255);
monsterY = 500;

}
 
void draw(){
background(255,255,255);
for (int i = 0; i < 10; i = i +1){
Monster(-61+(i*210),255);
}
}
   
   
void Monster(int monsterX, int monsterY){
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
 


}
