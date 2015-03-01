
int counter;
float alpha;
float angle;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  alpha = 100;
  angle = radians(30);
  
  
}

void draw() {  //draw function loops 
  counter++;
  angle--;
  fill(random(255),random(255),random(255),random(50));
  translate(250, 250);
  rotate(angle);
    rect(0, 0, 80* (atan(counter)), 80 * atan(counter));

  
  if(mousePressed == true) { //add some interaction
 fill(random(255),random(255),random(255),alpha)
     ellipse(mouseX, mouseY, 20, 20);
     alpha--;
     if(alpha<=0){
     alpha = 100;
     }
  }
}
