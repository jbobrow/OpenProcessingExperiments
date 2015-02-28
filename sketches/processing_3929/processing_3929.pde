
void setup() {
size (900,500);
background (#FFFFFF);

fill(#E37622);
rect(200,300,500,75); //red centre
fill(#716D6A);
rect(700,325,60,80); //internation library
fill(#716D6A);
rect(200,375,50,200); //newton bulding
fill(#716D6A);
rect(260,440,75,100); //old main building
fill(#716D6A);
rect(420,440,50,200); //old main building
fill(#716D6A);
rect(760,440,50,200); //old mian building
fill(#716D6A);
rect(200,-10,50,190); //dalton building
fill(#368E58);
rect(270,105,200,75); //lawn
fill(#716D6A);
rect(550,80,300,100); //webster building
}

void draw() {
  if(mousePressed) {
    stroke(255);
  } else {
    stroke(0);
  }
  ellipse(mouseX, mouseY, 5, 5);
  
}

