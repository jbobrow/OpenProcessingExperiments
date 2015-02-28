
int x = 750 / 2;
int y = 175;
 
void setup() {  //setup function called initially, only once
  size(750, 250);
  background(255);  //set background white
  smooth();
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}
 
void keyPressed() {
 //println("Pressed");
 if(key == CODED){
  if(keyCode == LEFT) {
  //println("Pressed left");
  x--;
  x--;
  }else if(keyCode == RIGHT){
  x++;
  x++;
  }
}}
 
 
void draw() {  //draw function loops
  background(255);
  x = constrain(x,0,750);
  y = constrain(y,0,250);
  ellipse(x,y,50,50);
  fill(0,128,0);
  rect(0,200,750,50);
  fill(200);
}

                
                
