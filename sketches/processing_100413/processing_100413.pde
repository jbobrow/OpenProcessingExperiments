
// The following code creates my very first Processing-born creature, Miss littleAngel.


// Set up the canvas where Miss littleAngel will land.
int width = 600;
int height = 800;
size(600, 800);
background(240, 211, 224);

// The golden circle that floats above Miss littleAngel's head.
stroke(255, 234, 0);
strokeWeight(5);
ellipse(width / 2, height / 7, 200, 45);


// Miss littleAngel's circular face outline. 
stroke(100, 100, 100);
strokeWeight(3.5);
noFill();
ellipse(width / 2, height / 2.4, 350, 350);

// The sleepy left eye of Miss littleAngel. 
line(width / 3, height / 7 * 2.6, width / 2 * 0.9, height / 7 * 2.6);

// The sleepy right eye of Miss liettleAngel. 
line(width / 2 * 1.15, height / 7 * 2.4, width / 2 * 1.25, height / 7 * 2.8);
line(width / 2 * 1.25, height / 7 * 2.8, width / 2 * 1.37, height / 7 * 2.4);

// The little red-cherry mouth of Miss littleAngel. 
stroke(255, 0, 0);
strokeWeight(5);
point(width / 2, height / 2 * 1.05);

// Initialize the width and height of Miss littleAngel's arms.
int arm_width = 120;
int arm_height = 30;

// The left arm of Miss littleAngel.
stroke(100, 100, 100);
strokeWeight(3.5);
noFill();
rect(width / 6 * 0.85, height / 2.4 + 235, arm_width, arm_height);

// The right arm of Miss littleAngel.
// Note: we use "pushMatrix() - translate() - rotate(radians()) - popMatrix()" method 
//for drawing this rectangle as we want to turn the right arm "up".
pushMatrix();
translate(width / 3 * 1.85, height / 2.4 + 240);
rotate(radians(325));
rect(0, 0, arm_width, arm_height);
popMatrix(); 

// The triangle body of Miss littleAngel.
fill(240, 211, 224);
stroke(100, 100, 100);
strokeWeight(3.5);
triangle(width / 2, height / 2.4 + 176, width / 5 * 0.9, height / 7 * 6, width / 5 * 4.1, height / 7 * 6);
/*point(width / 2, height / 2.4 + 176); // first point (top pt) of the triangle
point(width / 5, height / 7 * 6); // second point (left-hand side pt) of the triangle
point(width / 5 * 4, height / 7 * 6); // third point (right-hand side pt) of the triangle*/

/*// The signature of Miss littleAngel.
fill(207, 118, 255);
// Use the class PFont to pick a specific font. 
PFont font; 
font = loadFont("NanumBrush-48.vlw");
textFont(font, 34);
text("Miss littleAngel", width / 3 * 2, height / 7 * 6.6);*/









