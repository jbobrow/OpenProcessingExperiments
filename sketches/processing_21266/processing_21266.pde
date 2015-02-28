
//define variables
PImage dance;
PImage passion;
PImage scared1;
PImage eye;
PImage skeleton;
PImage chin;
PImage lefteye;
PImage leftface;
PImage lips;
PImage lips2;
PImage nose2;
PImage righteye;
PImage rightface;
PImage righteyebrow;
PImage rightface2;
PImage rightneck;
PImage forehead;
PImage background2;
PImage skeleton2;



void setup() {
  size(800,598);
  eye= loadImage("eye.png");
  skeleton = loadImage("skeleton.png");
  chin = loadImage ("chin.png");
  lefteye = loadImage("lefteye.png");
  leftface = loadImage ("leftface.png");
  lips = loadImage("lips.png");
  lips2=loadImage ("lips2.png");
  nose2 = loadImage ("nose2.png");
  righteye = loadImage("righteye.png");
  rightface=loadImage ("rightface.png");
  righteyebrow = loadImage("righteyebrow.png");
  scared1= loadImage("scared1.png");
  rightface2=loadImage("rightface2.png");
  rightneck=loadImage("rightneck.png");
  forehead=loadImage("forehead.png");
  dance =loadImage("dance.jpg");
  passion=loadImage("passion.jpg");
  background2=loadImage("background2.png");
  skeleton2=loadImage("skeleton2.png");
  noLoop();
  
}


void draw () {
  float w=random(0,20);
  if (w<2){
    background(dance);
    image (skeleton, 120,30);
  
  } else if (w<4){
    background(passion);
     image (eye,0,0);
     image(background2,0,50);
     image(scared1,180,140);
      
  } else if (w<6){  
    background(dance);
   image(skeleton,120,30);
   image (lefteye,320,110);
   image(righteye,420,160);
   image(lips,370,310);
   image(righteyebrow,400,120); 
     
  } else if (w<8){
  background(dance);
  image (skeleton, 120,30);
  image(forehead,295,30);
  image (leftface,220,170);
  image (lefteye,320,110);
  image (nose2,360,150);
  image (chin,330,190);
  image(righteye,420,160);
  image(rightface,330,290);
  image(rightneck,410,380);
  image(rightface2,500,160);
  image(lips,370,310);
  image(lips2,360,320);
  image(righteyebrow,400,120);
   
  } else if (w<10){
  background(passion);
  image (eye,0,0);
  image(scared1,180,140);
  
  }else if (w<12){
   background(dance);
   image(skeleton,120,30);
   image(forehead,295,30);
   image (lefteye,320,110);
   image (nose2,360,150);
   image(righteye,420,160);
   image(rightface,330,290);
   image(lips2,360,320);
     
  }else if(w<14){
    background(dance);
    image(skeleton,120,30);
    image(forehead,295,30);
    image (chin,330,190);
    image(righteye,420,160);
    image(righteyebrow,400,120); 
  
  }else if(w<16){
  background(dance);
  image (skeleton, 120,30);
  image(forehead,295,30);
  image (leftface,220,170);
  image (lefteye,320,110);
  image (nose2,360,150);
  image (chin,330,190);
  image(righteye,420,160);
  image(rightface,330,290);
  image(rightneck,410,380);
  image(rightface2,500,160);
  image(lips,370,310);
        
  }else if(w<18){
    background(dance);
    image(scared1,180,140);
    image (skeleton, 120,30);
    image(rightface,330,290);
    image (lefteye,320,110);
    image(righteye,420,160);
       
  }
  }

void mousePressed(){
  redraw();
}




