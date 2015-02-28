



//Using photos took by me to create an interactive game 
//with audio effect named
//"Do you remember which floor your neighbors live in?"

import ddf.minim.*;

Minim minim;



AudioSample effect1; //screaming of man from http://www.soundjay.com/scream-sound-effect.html
AudioSample effect2; //screaming of woman from https://www.youtube.com/watch?v=BFqHyCoypfM&feature=player_embedded
AudioPlayer bgsound; //from http://www.youtube.com/watch?v=RE4EiD8DTbI


PImage abc, me, father, natalie,billy,classmate,belinda,ashley,vivian;




float es = 100;
float ex,ey;
float dx,dy;
float tx,ty;
float fx,fy;
float gx,gy;
float hx,hy;
float ix,iy;
float jx,jy;

boolean over = false;
boolean locked = false;
boolean over1 = false;
boolean locked1 = false;
boolean over2 = false;
boolean locked2 = false;


boolean over3 = false;
boolean locked3 = false;

boolean over4 = false;
boolean locked4 = false;

boolean over5 = false;
boolean locked5 = false;

boolean over6 = false;
boolean locked6 = false;
boolean over7 = false;
boolean locked7 = false;


float xoff, yoff;
float xoff1,yoff1;
float xoff2,yoff2;
float xoff3, yoff3;
float xoff4,yoff4;
float xoff5,yoff5;
float xoff6, yoff6;
float xoff7,yoff7;

//set drag and drop of images:icons of neighbors



void setup() {
  
      //add sound effect

  minim = new Minim(this);
  effect1 = minim.loadSample("manscream.mp3");
  effect2 = minim.loadSample("womanscream.mp3");
  bgsound = minim.loadFile("music.mp3");
  bgsound.loop();

  
    ex = width/2;
    ey = height/2;
    dx = width/2+100;
    dy = height/2+100;
    tx = width/3+200;
    ty = height/3+200;
    
    fx=width/4+300;
    fy=height/4+300;
gx=width/5+400;
gy=height/5+400;
hx=width/6+500;
hy=height/6+500;
ix=width/7+600;
iy=height/7+600;
jx=width/8+700;
jy=height/8+700;


    
    //add images
    
  abc=loadImage("abc.jpg");
  size(850,850);
 imageMode(CENTER);
 
 me=loadImage("me.png");
 father=loadImage("father.png"); 
 natalie=loadImage("natalie.png");
 billy=loadImage("billy.png");
 
 classmate=loadImage("classmate.png");
 belinda=loadImage("belinda.png");
 
 ashley=loadImage("ashley.png");
 vivian=loadImage("vivian.png");
 

}


void draw() {
  background(abc);
  
  
  if(dist(mouseX,mouseY,ex,ey) < es/2){
     fill(200);
     over = true;
  }
  else{
     fill(255);
     over = false;
  }
image (me,ex,ey,es,es);

if(dist(mouseX,mouseY,dx,dy)<es/2){
  fill(20);
  over1 = true;
}
else{
  fill(25);
  over1 = false;
} 
image(father,dx,dy,es,es);

if(dist(mouseX,mouseY,tx,ty)<es/2){
  fill(30);
  over2= true;
}
else{
  fill(35);
  over2= false;
} 
image(natalie,tx,ty,es,es);

//

if(dist(mouseX,mouseY,fx,fy) < es/2){
     fill(210);
     over3 = true;
  }
  else{
     fill(215);
     over3 = false;
  }
image (billy,fx,fy,es,es);

if(dist(mouseX,mouseY,gx,gy) < es/2){
     fill(50);
     over4= true;
  }
  else{
     fill(55);
     over4 = false;
  }
image (classmate,gx,gy,es,es);

//
if(dist(mouseX,mouseY,hx,hy) < es/2){
     fill(550);
     over5= true;
  }
  else{
     fill(550);
     over5= false;
  }
image (belinda,hx,hy,es,es);
//

if(dist(mouseX,mouseY,ix,iy) < es/2){
     fill(502);
     over6= true;
  }
  else{
     fill(552);
     over6= false;
  }
image (ashley,ix,iy,es,es);
//
if(dist(mouseX,mouseY,jx,jy) < es/2){
     fill(542);
     over7= true;
  }
  else{
     fill(552);
     over7= false;
  }
image (vivian,jx,jy,es,es);


}



void mousePressed(){
   if(over){
      locked = true;
      xoff = mouseX-ex;
      yoff = mouseY-ey;
      effect2.trigger();
   }
   if(over1){
      locked1 = true;
      xoff1 = mouseX-dx;
      yoff1= mouseY-dy;
      effect1.trigger();
}

if(over2){
      locked2 = true;
      xoff2 = mouseX-tx;
      yoff2 = mouseY-ty;
       effect2.trigger();
   }
   //
   if(over3){
      locked3 = true;
      xoff3 = mouseX-fx;
      yoff3 = mouseY-fy;
       effect1.trigger();
   }
   
   //
   
   if(over4){
      locked4 = true;
      xoff4 = mouseX-gx;
      yoff4 = mouseY-gy;
       effect1.trigger();
   }
   
   //
   
   if(over5){
      locked5 = true;
      xoff5 = mouseX-hx;
      yoff5 = mouseY-hy;
       effect2.trigger();
   }
   //

if(over6){
      locked6 = true;
      xoff6 = mouseX-ix;
      yoff6 = mouseY-iy;
       effect2.trigger();
   }
   
   //
   
   if(over7){
      locked7 = true;
      xoff7 = mouseX-jx;
      yoff7 = mouseY-jy;
       effect2.trigger();
   }
}
void mouseDragged(){
   if(locked){
      ex = mouseX-xoff;
      ey = mouseY-yoff;
   }  
   if(locked1){
     dx =mouseX-xoff1;
     dy =mouseY-yoff1;
   }
   if(locked2){
     tx =mouseX-xoff2;
     ty =mouseY-yoff2;
   }
   
   //
   if(locked3){
      fx = mouseX-xoff3;
      fy = mouseY-yoff3;
   }  
   //
   
   if(locked4){
      gx = mouseX-xoff4;
      gy = mouseY-yoff4;
   }  
   
   //
   if(locked5){
      hx = mouseX-xoff5;
      hy = mouseY-yoff5;
   }  
   
   //
   
   if(locked6){
      ix = mouseX-xoff6;
      iy = mouseY-yoff6;
   }  
   //
   if(locked7){
      jx = mouseX-xoff7;
      jy = mouseY-yoff7;
   }  
   
}
void mouseReleased(){
   locked = false;
   locked1 = false;
   locked2 = false;
   locked3 = false;
   locked4 = false;
   locked5 = false;
   locked6 = false;
   locked7 = false;
   
 
}




  

