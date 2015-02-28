
void setup(){
  size(600,600);
  smooth();
  noStroke();
}
void draw()
{
  background(255);
  rectMode(CENTER);
  
  
    if(mouseX<110){
    fill(#FF6600,150);
     ellipse(width/3+40, height/2, 260,260);
      rect(2*width/3-30, height/2,260,260);
    
  }
  
  if(mouseX>110 && mouseX<240){
    fill(#FF6600,150);
     ellipse(width/3+40, height/2, 260,260);
     fill(#00FFFD,170);
      rect(2*width/3-30, height/2,260,260);
  }
  
 
   if(mouseX>240 && mouseX<370){
      fill(180);
           ellipse(width/3+40, height/2, 260,260);
            rect(2*width/3-30, height/2,260,260);    
  }

  if(mouseX>370 && mouseX<500){
       fill(#007DFF,170);
           ellipse(width/3+40, height/2, 260,260);
            fill(#FF1AE5,170);
            rect(2*width/3-30, height/2,260,260);    
  }
  
    if(mouseX>500){
      fill(#FF1AE5,170);
           ellipse(width/3+40, height/2, 260,260);
            
            rect(2*width/3-30, height/2,260,260);    
  }
   
}


