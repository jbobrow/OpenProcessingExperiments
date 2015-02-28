
/* Code by Julia Grzeskowiak
York/Sheridan Joint Program in Design */
//translate resource: http://processing.org/learning/basics/translate.html //

float a, b;
float size = 20; // set size variable
float center = 10.0; //set radius dimension

void setup (){
  size (500,300); 
  smooth();
  noStroke();
  rectMode(CENTER); // set elipse to adjust from center point
  background(50); // background dark grey

}

void draw(){
 
  
  a = a + 0.5; // when drawing a, add 0.5
  
  if (a > width + size) {
    a = -size;             // if a is greater than width size of frame+ size variable, a should diminish by size variable
  }
  
   translate (a, size+85);    //translate horizontally by variable a, and translate vertically by size variable (20) + 85
  fill(255,97,56);            //Red= 255, G= 92, B=56
  rect(-size/2,-size/2, size, size);  //x-coordinate of the upper-left corner set to decrease to half the size of 'size' variable (20/2), as well as the y-coordinate of the upper-left corner; While width and height are 20.
   
    translate(a, size);      //translate horizontally by variable a, and translate vertically by size variable (20)
  fill(255,255,157);         //Red= 255, G= 225, B=257
  rect(-size/2, -size/2, size, size); //x-coordinate of the upper-left corner set to decrease to half the size of 'size' variable (20/2), as well as the y-coordinate of the upper-left corner; While width and height are 20.
 
    translate(a, size);      //translate horizontally by variable a, and translate vertically by size variable (20)
  fill(190,235,159);         //Red= 190, G= 235, B=159
  rect(-size/2, -size/2, size, size); //x-coordinate of the upper-left corner set to decrease to half the size of 'size' variable (20/2), as well as the y-coordinate of the upper-left corner; While width and height are 20.
  
    translate(a, size);      //translate horizontally by variable a, and translate vertically by size variable (20)
  fill(121,189,143);         //Red= 121, G= 189, B=143
  rect(-size/2, -size/2, size, size); //x-coordinate of the upper-left corner set to decrease to half the size of 'size' variable (20/2), as well as the y-coordinate of the upper-left corner; While width and height are 20.
  
   translate(a, size);      //translate horizontally by variable a, and translate vertically by size variable (20)
  fill(0,163,136);          //Red= 0, G= 163, B=136
  rect(-size/2, -size/2, size, size); //x-coordinate of the upper-left corner set to decrease to half the size of 'size' variable (20/2), as well as the y-coordinate of the upper-left corner; While width and height are 20.
 
  translate(a, size);      //translate horizontally by variable a, and translate vertically by size variable (20)
  fill(10,33,43);          //Red= 10, G= 33, B=43
  rect(-size/2, -size/2, size, size);  //x-coordinate of the upper-left corner set to decrease to half the size of 'size' variable (20/2), as well as the y-coordinate of the upper-left corner; While width and height are 20.
}
  


