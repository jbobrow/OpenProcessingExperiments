


//size of the ellipse at the end of the line


boolean isDrawing = false;


void setup() {
  size(500,500);
  background(0);
  smooth();
  
  
};

void draw()  {
  
 if (isDrawing) {
 
  stroke(255,255,255,80);
  line(pmouseX, pmouseY, mouseX, mouseY);
 line(210,210,mouseX,mouseY);
  stroke(0,0,0,25);
  ellipse(255,255,mouseX,mouseY);
  fill(255,255,255,50);
  line(240,240,mouseX,mouseY);

  

 }
};

void mousePressed(){
  isDrawing=!isDrawing;
  
};

void keyPressed() {
  save("circle" + key + ".png");//press any key and it will save it in your folder
  
};

