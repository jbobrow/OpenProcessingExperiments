
void setup () {
  size(800,800);
  background(0,0,0);
  smooth();
  
}

void draw () {
noStroke ();
 fill (map(mouseX,0,height,0,255),0, map(mouseY,0,width,0,400));
 ellipse (width/3,height/2,300,300); 
 
  fill (map(mouseX,0,height,0,50),0, map(mouseY,0,width,0,300));
 ellipse (100,250,100,100); 
 
   fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,250));
 ellipse (500,130,200,200); 
 
   fill (map(mouseX,0,height,0,500),0, map(mouseY,0,width,0,100));
 ellipse (700,500,150,150); 
 
  fill (map(mouseX,10,height,0,680),0, map(mouseY,0,width,0,500));
 ellipse (750,260,180,180); 
 
  fill (map(mouseX,0,height,0,50),0, map(mouseY,0,width,0,300));
 ellipse (250,40,180,180); 
 
 fill (map(mouseX,0,height,0,50),0, map(mouseY,0,width,0,250));
 ellipse (780,40,180,180); 
  
   fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,160));
 ellipse (50,600,200,200); 
 
    fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,130));
 ellipse (680,750,300,300); 
 
    fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,40));
 ellipse (300,700,220,220); 
 
    fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,40));
 ellipse (25,80,200,200); 

   fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,80));
 ellipse (100,780,100,100); 
 
    fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,80));
 ellipse (520,530,150,150); 

 fill (map(mouseX,0,height,0,120),0, map(mouseY,0,width,0,200));
 ellipse (520,320,70,70); 

}
                
                                
