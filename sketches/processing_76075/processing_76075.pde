
int X;
int dir;
float y;

void setup(){
size(800,800);
X = 500;
dir = -8;
y = 90;
}

void draw(){
  
background(mouseX,mouseY,random(255));
smooth();
fill(259,189,200);
rect(200,20,1355,203);
fill(200,100,200);
rect(30,40,y,y);
y+=5;

fill(46,69,124);
rect(700,339,600,500);
fill(19,95,72);
rect(200,400,503,500);
fill(1,2,3);
rect(100,300,30,900);
fill(10,200,300);
ellipse(X,-30,-2,9000);
ellipse(X,50,80,200);
fill(600,30,40);
ellipse(X,261,800,-20);
fill(125,44,232);
ellipse(X,200,-500,100);
fill(26,33,211);
ellipse(X,371,200,200);
fill(4,9,134);
ellipse(X,531,50,120);
fill(71,3,98);
rect(X,592,-100,500);
fill(71,3,98);
rect(X,592,100,500); 
//rect(X,50,-200,-400);
//rect(X,-400,500,200);
X += dir;
if(X > width){
dir =-270;
}
if(X< 0){
  dir=400;
}

if(mousePressed){
  dir = -8;
  y = 90;
}

}

