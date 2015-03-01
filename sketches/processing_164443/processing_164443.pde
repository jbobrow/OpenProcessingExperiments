
void setup() {
size(500, 500);
noStroke();
}
void draw() {
  background(0);
  float normX = mouseX/float(width);
  float normY = mouseY/float(height);
  float triX = mouseX/2;
  float triY = mouseY/2;
  
  if (mousePressed == true) {
  background(225);
  triX = triY*2;
  normX = normY;
  stroke(100);
  strokeWeight(5);
  }
  
  if (((mouseX >= 100) && (mouseX <= 200)) && 
     ((mouseY >= 100) && (mouseY <= 200))) {
    fill(127,230,250,250);
  } else if (((mouseX >= 300) && (mouseX <= 400)) && 
     ((mouseY >= 100) && (mouseY <= 200))) {
    fill(255,133,133,250); 
  } else if (((mouseX >= 100) && (mouseX <= 200)) && 
     ((mouseY >= 300) && (mouseY <= 400))) {
    fill(170,255,150,250);
  } else if (((mouseX >= 300) && (mouseX <= 400)) && 
     ((mouseY >= 300) && (mouseY <= 400))) {
    fill(255,255,133,250);
  } else {
    fill(0);
  }

rect(100,100,100,100);
rect(300,100,100,100);
rect(100,300,100,100);
rect(300,300,100,100);

fill(127,230,250,100);
ellipse(width-(pow(normX,2)*width),height-(pow(normY,2)*height),width-mouseX,width-mouseX);
fill(255,133,133,100);
ellipse(pow(normX,2)*width,pow(normY,2)*height,width-mouseX,width-mouseX);
fill(170,255,150,100);
ellipse(pow(normX,2)*width,pow(normY,2)*height,height-mouseY,height-mouseY);
fill(255,255,133,100);
ellipse(width-(pow(normX,2)*width),height-(pow(normY,2)*height),height-mouseY,height-mouseY);

fill(0,100);
noStroke();
beginShape(TRIANGLE_STRIP); 
//vertex(triX,triY);
//vertex(triY,triX);
vertex(250,250);
vertex(100,400);
vertex(400,400);
endShape(CLOSE);

beginShape(QUAD_STRIP); 
vertex(mouseX,mouseY);
vertex(mouseY,mouseX);
//vertex(triX,triY);
//vertex(triY,triX);
vertex(200,200);
vertex(300,200);
vertex(300,300);
vertex(200,300);
vertex(100,100);
vertex(100,400);
vertex(400,100);
vertex(400,400);
vertex(250,250);
endShape(CLOSE);


}



