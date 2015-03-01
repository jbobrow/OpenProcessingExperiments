
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(153,204,204);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {triangle(30, 75, 58, 20, 86, 75);triangle(40,85,68,30,96,85);
triangle(10,55,38,0,56,45);triangle(20,65,48,10,76,65);triangle(5,50,17,22,38,11);triangle(15,60,27,48,21,44,48,22);triangle(22,45,67,19,2,71);triangle(87,91,24,33,77,60);  //draw function loops 
  counter++;
  noStroke();
  
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
