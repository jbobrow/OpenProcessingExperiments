
  PFont myfont;
float r = 0;
float m=0;
float h=0;
float a=255;
float f=0;
float g=0;
float d=0;
float speed = 0.001;
void setup(){
 size(1024,640);
   myfont = loadFont("font.vlw");
   background(0);
   rectMode(CENTER);

smooth();   
}

void draw(){
  if(mousePressed=true){
    noCursor();
  }else{ cursor(HAND);}
  colorMode(HSB);  fill(d,f,g,25);
  colorMode(RGB);
  //controls speed of fade
rect(width/2,height/2,width,height);

fill(a,a); 

  textFont(myfont);
      textSize(30);
  text("Left to start. Right to play. Space to breathe. H to learn.",10,height-10);
  fill(h,h);
  textSize(20);
  text("(QWE to develop. ASD to constrict. ENTER to live. Delete to die. Swiftness is multiplicity)", 10, height-50);
//"(QWE will explode. ASD won't destroy.)"
  translate(mouseX, mouseY);
  rotate(r);
  fill(255);
    textSize(50+m);
  
text("ROTATE",0,0);
//object to rotate
//rect(0,0,100,100);
r=r+speed;
//controls speed of rotation

}
void mousePressed(){
   if (mouseButton==RIGHT){
  speed=speed+0.01;}
    else if (mouseButton==LEFT){
      speed=speed-0.01;}
}
void keyPressed(){
//if (key==CODED){
 if (keyCode==32){ speed=0.001;
 }else if(keyCode==81){ m=m+1;
  }else if(keyCode==87){ m=m+1;
    }else if(keyCode==69){ m=m+1;
 }else if(keyCode==65){ m=m-1;
   }else if(keyCode==83){ m=m-1;
     }else if(keyCode==68){ m=m-1;
     }else if(keyCode==72){h=255; a=0;
     }else if(keyCode==ENTER){d=random(255);f=255;g=255;
    
 }}
 void keyReleased(){
   if(keyCode==72){
     h=0;a=255;}
    if(keyCode==8){
      d=0;f=0;g=0;}
      
      
    }

