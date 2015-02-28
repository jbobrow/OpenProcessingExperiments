
float x, y;
float dim = 50.0;
 
void setup() {
  size(400, 200);
  noStroke();
}
 
void draw() {
  background(120);
   
  x = x + 1;
   
  if (x > height + dim) {
    x = -dim;
  }
   

   
  translate(x, dim);
  fill(255);
  translate(x,dim/2);
  
  ellipse(-dim/2, -dim/2, dim, dim);
  fill(0);
  translate(x,dim/2);
  ellipse(-dim/2, -dim/2, dim, dim);
  translate(x,dim/2);
  ellipse(-dim/2, -dim/2, dim, dim);
 

}
