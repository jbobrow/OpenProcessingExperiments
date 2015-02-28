

//Crazy Faces
//load,save images, mouse and keyboard interaction

PImage img; //this is the code line to link the imported image into the sketch, img is just a generic name which can be changed
color c;// creating a common reused term 'c' for color

void setup() {//drawing setup
  size(640,320);//sketch size
  background(255);//background color set to white
  smooth();//applying anti-aliasing to all edges of drawing - smoothing
  img = loadImage("cow.jpg");//loading the image for use in the sketch
  
}

void draw() {
  //background(255);
  face(mouseX,mouseY+65);//according to where the mouse is pressed the face will be created at those co-ords, +65 to Y was required to center object due to the it being created -65 off screen origianlly
  int xp = int(random(width)); //this int = xp, details where the xpos will locate its pixel for color
  int yp = int(random(height));//this int = xy, details where the ypos will locate its pixel for color
  color c = img.get(xp,yp);// (get) locates information dervide by bracketed fields
  fill(c,180); // fill with color c as listed one above in the heirachy with 180 transparency
  if (keyPressed){
   if((key == 'L')||(key == 'l')){
   loop();
   }else{
   noLoop();
   
   }
  }
}

void face(float x, float y) { //int x and int y will be defined in the void draw information
  
  pushMatrix(); //recreation of a complete object at different locations (XY)
  noLoop();//the object will not continuosly recreate itself every frame
  translate(x,y);//referencing where it will be created from pre defined infor, in this case referring to the void draw field's face(mouseX,mouseY+65) command
  ellipse(0, -65, 77, 77);//face
  color(c);
  noStroke();//new noStroke determines everything created below will have noStroke unless re introduced
  fill(255);//fill in with white
  ellipse(-17.5, -70, 35,35);//left eye
  ellipse(17.5, -70, 35,35);//right eye
  fill(0,200);//fill pupils with black with slight transparency
  ellipse(random(-30,-5),random(-82.5,-57.5), 5,7);//left pupil
  ellipse(random(5,30),random(-82.5,-57.5), 5,7);//right pupil
  fill(255);//filling the mouth in as white
  ellipse(random(-10,10),random(-37,-27), random(10,20),5);//mouth
  popMatrix();//closing the matrix
}


void mousePressed() {//the following will be actioned when mousePressed
  redraw();//redraws
 
}

void keyPressed() {//the following will be actioned when correspoding key is it
  if((key == 'c') || (key == 'C')) {//linking to key 'c'
    fill(255);//fill area white
    rect(0,0, width,height);//creating a rectangle the size of the sketch and filling in white as if to clear the screen
  }
   if((key == 's') || (key == 'S')) {//linking to key 's'
    save("faces.jpg");//saves created image as faces.jpg
    
  } 
  
}



