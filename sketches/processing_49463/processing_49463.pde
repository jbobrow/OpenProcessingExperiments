
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  stroke(128);
   if (keyPressed == true) {
   background(255);
   }
  fill(random(255),100,255,128);
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
    text("hello world",random(250),random(250) );
  }
  else {
  text("hello world",15,60 );
 //   ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                
