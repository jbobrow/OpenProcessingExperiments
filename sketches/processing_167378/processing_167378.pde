
PImage img;
PFont f;

void setup(){
  
  size(720,405);
  f=createFont("mk2.ttf",25,true);
  img=loadImage("SABERWOLF.jpg");
  background(img);

}
void draw(){
  if(keyPressed) {
    if (keyPressed == true) 
  blendMode(SUBTRACT);
  fill(255,0);
  rect(0,0,720,405);
  }
  
  
  
  
   textFont(f,17);                
  fill(0,10); 
textAlign(CENTER);  
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,50);  
   text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,100); 
    text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,150); 
     text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,200); 
      text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,250); 
       text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,300); 
        text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,350); 
         text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,400); 
          text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,450); 
           text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,500); 
            text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,550); 
            
   textFont(f,100);
   fill(235,255,18,70);
   text("PRESS ANY KEY",width/2,325);
  


  if (mousePressed && (mouseButton == LEFT)) {
  textFont(f,17);                
textAlign(CENTER);  
    fill(255);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,250); 
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,350);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,450);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,550);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,150);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,50);
  textFont(f,45);
  fill(235,255,18,70);
  text("FATALITY",mouseX,mouseY);
  
   } else if (mousePressed && (mouseButton == RIGHT)) {
     textFont(f,17);                
textAlign(CENTER);  
    fill(255);
    text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,200); 
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,300);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,400);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,500);
  text("SaBeRwOlF IS GONNA EAT UR ASS",width/2,100);

  }  
  
  
}



