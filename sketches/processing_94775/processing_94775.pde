

void setup ()                   
{
  size(400,400);
  background(255,100,100);
}

void draw()
{
} 

void mousePressed()
{   
   if(mousePressed && (mouseButton == RIGHT))
   {
    background(255,100,100);
   }else{
    fill(200*noise(frameCount*0,5),255*noise(frameCount*0,2),200*noise(frameCount*0,6),30);
  beginShape();                  
   curveVertex(1,height);
   curveVertex(2,height);
   float vx=mouseX;
  float vy=mouseY;
 curveVertex(vx,vy);
 
   float dx=mouseX;
   float dy=mouseY;
 curveVertex(dx,dy);
 
 curveVertex(width-2,height);
 curveVertex(width,height);
 


 
 
 endShape();                    
 
   pushMatrix();
     translate(mouseX,mouseY);
     fill(0);
   beginShape();
    
     vertex(-15,-7);
     vertex(15,7);
      vertex(15,-7);
     vertex(-15,7);
     endShape();
   popMatrix();
                    
}
}




