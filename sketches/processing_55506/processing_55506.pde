
/* Code exercise done by Julia Grzeskowiak
York/Sheridan Joint Program in Design */

size(250,250);
translate(100,100); //translate 100 horizontally, 100 veritcally
background(255);
stroke(255);        // white stroke
smooth();

for(int x=180; x>0;x=x-10){ //integer setting: x=180, x is greater than 0, x is equal to x minus 10
  rect(0,0,x,x);            //x-coordinate of upper-left corner set to 0, y-cooridinate set to 0, width and height are equal to x
  fill(100-x,34+x,x,50);          // fill colour : R= 100- x value, G= 34, B=x value, opacity= 50
  rotate(PI/6);             // angle of rotation set to pie divided by 6

  }


