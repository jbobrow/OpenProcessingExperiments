
void setup(){
  size(300,300);
  background(mouseY-mouseY,0,mouseX-mouseY,980);
  colorMode(HSB,757);
}

int x=mouseX;

void draw(){
  fill(x,2*width,2*x,height);
  noStroke();
  
rectMode(CORNERS);
  rect(x,0,0,height);
  x++;
  
fill(mouseX,mouseY,800,90);
noStroke();

  ellipse(mouseX,mouseX,34,34);
  x++;
  
fill(mouseX,mouseY,700,50);
 ellipse(mouseY,mouseY,100,100); 
 x++;
 
  ellipse(mouseX/2,mouseY/2,200,200);
x++;

  ellipse(mouseX/4,mouseY/4,50,50);
x++;
  ellipse(mouseX/2,mouseY/2,200,200);
x++;
 ellipse(mouseX,mouseY,200,200);
x++;
}

void mouseDragged(){
  
  fill(x,178,x,867);
 
  ellipse(3*mouseX,mouseY,2*mouseX,15);
  
  x++;
}
void mousePressed(){

  background(135,255,899,456);
  fill(mouseX-mouseY,mouseY/4,2*height,mouseY-mouseX);
  x++;
  
  background(555,55,59,45);
  fill(mouseX,mouseY/4,2*height,mouseY);
  x++;
  
}



