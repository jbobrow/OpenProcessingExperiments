
/* Code exercise done by Julia Grzeskowiak
York/Sheridan Joint Program in Design */

size(250,250);
translate(125,125); //translate 125 horizontally, 125 veritcally
background(255);
rectMode(CENTER);
fill(60,0,0); //R=60, G=0, B=0
noStroke();
smooth();

for(int x=180; x>0;x=x-10){ //integer setting: x=180, x is greater than 0, x is equal to x minus 10
  rect(0,0,x,x);            //x-coordinate of upper-left corner set to 0, y-cooridinate set to 0, width and height are equal to x
  fill(260-x,0,0);          // fill colour : R= 260 subtract x value, G= 0, B=0
  rotate(PI/6);             // angle of rotation set to pie divided by 6

  }


