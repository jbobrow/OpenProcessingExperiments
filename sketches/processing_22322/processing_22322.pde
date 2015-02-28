
float r = PI/6; // initial rotation

void setup () {
size (400, 400);
smooth();
background (255);

}

void draw () {

if (frameCount > 50) { //if statement to prevent drawing in the upper left corner
rectMode (CENTER);

pushMatrix ();
translate (mouseX, mouseY); //move the origin point according to mouse value
rotate (r);

fill (0, 250, 200);
ellipse (0, 0, 30, 30);
ellipse (30, 30, 30, 30);// use 0,0 to position where mouse is
popMatrix ();

r += PI/36; //increment angle – make smaller to slow rotation
}
}

                
                
