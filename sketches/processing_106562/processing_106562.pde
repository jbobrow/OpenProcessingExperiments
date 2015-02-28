
int ax=200;
int ay=0;

int ady=5;
int adx=5;

//int acol=1

int bx=0;
int by=200;

int bdy=3;
int bdx=3;

void setup() {  //setup function called initially, only once
  size(400, 400);
  println("setup")
}

void draw() {  //draw function loops 
background(255,255,255);

if(acol=1){
fill(255,0,0);
}

else if(acol=2){
fill(0,255,0);
}

else if(acol=3){
fill(0,0,255);
}

else{
fill(0,0,0);
}

ellipse(ax,ay,20,20);

ay=ay+ady;
ax=ax+adx;

if (ay>400){
ady=-ady;
}

if (ay<0){
ady=-ady;
}

if (ax>400){
adx=-adx;
}

if (ax<0){
adx=-adx;
}

if (mousePressed){
ax=mouseX;
ay=mouseY;
acol=acol+1;
}

if(acol=4){
acol=1;
}

ellipse(bx,by,20,20);

by=by+bdy;
bx=bx+bdx;

if (by>400){
bdy=-bdy;
}

if (by<0){
bdy=-bdy;
}

if (bx>400){
bdx=-bdx;
}

if (bx<0){
bdx=-bdx;
}

if (mousePressed){
bx=mouseX;
by=mouseY;
}

}

//void draw(){
//fill (10,10,10);
//ellipse(ax,ay,10,10);
//ellipse(bx,by,10,10);
//}
