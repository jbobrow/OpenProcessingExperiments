
PImage a;
 
int alpha= 0;
int alpha2= 0;
int alpha3= 0;
import ddf.minim.*;
AudioPlayer song;
 Minim minim;

void setup(){
 
  size(600,900);
  a= loadImage("003.jpg");
  
  
 imageMode(CENTER);
 // noCursor();
 noStroke();
 minim = new Minim(this);
 song = minim.loadFile("whistle.mp3");
  //image(a,300,450,width,height);
}

void draw(){
 image(a,300,450,width,height);
  //image(b,mouseY,mouseX,b.width/4,b.height/4);
  println(mouseX+" "+mouseY);
  fill(0,0);
  ellipse(306,368,23,22);
  ellipse(343,367,23,22);
  
  fill(255,255,255);
  quad(244,492,247,546,272,547,281,492);
  ellipse(260,542,28,19);
  fill(#B4B4B4);
  ellipse(262,490,40,22);
  
  fill(#4BB2FF,alpha);
  rect(255,423,10,80); 
  
  textSize(32);
    fill(0,alpha2);
   text("^3^",304,299);
    //fill(0,alpha3);
    //text("^.^",304,299);
   
   
}
  
  

void mousePressed() {
  if(alpha == 0 && mouseX>=295 && mouseX<=317 && mouseY >=357 && mouseY<=379) {
   alpha = 100;
   song.play();
   alpha2=100;
   
   
   
 
  
  } 
  else{alpha = 0;
  song.pause();
  alpha2=0;
}
}


