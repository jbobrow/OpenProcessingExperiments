
PImage lav, circ, stripes; //three images used

int y; //define y variable as integer
float rot = 0; //define variable for rotation

boolean loop=true;

void setup() {
  size(1000, 1000); //canvas size
  stroke(175,100,100); // bezier curve color
  noFill();
  
  lav = loadImage("background.png"); //purple/green stalks in background
  circ = loadImage("Ribbon circle.png"); //purple striped ribbon circle
  stripes = loadImage("ribbon comp4.png"); //brown vertical pattern
   
}

int counter = 0; //define counter as integer to begin at 0

void draw() {
  
  
  background(255,255,150); //yellow background
  float w1= stripes.width; //define vertical patterns width and height
  float h1= stripes.height;
  
  float x1= random(0,width); //randomize placement on x axis
    
  image(stripes, x1,0,w1/2,h1/2);
  
  float w2= stripes.width; //second set of vertical patterns
  float h2= stripes.height;
  
  float x2= random(0,width);
    
  image(stripes, x2,0,w1/2,h1/2);
    
  image(lav, 0,0); //background purple and green stalks
  
  pushMatrix(); //allows coordinates to be rotate only for certain elements
  
  translate(height/2,width/2); //center of where brown bezier lines spin around
  rotate(rot); //allow bezier lines to move in circle
  rot -=TWO_PI/2000; //speed of which bezier lines lines spin
  
  for (int i = 0; i < 500; i += 50) { //first bezier curve
    bezier(mouseX-1000/2-(i/2.0), mouseY-1000/2-(i/2.0), 410, 20, -440, 300, 0-(i/16.0), 300+(i/8.0));
    
   for (int k = 0; k < 500; k += 50) { //second bezier curve
    bezier(-mouseX+1000/2-(k/2.0), -mouseY+1000/2-(k/2.0), -410, -20, 440, -300, 0+(k/16.0), -300+(k/8.0));
   
  }
  }
  
  popMatrix(); //ends the rotations for certain elements
  
  image(circ, mouseX-250, mouseY-250); //purple circle that follows cursor
  
  counter++;
  println(counter);
   
}

void mouseDragged(){
  if(mouseX<width/3){
  tint(0,200,200,100); //dragging mouse on left side places blue tint
  }else if(mouseX>width/3 && mouseX<=width/3*2){
    tint(50,50,50,100); //dragging in middle places gray tint
  }else if (mouseX>width/3*2){
    tint(255,100,100,100); //dragging mouse on right side places red tint
  }
}

void mouseReleased(){
  noTint(); //returns to original colors without tints
}

void keyPressed (){
  if (key == 's' || key =='S')
  {
    save("image"+counter+".png"); //saves image as png
  }

if (key==' ')
  {
    loop=!loop;
    if (loop)loop();
    else noLoop();
  }
}

