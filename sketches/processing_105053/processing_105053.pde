
color red = color(255,0,0);
  color blue = color(0,0,255);
  color green = color(0,255,0);
  color yellow = color(246,255,15);
  color purple = color(202,15,255);
  color pink = color(255,173,250);
  color orange = color(255,131,28);
  color aqua = color(3,232,255);
  color black = color(0);
  color white = color(255,255,255);



  void setup(){
  size(500,500);
  background(255,255,255);
}

  void draw(){
  strokeWeight(4);
  
 
  fill(red );
  rect(10, 400, 25, 25 );
  
  fill(blue );
  rect(10, 375, 25, 25 );
  
  fill(green);
  rect(10, 350, 25, 25);
  
  fill(purple);
  rect(10, 325, 25, 25);
  
  fill(yellow);
  rect(10, 300, 25, 25);
  
  fill(pink);
  rect(35,400,25,25);
  
  fill(orange);
  rect(35,375,25,25);
  
  fill(aqua);
  rect(35,350,25,25);
  
  fill(black);
  rect(35,325,25,25);
  
  fill(white);
  rect(35,300,25,25);
  

if(mousePressed) {
    if(mouseX > 10 && mouseX < 35){
      if(mouseY >400 && mouseY < 425){
        stroke(red);
      }
    
      if(mouseY >375 && mouseY < 400){
        
        stroke(blue);
      }
      
      if(mouseY >350 && mouseY < 375){
        stroke(green);
      }
      if(mouseY>325 && mouseY<350){
        stroke(purple);
      }
      if(mouseY>300 && mouseY<325){
        stroke(yellow);
      }
      if(mouseY>135 && mouseY<160){
        stroke(yellow);
 }
 }
 }
 
 if(mousePressed) {
    if(mouseX > 35 && mouseX < 60){
      if(mouseY >400 && mouseY < 425){
        stroke(pink);
 }
   if(mouseY >375 && mouseY < 400){
        stroke(orange);
   }
     if(mouseY >350 && mouseY < 375){
        stroke(aqua);
      }
        if(mouseY >325 && mouseY < 350){
        stroke(black);
      }
        if(mouseY >300 && mouseY < 325){
        stroke(white);
}
}
}
if (mousePressed){
  line(pmouseX,pmouseY,mouseX,mouseY);
}
}
