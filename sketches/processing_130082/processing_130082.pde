
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;


void setup(){
size(500,500);
background(255,255,255);
monsterY = 500;
richting = 10;
teller = 0;
test = true;
}
 
void draw(){
  monsterX = mouseX;
  monsterY = monsterY + richting;
background(255,255,255);

if(monsterY < 0|| monsterY > height){
richting = -richting;
teller = teller + 1;
}
   
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
if(test){fill(0,200,255);}
if(!test){fill(5,100,20);}
if(teller == 10){ teller = 0; test = !test;}

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
 
 println(teller);

}
