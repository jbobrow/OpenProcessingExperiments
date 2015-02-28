
/* @pjs font="Pokemon Solid.ttf"; font="Pokemon Hollow.ttf"; */
PFont c ;
PFont d ;
PImage Cha ;
float x = -250 ;
float x1 = 10 ;
float drop = -600 ;
float drop2 = 10;
float sh = 250 ;
float delay = .02;
float l = 0.5;
float li = .001;
float co = 0 ;
float cov = .003 ;
float fa = 1000 ;
float fa2 = 2 ;
float ct = 1000 ;
float ct2 = .01 ;
float flash = 0 ;
float flash2 = .01 ;
float xx = -1000;
float xx1 = 0 ;

void setup() {
  size(500,500) ;
c = createFont("Pokemon Solid.ttf", 200) ;
d = createFont("Pokemon Hollow.ttf", 200) ;
Cha = loadImage("Cha.gif") ;
}

void draw() {
 // words and such
  background(255) ;
  fill(0,255,80);
  rect(0,380,500,200);
tint(255,ct) ;
imageMode(CENTER) ;
image(Cha,250,250) ; 
ct = ct - ct2 ; 
if(ct < 999) {
  ct2 = 1000 ;
}
  fill(255) ;
textFont(c,40); 
  text("Go Pokeball !", x,450) ;
fill(0) ;
textFont(d,40); 
  text("Go Pokeball !", x,450) ;
x = x + x1 - ct2;
if(x > 150) {
  x1 = 0 ;
}

// pokeball
fill(255,255,255);
ellipse(sh,drop,50,50);
fill(0,0,0);
rect(sh-25,drop,50,3);
fill(255,0,0);
arc(sh,drop,50,50,PI, TWO_PI) ;
fill(255,255,255);
ellipse(sh,drop+1.5,10,10);
fill(255,0,0,random(0,100));
ellipse(sh,drop+1.5,10,10);
fill(255,255,255) ;
quad(sh+11,drop-17,sh+11,drop-13,sh+17,drop-11,sh+21,drop-6);
drop = drop + drop2 ;
if(drop > 440) {
  drop2 = 0 ;
}

//flash
fill(255,255,255,flash); 
rect(0,0,500,500);
flash = flash + flash2 ;
if(flash > 1){
 flash2 = 300 ; 
}
if(flash > 5000) {
  flash2 = -10000;
}

//shake
sh = sh - delay ;
if(sh < 248) {
delay = 1 ; 
}
if(sh < 248) {
sh = 252 ; 
}
tint(255,co) ;
image(Cha,250,250) ;
//got away
fill(255,255,255,fa) ;
rect(0,0,co,co) ;
co = co + cov;
if(co > 1) {
  cov = 1000 ;
}
fa = fa - fa2 ;
if(co > 1000) {
 sh = 100; 
}
fill(250);
textFont(c,40); 
  text("Pokeball Failed !", xx,450) ;
fill(0) ;
textFont(d,40); 
  text("Pokeball Failed !", xx,450) ;
  xx = xx + xx1 ;
  if(co > 25000) {
    xx1 = 30 ;
  }
  if(xx > 80) {
   xx1 = 0 ; 
  }
  
 println(mouseX + "," + mouseY) ; 
}



