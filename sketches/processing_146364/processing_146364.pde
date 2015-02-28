
int mida=180;
int x;
int y;
int v=10;

void setup(){
size(700,700);
background(51);
x=width/2;
y=height/2;
}
 
 
void draw(){
background(51);
noStroke();
 
fill(183,39,39);
rect(x-90,y-70,10,160);//bras dret
rect(x+80,y-70,10,160);//bras esquerre
rect(x-50,y-190,100,100);//Cap
rect(x-70,y-80,140,180);//cuerpo principal 
rect(x-65,y+100,45,80);//fut
rect(x+20,y+100,45,80);//fut 
fill(10,10,10);
stroke(255,252,252);
strokeWeight(3);
ellipse(x-25,y-160,30,30);//ull dret
ellipse(x+25,y-160,30,30);//ull esq 
rect(x-30,y-120,60,20);//boca
triangle(x,y-145,x-5,y-130,x+5,y-130);//nas
fill(255,252,252);
stroke(10,10,10);

float r = random(60);

if (r < 15) {
    //cap amunt
    y = y - v;
  } 
  else if (r < 30) {
    //cap avall
    y = y +v;
  } 
  else if (r <45) {
    //dreta
    x = x+v;
  } 
  else {
    //esquerra
    x = x-v;
  }

  comprovaLimits();
  
  if(x>width/4){
  fill(106,211,75);
  rect(x-50,y-60,100,100);//quadro blanc
  }
  if(x>width/2){
  fill(75,169,211);  
  rect(x-50,y-60,100,100);//quadro blanc
  
  }
  if(x<width/2){
  fill(202,75,211);
  rect(x-50,y-60,100,100);
  }
  if(x<width/4){
  fill(211,173,75);
  rect(x-50,y-60,100,100);
  }
}

void comprovaLimits() {
  if (x-mida/2<0) {
    x =mida/2;
  }
  if (x+mida/2>width) {
    x=width-mida/2;
  }
  if (y-mida/2<0) {
    y =mida/2;
  }
  if (y+mida/2>height) {
    y=height-mida/2;
  }

}

void mousePressed(){
  x=mouseX;
  y=mouseY;
}



