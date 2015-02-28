
PImage img;

void setup(){
size(500,500);
smooth();
img = loadImage("tree.JPG");
}

void draw(){
image(img, 0, 0);

////left eyeball
//ellipse(113, 130,18,18);


//left eyebrow
strokeWeight(6);
stroke(255, 40, 31);
strokeCap(SQUARE);
line (82,104,  144,104);



//right eyebrow
strokeWeight(6);
stroke(255, 40, 31);
strokeCap(SQUARE); 
line (356, 104,  419,104);

//nose1
strokeWeight(6);
stroke(255, 40, 31);
strokeCap(SQUARE);
line (240,190,  240,210);

//nose2
strokeWeight(6);
stroke(255, 40, 31);
strokeCap(SQUARE);
line (237,210,  260,210);

//
//strokeWeight(6);
//stroke(255, 40, 31);
//strokeCap(SQUARE);
//line (107,289,  393,289);


//map(original value, lowest of og value, highest of   og value, new lowest, new highest)
float mouth_h = map(mouseY, 0, height, 10, 200);

rect(107,289, 286, mouth_h);

if (mousePressed == true) {
  stroke(10);
}
line (82,104,  144,104);
line (356, 104,  419,104);
}






