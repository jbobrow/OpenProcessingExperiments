
int counter;
 
void setup() {  //setup function called initially, only once
  size(700, 300);
  background(255);  
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  smooth();
}
 
void draw() {  //draw function loops
  counter++;
  noStroke();
  fill(random(25),300
  ,255,300
  );
   
  if(mousePressed == true) { //add some interaction
    triangle(mouseX, mouseY,330, 300, 370,300);
  }
  else {
    ellipse(width/2, height, 80*sin(counter), 80*sin(counter));
  }
}
                
                
