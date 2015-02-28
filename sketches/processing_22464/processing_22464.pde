

PImage muybridge1;
PImage muybridge2;
PImage muybridge3;
PImage muybridge4;
PImage muybridge5;
PImage muybridge6;
PImage muybridge7;
PImage muybridge8;
PImage muybridge9;
PImage muybridge10;
PImage muybridge11;
PImage muybridge12;
PImage muybridge13;
PImage muybridge14;
PImage muybridge15;
PImage muybridge16;

void setup() {
  size(600,600);
  muybridge1= loadImage("Muybridge1.png");
  muybridge2= loadImage("Muybridge2.png");
  muybridge3  = loadImage ("Muybridge3.png");
  muybridge4 = loadImage("Muybridge4.png");
  muybridge5 = loadImage ("Muybridge5.png");
  muybridge6 = loadImage("Muybridge6.png");
  muybridge7 =loadImage ("Muybridge7.png");
  muybridge8 = loadImage ("Muybridge8.png");
  muybridge9 = loadImage("Muybridge9.png");
  muybridge10 =loadImage ("Muybridge10.png");
  muybridge11 = loadImage("Muybridge11.png");
  muybridge12 = loadImage("Muybridge12.png");
  muybridge13 =loadImage("Muybridge13.png");
  muybridge14 =loadImage("Muybridge14.png");
  muybridge15 =loadImage("Muybridge15.png");
  muybridge16 =loadImage("Muybridge16.png");

 

  noLoop();
   
}
 
 
void draw () {
  
  

  
  
  float w= random(0,16);
  if (w<2){
    background(252,3,90);
    image (muybridge1, 30,30);
   
   } else if (w<4){
    background(12,245,142);
     image (muybridge2,30,30);

   
       
  } else if (w<6){ 
    background(255,235,5);
   image(muybridge4,30,30);
  
      
   } else if (w<8){
  background(29,5,255);
  image (muybridge5, 30,30);
  
    
  } else if (w<10){
  background(50,255,5);
  image (muybridge6,30,30);

  }else if (w<12){
   background(125,14,237);
   image(muybridge7,30,30);
 
      
  }else if(w<13){
    background(175,11,24);
    image(muybridge8, 30, 30);
   
  }else if(w<14){
  background(252,104,3);
  image (muybridge9, 30,30);
  
         
  }else if(w<15){
    background(64,252,3);
    image(muybridge10,30,30);
   
   } else if (w<16){ 
    background(255,235,5);
   image(muybridge11,30,30);
  
      
  } else if (w<18){
  background(29,5,255);
  image (muybridge12, 30,30);
  
    
  } else if (w<20){
  background(50,255,5);
  image (muybridge13,30,30);

  }else if (w<22){
   background(125,14,237);
   image(muybridge14,30,30);
 
      
  }else if(w<24){
    background(175,11,24);
    image(muybridge15, 30, 30);
   
  }else if(w<26){
  background(252,104,3);
  image (muybridge16, 30,30);
        

   
        
        
  }
  }
 
void mousePressed(){
  redraw();
}

