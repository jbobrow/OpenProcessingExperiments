
color red = color(255,0,0); 
color blue = color(0,0,255); 
color green = color(0,255,0); 
color yellow = color(246,255,15); 

void setup(){ 
size(500,500); 
background(255,255,255); 
} 

  void draw(){ 
  
  fill(red); 
  rect(0, 375, 125, 125 ); 
  fill(blue); 
  rect(125, 375, 125, 125 ); 
  fill(green); 
  rect(250, 375, 125, 125);  
  fill(yellow); 
  rect(375, 375, 125, 125); 
  
if(mousePressed) { 
    if(mouseX >=0 && mouseX <= 125){ 
      if(mouseY>=375&&mouseY;<=500){
        stroke(red); 
      } 
    }
      if(mouseX >=125 && mouseX <= 250){ 
         if(mouseY>=375&&mouseY;<=500){
        stroke(blue);
      }
      } 
      if(mouseX >=250 && mouseX <= 375){ 
         if(mouseY>=375&&mouseY;<=500){
        stroke(green); 
         }
      } 
      if(mouseX>=375 && mouseX<=500){ 
        if(mouseY>=375&&mouseY;<=500){
        stroke(yellow); 
        }
      } 
 } 
 if(mousePressed) { 
     if(mouseX >=0 && mouseX <= 125){ 
      if(mouseY>=375&&mouseY;<=500){ 
        stroke(red); 
      }
 } 
   
   if(mouseX >=125 && mouseX <= 250){ 
         if(mouseY>=375&&mouseY;<=500){
        stroke(blue);
      }
   }
    if(mouseX >=250 && mouseX <= 375){ 
         if(mouseY>=375&&mouseY;<=500){
        stroke(green); 
         }
      } 
       if(mouseX>=375 && mouseX<=500){ 
        if(mouseY>=375&&mouseY;<=500){
        stroke(yellow); 
        }
      } 
} 
if (mousePressed){ 
  line(pmouseX,pmouseY,mouseX,mouseY); 
} 
}
