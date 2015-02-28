
boolean color1, color2, color3, color4, color5, color6, color7, color8, color9, color10;
boolean do5, do10, do4, do9;
float r;
 
//------------------------------------
void setup(){
  smooth();
  // size is fixed
  size(200, 140);
  color1 = color2 = color3 = color4 = color5 = true;
  color6 = color7 = color8 = color9 = color10 = false;
  do5 = do10 = do4 = do9 = true;
  // changes the radius of the buttons
  r = 13.0;
}
 
//------------------------------------
void mousePressed(){
  if(sqrt((40 - mouseX)*(40 - mouseX)+(33 - mouseY)*(33 - mouseY)) <= r) color1 = !color1;
  else if(sqrt((70 - mouseX)*(70 - mouseX)+(33 - mouseY)*(33 - mouseY)) <= r) color2 = !color2;
  else if((sqrt((130 - mouseX)*(130 - mouseX)+(33 - mouseY)*(33 - mouseY)) <= r) && do4){
    color4 = !color4; 
    do4 = false;
  }

  else if(sqrt((40 - mouseX)*(40 - mouseX)+(66 - mouseY)*(66 - mouseY)) <= r) color6 = !color6;
  else if(sqrt((70 - mouseX)*(70 - mouseX)+(66 - mouseY)*(66 - mouseY)) <= r) color7 = !color7;
  else if((sqrt((130 - mouseX)*(130 - mouseX)+(66 - mouseY)*(66 - mouseY)) <= r) && do9){
    color9 = !color9;
    do9 = false;
  }
}
 
void mouseReleased(){
  if(sqrt((mouseX - 40)*(mouseX- 40)+(mouseY - 33)*(mouseY - 33)) <= r) color1 = !color1;
  else if(sqrt((mouseX - 100)*(mouseX- 100)+(mouseY - 33)*(mouseY - 33)) <= r) color3 = !color3;
  else if((sqrt((mouseX - 160)*(mouseX- 160)+(mouseY - 33)*(mouseY - 33)) <= r) && do5){
    color5 = !color5; 
    do5 = false;
  }

  else if(sqrt((mouseX - 40)*(mouseX- 40)+(mouseY - 66)*(mouseY - 66)) <= r) color6 = !color6;
  else if(sqrt((mouseX - 100)*(mouseX- 100)+(mouseY - 66)*(mouseY - 66)) <= r) color8 = !color8;
  else if((sqrt((mouseX - 160)*(mouseX- 160)+(mouseY - 66)*(mouseY - 66)) <= r) && do10){
    color10 = !color10;
    do10 = false;
  }
}
 
//------------------------------------
void draw(){
  background(127);
  color white = color(255, 255, 255);
  color black = color(0,0,0);
  
  fill((color1) ? white : black);
  ellipse(40, 33, 2*r, 2*r);
  fill((color2) ? white : black);
  ellipse(70, 33, 2*r, 2*r);
  fill((color3) ? white : black);
  ellipse(100, 33, 2*r, 2*r);
  fill((color4) ? white : black);
  ellipse(130, 33, 2*r, 2*r);
  fill((color5) ? white : black);
  ellipse(160, 33, 2*r, 2*r);
  fill((color6) ? white : black);
  ellipse(40, 66, 2*r, 2*r);
  fill((color7) ? white : black);
  ellipse(70, 66, 2*r, 2*r);
  fill((color8) ? white : black);
  ellipse(100, 66, 2*r, 2*r);
  fill((color9) ? white : black);
  ellipse(130, 66, 2*r, 2*r);
  fill((color10) ? white : black);
  ellipse(160, 66, 2*r, 2*r);
  
}    
                
