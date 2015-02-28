
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
void setup(){
  size(200,200);
  fill(0,0,0,255); // remplissage de la forme
  noStroke();
  smooth();
}
  
void draw(){
  ellipse(mouseX,mouseY,9,9); // déplacement de la forme avec la souris
}

                
                
