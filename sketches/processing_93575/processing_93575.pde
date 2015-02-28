
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

void setup()
{
  size(400,600);
  background(366);
  smooth();
  noFill();
  

  frameRate(15);
  
  }
  void draw()
  {
   if (mousePressed)
   {
   
 
    stroke(random(245), random(6), random(145), 80);
    
    //StrokeWeight au hasard de 1 à 55
    float strokeweight=random(200)
    strokeWeight(strokeweight);
    
    
    float diametre=random(59);
 ellipse(mouseX,mouseY,diametre,diametre);
}
}


