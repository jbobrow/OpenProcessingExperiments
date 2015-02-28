
void setup () {
  
size (300,300); 
}

void draw () {
  
  background (255,255,255);
  
//haar zwart */  
noStroke ();
fill (0);
ellipse (mouseX-69,mouseY-88,180,210);

noStroke ();
fill (255,255,255);
rect (mouseX-70,mouseY+45,200,200);

//benen zwart */
noStroke ();
fill (0);
rect (mouseX+3,mouseY+100,35,40);

noStroke ();
fill (0);
ellipse (mouseX+3,mouseY+132,18,18);

noStroke ();
fill (0);
ellipse (mouseX+20,mouseY+132,18,18);

//benen wit */
noStroke ();
fill (250,250,250);
rect (mouseX+6,mouseY+100,29,36);

noStroke ();
fill (250,250,250);
ellipse (mouseX+6,mouseY+128,13,13);

noStroke ();
fill (250,250,250);
ellipse (mouseX+22,mouseY+128,13,13);

noStroke ();
fill (0);
rect (mouseX+6,mouseY+135,29,2);

noStroke ();
fill (0);
rect (mouseX+19,mouseY+100,4,36);

//jurk */
stroke (0);
fill (89,180,23);
rect (mouseX,mouseY+30,40,70);

noStroke ();
fill (0);
rect (mouseX,mouseY+55,40,20);

// armen */
stroke (0);
strokeWeight (3);
fill (253,209,190);
ellipse (mouseX-5,mouseY+40,10,55);

stroke (0);
fill (253,209,190);
ellipse (mouseX+35,mouseY+40,10,55);

//Hoofd */
stroke (0);
fill (253,209,190);
ellipseMode(CORNER);
ellipse (mouseX-48,mouseY-71,136,120);

// haar ponny */
noStroke ();
fill (0);
ellipse (mouseX-49,mouseY-72,139,100);

noStroke ();
fill (253,209,190);
rect (mouseX-30,mouseY-22,99,50);

//Mond */
noFill();
stroke(0);
ellipse (mouseX+7,mouseY,25,40);

noStroke ();
fill (253,209,190);
rect (mouseX,mouseY-16,35,40);

//oog wit */
stroke (0);
fill (255,255,255);
ellipse (mouseX-45,mouseY-33,60,60);

stroke (0);
fill (255,255,255);
ellipse (mouseX+25,mouseY-33,60,60);

//oog groen */
noStroke ();
fill (89,180,23);
ellipse (mouseX-38,mouseY-29,53,53);

noStroke ();
fill (89,180,23);
ellipse (mouseX+26,mouseY-29,53,53);

//oog zwart */
noStroke ();
fill (0);
ellipse (mouseX-26,mouseY-22,40,40);

noStroke ();
fill (0);
ellipse (mouseX+27,mouseY-22,40,40);

//oog wit */
noStroke ();
fill (255,255,255);
ellipse (mouseX-12,mouseY-10,17,17);

noStroke ();
fill (255,255,255);
ellipse (mouseX+35,mouseY-10,17,17);

noStroke ();
fill (0);
rect (mouseX-40,mouseY-33,120,12);

//driekhoek ponny */
noStroke ();
fill (253,209,190);
triangle(mouseX+30,mouseY-20,mouseX+20,mouseY-55,mouseX+15,mouseY-20);

}
