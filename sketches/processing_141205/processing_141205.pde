
/*
Konkuk University
SOS iDesign

Name: JEONG, eunyeah 
ID: treecom1995

*/
int value = 0;



void setup(){
size (600, 600);
background(#E6FF83);
// noLoop();
smooth();
}

void draw(){
  
  println(mouseX + " : " + mouseY);

  //hair
  stroke(0);
  fill(127,65,28);
  noStroke();
  triangle(77,260,5,501,191,506);
  triangle(491,256,384,504,561,502);
  
  //face
  fill(238,227,174);
  ellipse(285,314,423,423);
  
  //hair
  fill(127,65,28);
  noStroke();
  bezier(75,278,72,32,499,30,498,279);
  noStroke();
  
  fill(238,227,174);
  triangle(214,137,162,285,210,284);
  triangle(285,167,257,279,286,283);
  triangle(351,173,329,284,378,285);
  triangle(451,202,429,284,472,282);
  
  //eyebrow
  stroke(0);
  strokeWeight(3);
  bezier(104,299,113,267,208,267,220,303);
  bezier(336,304,345,268,440,268,447,303);
  
  //eyes
  fill(255);
  stroke(0);
  bezier(116,333,139,309,183,308,207,332);
  bezier(116,333,129,350,194,349,207,332);
  bezier(344,333,359,308,420,309,439,332);
  bezier(344,333,357,350,419,353,439,332);
  
  fill(0);
  ellipse(159,330,32,32);
  ellipse(390,331,32,32);
  
  //nose
  fill(238,227,174);
  stroke(0);
  bezier(252,402,260,376,303,376,313,402);
  
  fill(0);
  ellipse(269,400,6,6);
  ellipse(297,400,6,6);
  
  //mouse
  fill(#FF2424);
  noStroke();
  bezier(362,424,352,494,227,494,215,424);
  
if(mousePressed) {
  
  float a=random(255);
  
  fill(a);
  stroke(0);
  quad(252,424,252,461,316,461,315,424);
  stroke(0);
  line(281,424,281,461);
  
  fill(mouseX,mouseY,0);
  noStroke();
  ellipse(414,410,102,102);
  ellipse(154,410,102,102);
  
  translate(mouseX, mouseY);
  fill(a,250,25,149);
  stroke(255);
  strokeWeight(2);
  ellipse(0,0,100,100);

 } 
 }

