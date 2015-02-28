
// Using Arrays to Draw
// From http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-08.pdf

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white

}

void draw() {  //draw function loops 
int[] x = {50, 61, 83, 69, 71, 50, 29, 31, 17, 39};
int[] y = {18, 37, 43, 60, 82, 73, 82, 60, 43, 37};
smooth();
strokeWeight(6);
beginShape();
// Reads one array element every
// time through the for loop
for (int i = 0; i < x.length; i++) {
vertex(x[i]* 2, y[i]* 2);
}
endShape(CLOSE);
}

                
                
