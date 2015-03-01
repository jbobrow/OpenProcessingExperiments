
PImage bad;
PImage hero;

 
void setup() {
size(400,400);
bad = loadImage("http://grooveonfire.com/wp-content/uploads/2013/09/BowzerPartyDS.png");
hero = loadImage("http://jpstx.pro/wp-content/uploads/2013/12/luigi_mario.jpg");
}
void draw(){
int r = random(150,255);
int g = random(150,255);
int b = random(150,255);
if(mousePressed==true){
image(hero,0,0,400,400);
textSize(32);
fill(0, 243, 255)
   text("Yay!!!", 200, 350);
   fill(r,g,b);
ellipse(200,28,50,50);  
ellipse(26,355,50,50);
ellipse(180,370,50,50);
ellipse(373,350,50,50);
}else{
image(bad,0,0,400,400);
textSize(32);
fill(255,0,0);
   text("Oh No!!!", 200, 350);
  
}
}

