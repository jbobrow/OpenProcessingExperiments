
void setup() {
size(480, 120);
smooth();
}
void draw() {
  //color big eye
background(20, 75, 100 );
translate(110, 110);
stroke(0);
strokeWeight(70);
line(0, -35, 0, -65); // Body

noStroke();
fill(255);
ellipse(-17.5, -65, 35, 35); // Left eye dome
ellipse(17.5, -65, 35, 35); // Right eye dome

fill(0);
ellipse(-14, -65, 8, 8); // Left eye
ellipse(14, -65, 8, 8); // Right eye
quad(0, -58, 4, -51, 0, -44, -4, -51); // Beak

//heart
  beginShape();
  
 translate(mouseX, mouseY);


vertex(-50, -85); 
bezierVertex(-50, -90, -10, -95, -50, -60); 
vertex(-50, -85); 
bezierVertex(-50, -90, -90, -95, -50, -60); 
endShape();
   


//owl
translate(70, 0);
stroke(0);
strokeWeight(70);
line(0, -35, 0, -65); // Body
noStroke();
fill(255);
ellipse(-17.5, -65, 35, 35); // Left eye dome
ellipse(17.5, -65, 35, 35); // Right eye dome
arc(0, -65, 70, 70, 0, PI); // Chin
fill(0);
ellipse(-14, -65, 8, 8); // Left eye
ellipse(14, -65, 8, 8); // Right eye
quad(0, -58, 4, -51, 0, -44, -4, -51); // Beak 
}


