
// Francisco Hola
// 1/7/2014
// Project: Traffic Light

void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
  fill(0,0,0); //Black
  rect(87,20,70,155);
 
  fill(255,0,0); //red
  ellipse(125,50,50,50);
    
    fill(324,453,89); //yellow
  ellipse(125,100,50,50);
   
   fill(0,255,0); //green
  ellipse(125,150,50,50);
}
