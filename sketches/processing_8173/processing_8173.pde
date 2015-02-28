

float curvespacing;

void setup() {
  size(600,600,P3D);//set the size of the image and 3d mode
  noFill();
  
}

void draw() {
  background(0);//fill the background with black
  
  for(int i=0;i<100;i++){//a for loop used to draw 100 curves
    curvespacing=random(40,70);//curvespacing to be randomly chosen between 40 and 70
    stroke(mouseX,255-i,200);//set a stroke color according to the mouseX position
    curve(100,300+i*curvespacing, 100,300, 500,300,  400,300-i*curvespacing);//draw a half curve 
    stroke(mouseY,255,200+i);//set a stroke color according to the mouseY position
    curve(100,300-i*curvespacing, 100,300, 500,300,  400,300+i*curvespacing);//draw another curve to make it look like a butterfly
  }
  
  stroke(255);//set the stroke color of the sphere to white.
  noFill();
  lights();//set a default light
  translate(300,300,0);//move the sphere to the center of the canvas
  rotateY(mouseX*0.01);//rotate the sphere based on mouse movement
  rotateX(mouseY*0.01);
  sphere(50);//draw the sphere
  
}

void keyPressed(){
  
  
  if (key == 's'){//if the last key pressed was s
    save("butterfly" + millis() + ".jpg");//save as a jpg file
  }
    
  
 
}


