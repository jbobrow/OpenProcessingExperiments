
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
void setup () {
   size (600,400);
}

void draw() {
   background (250,160,5);
   //if the eyes
   if (mousePressed) {
   fill(125);
   }   else { 
   fill (255);
   }
   ellipse (mouseX,200,200,200);
      //if the eyes
        if (mousePressed) {
   fill(255);
   }   else { 
   fill (255);
   }
   ellipse (300,200,50,50);
   
   stroke (255);
   fill (60);
   ellipse (200,200,50,50);
   line (80,90, 500,500);
   rect(300,300, 55,90);
}


