
void setup() {
size (500, 500);
smooth();
noStroke();
background(204);

}

void draw() {
background(204);
if ((mouseX > 250) && (mouseY > 250)) {
int x = width;
int y = height;
int v = 250; 
   
//Head
noStroke();
fill(mouseX, mouseY/3, mouseY*2);
beginShape(); 
vertex (v-10, v-40);
vertex (v-50, v-125);
vertex (220, 140);
vertex (280, 140);
vertex (300, 125);
vertex (260, 210);
endShape();

//Tail 
noStroke ();
fill (mouseX, 300, mouseY);
beginShape();
vertex (250, 312);
vertex (320, 312); 
vertex (350, 240);
vertex (300, 300);
vertex (250, 312);
endShape();

//Feet
noStroke();
fill(mouseX*2, mouseX+100, mouseY/2);
ellipse (290, 310, 50, 25);
ellipse (210, 310, 50, 25);

//Body
noStroke();
fill (mouseY, mouseX, 90);
smooth();
ellipse (250, 250, 125, 125); 

//Nose&Eyes
fill (255);
triangle (250, 185, 235, 165, 265, 165);
stroke (255);
strokeWeight (4);
line (225, 155, 240, 155);
line (275, 155, 260, 155);

//Hands
noStroke();
fill(mouseX*2, 70, mouseY/2);
ellipse (312, 230, 25, 25);
ellipse (188, 230, 25, 25);

} else {
background(204);

//Head
noStroke();
fill(mouseX, mouseY/3, mouseY*2);
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
fill (mouseX, 300, mouseY);
beginShape();
vertex (250, 312);
vertex (320, 312); 
vertex (350, 240);
vertex (300, 300);
vertex (250, 312);
endShape();

//Feet
noStroke();
fill(mouseX*2, mouseX+100, mouseY/2);
ellipse (290, 310, 25, 50);
ellipse (210, 310, 25, 50);

//Body
noStroke();
fill (mouseY, mouseX, 90);
smooth();
ellipse (250, 250, 125, 125); 

//Nose&Eyes
fill (255);
triangle (250, 185, 235, 165, 265, 165);
stroke (255);
strokeWeight (4);
line (225, 155, 240, 155);
line (275, 155, 260, 155);

//Hands
noStroke();
//strokeWeight(5);
fill(mouseX*2, mouseX-70, mouseY/2);
//line (312, 230, 250, 250);
//line (188, 230, 250, 250);
ellipse (312, 230, 40, 40);
ellipse (188, 230, 40, 40);

}
}

