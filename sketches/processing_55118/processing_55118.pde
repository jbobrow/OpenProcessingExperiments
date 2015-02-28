
void setup(){
  size(250,250);
  background(#000000);
  smooth();
  PFont font;
  font = loadFont ("Impact-40.vlw");
  textFont(font);
}
 
void draw(){
  fill(#B9E7FF,80);
  fill(#B9E7FF,40);
  fill(#B9E7FF,8);
  text("Paint", mouseX, mouseY);
   if (mousePressed == true){
    background(#000000);
   }  
}


