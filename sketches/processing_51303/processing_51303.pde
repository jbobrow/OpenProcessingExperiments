
void setup(){
size(315, 325);
smooth();
background(225);
fill(255);
rect(0,215, 350, 350);
fill(255);
//body
ellipse(139, 230,125, 125);
ellipse(139, 131, 100, 100);
ellipse(139, 55, 75, 75);
//nose
fill(247, 165, 57);
triangle(130,68,138,50,148, 68);
//eyes
fill(0);
ellipse(124, 40, 8, 8);
ellipse(148, 40, 8, 8);
//smile
ellipse(124, 76, 3, 3);
ellipse(136, 80, 3, 3);
ellipse(148,78,3,3);
//arms
stroke(145, 53, 45);
strokeWeight(3);
line(5,60,35, 68); 
line(33,45, 38,68);
line(16,48,38, 68);
line(35,68,95,110);
strokeWeight(3);
line(263,45, 250, 65);
line(280, 55,250,65);
line(248,40,250, 65);
line(250,65,186,110);
stroke(0);
strokeWeight(1);

//buttons
fill(0);
ellipse(137,112, 8, 8);
ellipse(137, 134, 8,8);
ellipse(137, 158, 8, 8);
//
text("Drag your mouse across to let it snow!" ,45, 310);
}

void draw() {
  fill(255,255,255, 225);
  ellipse(mouseX, mouseY, 4, 4);
 
}



