
void setup(){
  size (640,480);
}
  
void draw (){
  background (234,171,118);
  smooth();
  
  //WHITES
    PShape w;
    w=loadShape ("whites.svg");
    shape(w,0,-22,640,480);
   
  //LEFT EYE
    float Lx=map(mouseX, 0,640, 150,220);
    float y=map(mouseY, 0,480, 210,260);
    float Rx=map(mouseX, 0,640, 420,490); 
    if (mousePressed){
      fill(0);
      rect (0,0,640,480);
    
    }
    else{
    
      fill (61,33,0);
      ellipse (Lx,y, 42,42);
      noStroke();
      fill(234,90,0,20);
      ellipse (Lx,y,36,36);
      fill (200,90,0,40);
      ellipse (Lx,y,38,38);
      fill (0);
      ellipse (Lx,y,26,26);
      fill (255,255,255,30);
      
    float sx=map(mouseX,0,640,155,220);
      ellipse (sx-8,y-8,14,10);
   
    

   //RIGHT EYE   
    
          
      fill (61,33,0);
      ellipse (Rx,y, 42,42);
      noStroke();
      fill(234,90,0,20);
      ellipse (Rx,y,36,36);
      fill (200,90,0,40);
      ellipse (Rx,y,38,38);
      fill (0);
      ellipse (Rx,y,26,26);
      
    float tx=map(mouseX,0,640,420,490);
      fill (255,255,255,30);
      ellipse (tx-8,y-8,14,10);
    }
  //SKIN_MASK
    PShape s;
    s=loadShape ("skin.svg");
    shape (s,0,0,645,480);
    PShape s2;
    s2=loadShape ("skin2.svg");
    shape (s2,0,0,645,480);
    
    //blush
   
    if (mouseY>350){
    PShape b;
    b=loadShape ("blush1.svg");
    smooth();
    shape (b,0,00,640,480);
    }
    
    
  //MAKEUP
    PShape t;
    t=loadShape("try copy.svg");
    shape (t,-5,-20,640,480);
    
  //roll eyes
    
        
      
  
  
}



