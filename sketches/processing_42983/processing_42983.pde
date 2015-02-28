
void setup(){
size (300, 300);
background(0);
smooth();
noStroke();
frameRate(30);
}


void draw(){
  
float posx;
float posy;
float sizer;

  for (int i=0; i<20; i++)
    {
      for (int j=0; j<20; j++)
      {
        posx=i*20;
        posy=j*20;  
        
        
        sizer=dist(posx, posy, mouseX, mouseY)/20;
        
         map (sizer, 0, 100, 0.1, 7); 
        pushMatrix();
        
         
        translate(posx, posy);
        rectMode(CENTER);
        rotate(PI/4);
        
        
        rect(0,0,sizer,sizer);
        popMatrix();
        
      }
    }
}
