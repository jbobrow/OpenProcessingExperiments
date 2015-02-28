
PImage kitty;

void setup(){
  size(700,700);
  background ( 123,20,40);
  kitty = loadImage("kitty.jpg");
  image (kitty, 0, 0);
 
  smooth();
  noStroke();

  tint(0,153,204,126);
}

void draw () {
  
  
  fill(188,11,11);
  ellipse(mouseX,mouseY,random(20),random(10));
  for(int i = 0; i < 700; i +=50){
    
    image (kitty, i, i);
    
    
 ellipse(mouseX,mouseY,random(20),random(10));
  }
 
 for (int x = 0; x <height; x+=20){
   fill (255,50,255);
   rect (x, x, 100, 100);
 } 
}


