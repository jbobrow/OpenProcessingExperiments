
void setup () {
  size(640,480);
   frameRate(30);
}
 
void draw() {
  background(0);
  smooth();
  
strokeWeight(2.5);
stroke(146, 148, 151);

//Vampire Face
fill(194,231,245);
rectMode(CENTER);
rect(mouseX, mouseY,80,80);

//Eyes outside
fill(255);
ellipse(mouseX-15, mouseY+5, 30,30);
ellipse(mouseX+15, mouseY+5, 30,30);

//Eyes inside
fill(0);
ellipse(mouseX-7.5, mouseY+5, 15,15);
ellipse(mouseX+7.5, mouseY+5, 15,15);

//mouth
line(mouseX-30, mouseY+30, mouseX+30, mouseY+30);

//fangs
fill(255);
triangle(mouseX-25, mouseY+30, mouseX-5, mouseY+30, mouseX-15, mouseY+50);
triangle(mouseX+25, mouseY+30, mouseX+5, mouseY+30, mouseX+15, mouseY+50);

//hair
fill(36,59,161);
triangle(mouseX-15,mouseY-40,mouseX+15,mouseY-40,mouseX,mouseY-10);

}

void mouseDragged()  {
   //Vampire Face
fill(mouseX,mouseY*2,mouseX*.5);
rectMode(CENTER);
rect(mouseX, mouseY,80,80);

//Eyes outside
strokeWeight(4);
line(mouseX-25, mouseY, mouseX-5, mouseY );
line(mouseX+5, mouseY, mouseX+25, mouseY );

//mouth
line(mouseX-30, mouseY+30, mouseX+30, mouseY+30);

//fangs
fill(255);
triangle(mouseX-25, mouseY+30, mouseX-5, mouseY+30, mouseX-15, mouseY+50);
triangle(mouseX+25, mouseY+30, mouseX+5, mouseY+30, mouseX+15, mouseY+50);

//hair
fill(36,59,161);
triangle(mouseX-15,mouseY-40,mouseX+15,mouseY-40,mouseX,mouseY-10);
}

