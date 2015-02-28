
//Valentina Pherson
//March 2, 2012
//Creative Computing
//Beautiful Composition with Arrays

void setup() {
size (350,600);
}

void draw() {
  background(0);
//long top line
for(int x=0; x<width; x+=10) {
  stroke(x,x,300);
 line(mouseX, mouseY,x, 0); 
}
//long bottom line
for(int y=0; y<width; y+=10) {
stroke(y,y,300);
 line(mouseX, mouseY,y, 600); 
}
//shorter bottom line 1
for(int x=0; x < width; x+=10) {
  stroke(x,x,300);
   line(mouseX, mouseY,x, 550); 
}
//shorter bottom line 2
for(int x=0; x < width; x+=10) {
  stroke(x,x,300);
   line(mouseX, mouseY,x, 500); 
  }
  //shorter bottom line 3
for(int x=0; x < width; x+=10) {
  stroke(x,x,300);
   line(mouseX, mouseY,x, 450); 
  }
  //shorter bottom line 4
for(int x=0; x < width; x+=10) {
  stroke(x,x,300);
   line(mouseX, mouseY,x, 400); 
  }
  //shorter bottom line 5
for(int x=0; x < width; x+=10) {
  stroke(x,x,300);
   line(mouseX, mouseY,x, 350); 
  }
  
  
   //shorter top line 1
  for(int y=0; y < width; y+=10) {
  stroke(y,y,300);
   line(mouseX, mouseY,y,50); 
  }
  //shorter top line 2
  for(int y=0; y < width; y+=10) {
  stroke(y,y,300);
   line(mouseX, mouseY,y, 100); 
}
 //shorter top line 3
  for(int y=0; y < width; y+=10) {
  stroke(y,y,300);
   line(mouseX, mouseY,y,150); 
  }
   //shorter top line 4
  for(int y=0; y < width; y+=10) {
  stroke(y,y,300);
   line(mouseX, mouseY,y,200); 
  }
   //shorter top line 5
  for(int y=0; y < width; y+=10) {
  stroke(y,y,300);
   line(mouseX, mouseY,y,250); 
  }
//left side line
 for(int y=0; y < height; y+=30) {
  stroke (random(255),random(255),random(255),random(255));
   line(mouseX, mouseY,0, y); 
}
//right side line
 for(int y=0; y < height; y+=30) {
  stroke (random(255),random(255),random(255),random(255));
   line(mouseX, mouseY,350, y); 
}
}
