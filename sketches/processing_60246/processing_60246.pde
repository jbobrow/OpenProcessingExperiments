


PImage ab;
PImage bb;
PImage cb;
PImage db;
PImage eb;
PImage fb;
PImage gb;
PImage hb;
PImage ib;
PImage jb;
PImage sleep;
PImage squirrel;

void setup(){
size(700,700);

ab=loadImage("1.png");
bb=loadImage("2.png");
cb=loadImage("3.png");
db=loadImage("4.png");
eb=loadImage("5.png");
fb=loadImage("6.png");
gb=loadImage("7.png");
hb=loadImage("8.png");
ib=loadImage("9.png");
jb=loadImage("10.png");
sleep=loadImage("sleeping.jpg");
squirrel=loadImage("squirrel.png");
}

void draw(){
 
  
  
  
if ( mouseY>536 && mouseY<700 && mouseX>345 &&mouseX<510){
     image(ab,0,0,700,700);
   }else
  
  
if ( mouseY>400 && mouseY<700 && mouseX>190 &&mouseX<345){
     image(bb,0,0,700,700);
   }else 
  
if ( mouseY>480 && mouseY<700 && mouseX>0 &&mouseX<190){
    image(cb,0,0,700,700);
    }else 
    
if ( mouseY>300 && mouseY<480 && mouseX>0 &&mouseX<200){
     image(db,0,0,700,700);
   }else 
  
if ( mouseY>0 && mouseY<300 && mouseX>0 &&mouseX<200){
     image(eb,0,0,700,700);
   }else 
   
if ( mouseY>0 && mouseY<175 && mouseX>165 &&mouseX<340){
     image(fb,0,0,700,700);
 }else 
 
 if ( mouseY>0 && mouseY<175 && mouseX>165 &&mouseX<340){
     image(gb,0,0,700,700);
 }else 
   
 if ( mouseY>0 && mouseY<200 && mouseX>340  &&mouseX<700){
     image(hb,0,0,700,700);
 }else 
 
  
 if ( mouseY>200 && mouseY<500 && mouseX>500 &&mouseX<700){
     image(ib,0,0,700,700);
 }else 
 
  
 if ( mouseY>350 && mouseY<700 && mouseX>300 &&mouseX<700){
     image(jb,0,0,700,700);
}else 
 
if(mouseY>0 && mouseY<700 && mouseX>0 && mouseX<700){
image(sleep,0,0,700,700);

   }else {background(255,255,255);
   }
   {
   
  
  if ( mouseY>200 && mouseY<450 && mouseX>200 &&mouseX<450){
     image(squirrel,190,280,200,200);
  }else {image(squirrel,mouseX, mouseY, 100,100);
  }
//noFill();
//strokeWeight(30);
 //    ellipse(350,350, 600, 600);
  
   }
}

