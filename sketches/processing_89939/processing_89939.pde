
int k;
int p1 = (#FFFFFF);
int p2 = (#FFFFFF);
int p3 = (#FFFFFF);
int p4 = (#FFFFFF);


void setup(){
size (600,600);
smooth();
}
int x = 300;
int y = 300;
int d = 60;

void draw(){
pacMan(x,x,d);
background(#000000);
fill(#FFFFFF);
text("use i,k,l,j to move space to stop\n and r to refresh the dots",width/2,50);

noStroke();
fill(p1);
ellipse(100,100,d/4,d/4);

noStroke();
fill(p2);
ellipse(200,200,d/4,d/4);

noStroke();
fill(p3);
ellipse(400,400,d/4,d/4);

noStroke();
fill(p4);
ellipse(500,500,d/4,d/4);

x = constrain(x,0+d/2,600-d/2);
y = constrain(y,0+d/2,600-d/2);

keyMove();


if(dist(100,100,x,y) < d/2){
  p1 = #000000;
}
if(key=='r') p1=#FFFFFF;

if(dist(200,200,x,y) < d/2){
  p2 = #000000;
}
if(key=='r') p2=#FFFFFF;

if(dist(400,400,x,y) < d/2){
  p3 = #000000;
}
if(key=='r') p3=#FFFFFF;

if(dist(500,500,x,y) < d/2){
  p4 = #000000;
}
if(key=='r') p4=#FFFFFF;
}

void keyMove(){
  if(key == ' ') k = 0;
 if(key == 'i') k = 1;
 if(key == 'k') k = 2;
 if(key == 'l') k = 3;
 if(key == 'j') k = 4;
 
 if(k == 0){
   pacMan(x,y,d);
   }
 if(k == 1){
   pacMan(x,y,d);
   y -= 2;
   }
   if(k == 2){
   pacMan(x,y,d);
   y += 2;
   } 
 if(k == 3){
   pacMan(x,y,d);
   x += 2;
   }
    if(k == 4){
   pacMan(x,y,d);
   x -= 2;
   }
}

 
void pacMan(int x,int y, int s){
fill(#FFEF00);
  arc(x,y,s,s, PI*.02,PI*1.8);
  
}

