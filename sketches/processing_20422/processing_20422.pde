

PFont font;
//PImage a;


void setup() {
  
  size(400,400);
  font = loadFont("Times-Roman-48.vlw");
  textSize(900);
  smooth();
noLoop();
  }


void draw() {
background(204);


//fill(0);
//texture(loadImage("pattern.jpg"));
text(',', 65, 190);
 

 noStroke();
for(int i=0; i<height; i+=10) {
  fill(204);
  rect(0, i, width, 1);
  fill(204);
  rect(i, 0, 1, height);
}

//noStroke();
//PImage a = loadImage("pattern.jpg");
//beginShape();
//texture (a);
//vertex(152, 80);
//vertex(260, 80);
//vertex(260, 330);
//vertex(152, 330);
//vertex(152, 297);
//vertex(194, 297);
//vertex(194, 189);
//vertex(152, 189);
//vertex(152, 80);
//endShape(CLOSE);



 save("comma.tif");
}
  

  







  




