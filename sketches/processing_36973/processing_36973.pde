
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(105),10,25,90);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 10, 5);
  }
  else {
    ellipse(width/9, height/9, 80*sin(counter), 80*sin(counter));
  }
}

                
                
