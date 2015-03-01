
PImage bad;
PImage hero;
 
  
void setup() {
size(400,400);
bad = loadImage("http://scienceroll.files.wordpress.com/2007/02/sonichedgehog.jpg");
hero = loadImage ("http://th08.deviantart.net/fs70/PRE/i/2013/255/a/7/super_sonic_by_daniela_3-d6m1uu9.png");
}
void draw(){
int r = random(150,255);
int g = random(150,255);
int b = random(150,255);
if(mousePressed==true){
image(hero,0,0,400,400);
textSize(32);
fill(0, 243, 255)
   text("SUPER!!!", 200, 350);
   fill(r,g,b);
ellipse(200,28,50,50); 
ellipse(26,355,50,50);
ellipse(180,370,50,50);
ellipse(373,350,50,50);
}else{
image(bad,0,0,400,400);
textSize(32);
fill(255,0,0);
   text("SONIC!!!", 200, 350);
   
}
}
 

 
