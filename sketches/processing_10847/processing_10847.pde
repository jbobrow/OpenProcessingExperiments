

PFont font; //Consolas-12

int bg=255; //background
float tx,ty;
int t=0;
int scr=0;
int ovlt=0;
int tt;
int fr=24;
int oft=15;
boolean rn=false;
int sp=1;
int sz=5;
float[][] obst = new float[1][2];


void setup(){
  font = loadFont("Consolas-12.vlw"); 
  textFont(font, 10); 
  mouseX=width/2;
    mouseY=height/2;
size(200,200);
frameRate(fr);
noCursor();
smooth();
tx=15;
ty=15;
}

void draw(){

background(255);

t++;
tt=round(random(oft));

if (t==tt && rn ==false){
  stroke(0,255,0);
lnch();
}

if (t==oft){
t=0;
}
//turret
stroke(0);
strokeWeight(1);
fill(0,255,0);
ellipse(mouseX,mouseY,sz,sz);
//turret-end

  if (obst[0][1] >0 ){
    ellipse(obst[0][0],obst[0][1],5,5);
    obst[0][1]=obst[0][1]+sp;
    if (obst[0][1] > 199){
      obst[0][1]=0;
      rn=false;
    }
  }

if (dist(obst[0][0],obst[0][1],mouseX,mouseY) < (2.5 +(sz/2))) {
  scr++;
  if (sz<50){
  sz++;
  }
  
  sp++;
  if (oft >4){
    oft--;
    t=0;
  }
  if (sp>10){
    fr++;
  }

  obst[0][1] = 0;
  rn= false;

}
fill(0);
text("Spd: "+sp+ " F/R: "+fr+ " Freq: "+oft ,0,height-5);
text(" x= "+obst[0][0]+" y= "+obst[0][1]+" | "+t+" | "+tt,0,height-15);
}

void lnch(){
obst[0][0]=random(width);
obst[0][1]=1;
rn=true;
ovlt++;
  
}

void keyPressed() {
  if (key=='s' || key=='S'){
  noLoop();
  text("Your Score: "+scr+"/"+ovlt,width/4,height/2);
  }
  }
  


