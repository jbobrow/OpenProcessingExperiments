
int lock = 0;
int footy = 2;
boolean over = false;  
int move = 0;  
float Rx = 100;
float Ry = 90;
float py = 90.0; 
float vy = 0.0;  
float px = 100.0; 
float vx = 0.0;  
int jawcolor=1;
int i;
PImage b;
PShape s;
int shake=1;
int ai=0;
float c;
PImage cloud;
int cloudspeed=600;
String[] numbers = {"#&^$%$$^","@#%$%$&...%&","...!@#%%&","#$%..&^*#%","&^%$%$#*"}; 

void jaw(){ //jaw
  rect(px, py, 80, 16);
}

void pants() //pants
{
fill(185,47,10);
rect(112, 160+footy, 57, 20);

shape(s, 125, 145+footy, 30, 30);
}

void shadow() //shawdow
{
fill(1,40);
rect(115, 197, 51, 7);
rect(210, 197, 260, 4);
}

void angry() //shawdow
{
fill(255,200-ai*30);
ellipse(216, 37-ai*3, 22, 22);
ellipse(210, 37-ai*3, 22, 22);
ellipse(220, 43-ai*3, 22, 22);
triangle(195, 60-ai*3, 210, 35-ai*3, 225, 40-ai*3);

ellipse(70, 38-ai*3, 22, 22);
ellipse(62, 43-ai*3, 22, 22);
ellipse(67, 37-ai*3, 22, 22);
triangle(82, 60-ai*3, 57, 45-ai*3, 72, 40-ai*3);
}

void head() //head
{

fill(i,0,0);
rect(100+shake, 25, 80, 60);
fill(255);
if (move!=0){
  stroke(255);
  strokeWeight(3);
  line(115+shake,50,125+shake,60);
  line(125+shake,50,115+shake,60);
  line(153+shake,50,163+shake,60);
  line(163+shake,50,153+shake,60);
  noStroke();
}
else{
ellipse(120+(mouseX-120)/35, 55+(mouseY-55)/30, 15, 15);
ellipse(158+(mouseX-150)/35, 55+(mouseY-55)/30, 15, 15);
}


// ears

fill(i,0,0);
arc(95+shake, 70, 30, 30, PI/2, TWO_PI-PI/2);
arc(185+shake, 70, 30, 30, TWO_PI-PI/2, TWO_PI);
arc(185+shake, 69, 30, 30, 0, PI/2);

}

void body()
{
  
fill(1);
arc(130, 130+footy, 30, 30, PI, TWO_PI-PI/2);
arc(150, 130+footy, 30, 30, TWO_PI-PI/2, TWO_PI);
rect(105, 125+footy, 85, 5);
rect(95, 120+footy, 15, 40);
rect(130, 110+footy, 21, 20);
rect(115, 130+footy, 51, 40);
}

void righthand()
{
quad(200, 81, 220, 90, 185, 135, 170, 126);
}
void righthand2()
{
quad(212, 91, 229, 104, 183, 139, 171, 126);
}
void setup(){
PFont metaBold;
metaBold = loadFont("AquaBase-48.vlw");
s = loadShape("star.svg");
b = loadImage("background.jpg");
cloud = loadImage("cloud.png");



textFont(metaBold, 22); 
smooth();
size(550, 240);


}

void foot()
{
rect(120, 180+footy, 10, 20);
rect(150, 180, 10, 20);
rect(115, 160, 51, 30); // black pants
}


void draw(){

image(b, 0, 0);
image(cloud, cloudspeed, 40);
shadow();
body();

   if (py < 86) {
    lock=1;
  }
    else if(py > 94){
     lock=0;
  }
  if (lock == 1) {
    moveback();
    footy=1;
    righthand();    
  }
    else{
      move();
      footy=-1;
      righthand2();
      
  }
  

fill(1);
foot();
head();
pants();
jawdrag();
if (move==1){
angry();

}

stroke(1);
strokeWeight(1);
line(140,98,px+40,py+8);
noStroke();
fill(i,0,0);
jaw();
noFill();
stroke(1);
rect(0, 0, 549, 239);
noStroke();
cloudspeed--;
if (cloudspeed<-600)
{
cloudspeed=600;
}
fill(255);
text("Hello, world. Drag my jaw!", 200, 185);





println(ai);
}

void move(){
py=py+(85-py)/3;
}
void moveback(){
py=py+(95-py)/3;
}


void jawdrag()
{
  if(move==2) {
    i=1;    
    vy = 0.8 * (vy + (- (py - Ry) / 2));  
    py = py + vy;        
    vx = 0.8 * (vx + (- (px - Rx) / 2));  
    px = px + vx;    
     shake++;
     
    if (shake==3){
    shake=-3;
    }   
      if(abs(vy) < 0.1 || abs(vx) < 0.1) {
    vy = 0.0;
     move=0;
    vx = 0.0;
    px=Rx;
    py=Ry;
    shake=0;
  }
  }

  if(mouseX>100 &&mouseX <180 &&mouseY >py-10 && mouseY<py+20)
  {
  fill(255);
  ellipse(174,39,5,20);
  cursor(HAND);
  jawcolor=70;
  over=true;
  }
  else
  {
    cursor(ARROW);
    jawcolor=1;
    over=false;
  } 
  if(move==1) {

    text(numbers[int(c)],260+int(c)*2,80+int(c)*2);
   
    i++;
    shake++;
    if (shake==3){
    shake=-3;
    }
    ai++;
if(ai==5){
c = random(5);
ai=0;
}
    py = py+(pmouseY-8-py)/3;
    px = px+(pmouseX-40-px)/3;
  }
}

void mousePressed() {
  if(over) {
    move = 1;
  }
}

void mouseReleased()
{
  move = 2;
}


