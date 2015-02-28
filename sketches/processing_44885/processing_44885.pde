
int x = 40;
PFont font1;
PImage scan;
PImage front;
PImage front2;
PImage eye;
PImage eyed;
PImage matrix;
PImage mouse;
import gifAnimation.*;
PImage[] animation;
PImage[] animation2;
PImage[] animation3;
PImage[] animation4;

Gif loopingGif;
Gif loopingGif2;
Gif loopingGif3;
Gif loopingGif4;

boolean pause = false;
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;


void setup() {
  size(640, 450);
  minim = new Minim(this);
 
  song = minim.loadFile("eye.mp3");
  song.play();

   font1= loadFont("Meroitic_-_Hieroglyphics-48.vlw");
  frameRate(10);
loopingGif = new Gif(this, "redmatrix.gif");
  loopingGif.loop();  
  animation = Gif.getPImages(this, "redmatrix.gif");
  loopingGif2 = new Gif(this, "eyeofsaur2.gif");
  loopingGif2.loop();  
  animation2 = Gif.getPImages(this, "eyeofsaur2.gif");
  
   loopingGif3 = new Gif(this, "explosion2.gif");
  loopingGif3.loop();  
  animation3 = Gif.getPImages(this, "explosion2.gif");
  
  loopingGif4 = new Gif(this, "horusa.gif");
  loopingGif4.loop();  
  animation4 = Gif.getPImages(this, "horusa.gif");
  
scan = loadImage("scan.png"); 
eye = loadImage("eye3.png");
eyed = loadImage("eye.png"); 
front = loadImage("horus.png");
front2 = loadImage("horus3.png");
mouse = loadImage("ankh2.png");
  cursor(mouse,17,17);
}

void draw() {
  float bb = (mouseY-195);
  float cc = (mouseY-175);
  float tt = (mouseY-100);
  float ss = (mouseX-75);
  float mx = constrain( ss, 260, 370); 
  float my = constrain (tt, 140, 175);
  float mz = constrain (cc,5, 37);
  float ma = constrain (bb,7,12);
  background(0);
  smooth();
 


  ellipseMode(CENTER);
 noFill();
 stroke(#D60B04);
 strokeWeight(2);
 imageMode(CENTER);
  if (mousePressed == true) {
   background(#1b0e04);
    image(loopingGif2, mx,my );
  stroke(#FFC800);
  fill(0);
  ellipse(mx+7,my+17,ma,70);
    } 
    else {  
      noTint();
  image(loopingGif, 200, height / 2 - loopingGif.height / 2);
  image(loopingGif, 400, height / 2 - loopingGif.height / 2); 
    image(eyed,mx,my);
   ellipse(mx,my+1,mz,mz);
     
    if(mouseX > 230 && mouseX <300)
  {
    if(mouseY > 120 && mouseY < 145)
    {
     tint(153, 204, 126);
     image(eyed,mx,my,random(160,165),random(160,170));
     noStroke();
     fill(0);
     ellipse(mx,my+1,37,37);
      cursor(HAND);
}
else { 
cursor(mouse,17,17);
}
} 
    }
   
 
 noTint();

  
  


if (mousePressed == true) {
 
 
 image(loopingGif4,width/2,height/2);
 image(loopingGif3, mouseX,mouseY );
 fill(#FFC800);
 stroke(#FFC800);
 strokeWeight(3);
  noFill();
  rect(-5,-5,x*5,700);
  rect(-5,-5,700,x*5);
  text("a b c     d", random(640), random(450));
text("e   f g h", random(640), random(450));
text("h i j   k l", random(640), random(450));
  textSize(30);
textFont(font1);
  } 
    else { 
fill(#D60B04);
 
  
  image(front,width/2,height/2);
 
ellipse(mouseX-35,mouseY,10,10);
ellipse(mouseX-20,mouseY-25,10,10);
ellipse(mouseX-5,mouseY,10,10); 

text("a b c     d", random(640), random(450));
text("e   f g h", random(640), random(450));
text("h i j   k l", random(640), random(450));
  textSize(30);
textFont(font1);
stroke(#D60B04);
 noFill();
  rect(-5,-5,x*5,700);
  rect(-5,-5,700,x*5);}
  if (x*5 > 700) {
    x = 1;
  } else {
  x++;
}
}

