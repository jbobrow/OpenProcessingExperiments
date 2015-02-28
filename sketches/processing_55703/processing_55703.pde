
void setup() {
size (500, 500);
}

void draw () {
background(204);
if (keyPressed) {

//Head
noStroke();
beginShape(); 
vertex (240, 210);
vertex (200, 125);
vertex (220, 140);
vertex (280, 140);
vertex (300, 125);
vertex (260, 210);
endShape();

//Tail 
noStroke ();
fill (225);
beginShape();
vertex (250, 312);
vertex (320, 312); 
vertex (350, 240);
vertex (300, 300);
vertex (250, 312);
endShape();

//Feet
noStroke();
fill(0);
ellipse (290, 310, 50, 25);
ellipse (210, 310, 50, 25);

//Body
fill (255, 255, 255);
smooth();
noStroke();
ellipse (250, 250, 125, 125); 

//Nose&Eyes
fill (255);
triangle (250, 185, 235, 165, 265, 165);
stroke (255);
strokeWeight (4);
line (225, 155, 240, 155);
line (275, 155, 260, 155);

//Hands
fill (0);
noStroke ();
ellipse (312, 230, 25, 25);
ellipse (188, 230, 25, 25);

} else {
  
//Head
noStroke();
beginShape(); 
vertex (240, 210);
vertex (200, 125);
vertex (220, 140);
vertex (280, 140);
vertex (300, 125);
vertex (260, 210);
endShape();

//Tail 
noStroke ();
fill (320, 210, 110);
beginShape();
vertex (250, 312);
vertex (320, 312); 
vertex (350, 240);
vertex (300, 300);
vertex (250, 312);
endShape();

//Feet
//noStroke();
//fill(255);
//ellipse (290, 320, 50, 25);
//ellipse (210, 320, 50, 25);

//Body
fill (320, 210, 110);
smooth();
noStroke();
ellipse (250, 250, 125, 125); 

//Nose&Eyes
fill (255);
triangle (250, 185, 235, 165, 265, 165);
stroke (255);
strokeWeight (4);
point (240, 155);
point (260, 155);

//Hands
noStroke();
fill (0);
triangle (260, 250, 260, 240, 310, 250);
triangle (240, 250, 240, 240, 190, 250);  
}
}

