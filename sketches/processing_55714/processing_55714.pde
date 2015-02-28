
void setup(){
size (500, 500);
}

void draw (){
background(204);
  
//Head
noStroke();
fill(0);
beginShape(); 
vertex (mouseX-10, mouseY-40);
vertex (mouseX-50, mouseY-125);
vertex (mouseX-30, mouseY-110);
vertex (mouseX+30, mouseY-110);
vertex (mouseX+50, mouseY-125);
vertex (mouseX+10, mouseY-40);
endShape();

//Tail 
noStroke ();
fill (225);
beginShape();
vertex (mouseX, mouseY+62);
vertex (mouseX+70, mouseY+62); 
vertex (mouseX+100, mouseY-10);
vertex (mouseX+50, mouseY+50);
vertex (mouseX, mouseY+62);
endShape();

//Feet
noStroke();
fill(0);
ellipse (mouseX+40, mouseY+60, 50, 25);
ellipse (mouseX-40, mouseY+60, 50, 25);

//Body
fill (255, 255, 255);
smooth();
noStroke();
ellipse (mouseX, mouseY, 125, 125); 

//Nose&Eyes
//fill ();
//triangle (mouseX, mouseY-65, mouseX+15, mouseY-85, mouseX+15, mouseY-85);
stroke (255);
strokeWeight (4);
line (mouseX-25, mouseY-95, mouseX-10, mouseY-95);
line (mouseX+25, mouseY-95, mouseX+10, mouseY-95);

//Hands
noStroke();
fill(0);
ellipse (mouseX+62, mouseY-20, 25, 25);
ellipse (mouseX-62, mouseY-20, 25, 25);

}






