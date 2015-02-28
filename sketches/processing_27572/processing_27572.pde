
float theta = 0.5f;
void dibujito2() { 
  stroke( color(23, 116, 118) );
  fill( color(random(0,222),random(23,2),random(46,22),random(95,245)));
  triangle(0, 0,  10,  10, 10, -20);

  stroke( color(23, 116, 118) );
 
  triangle(0, 0, - 18,  15,  +18, -30);
  
  stroke( color(23, 116, 118) );
 fill( color(random(0,222),random(23,2),random(46,22),random(95,245)));
  triangle(0, 0, 0 - 20, 0+ 35, 0 +0, 0-30);

  stroke( color(23, 116, 118) );
 fill( color(random(0,222),random(23,2),random(46,22),random(95,245)));
 triangle(60, 168, 169, 65, 172, 162);

  triangle(60, 168, 214, 75, 172, 162);

  stroke( color(23, 116, 118) );
  fill( color(113, 17, 73));
  triangle(60, 168, 222, 288, 172, 162);
}





void dibujito(int x, int y) { 
  stroke( color(23, 116, 118) );
  fill( color(random(0,222),random(23,2),random(46,22),random(95,245)));
  triangle(x, y, x - 10, y+ 10, x +10, y-20);

  stroke( color(23, 116, 118) );
 
  triangle(x, y, x - 18, y+ 15, x +18, y-30);
  
  stroke( color(23, 116, 118) );
fill( color(random(0,222),random(23,2),random(46,22),random(95,245)));
  triangle(x, y, x - 20, y+ 35, x +0, y-30);

  stroke( color(23, 116, 118) );
fill( color(random(0,222),random(23,2),random(46,22),random(95,245)));
  triangle(60, 168, 169, 65, 172, 162);

  triangle(60, 168, 214, 75, 172, 162);

  stroke( color(23, 116, 118) );
fill( color(random(0,222),random(23,2),random(46,22),random(95,245)));
  triangle(60, 168, 222, 288, 172, 162);
}


void setup () {
  size(600, 600);
}
void draw( ) {
    fill( 0, 10);
  rect(0,0,width,height);
  theta += 0.01f;
  translate(width/2, height/2);
  rotate(theta);
 
 
  for (int x=0;x<   width;x+=100) {

    for (int y=0;y< width;y+=100) {
      pushMatrix();

      translate(x,y);
    scale(mouseX/float(width)*5);
     
      dibujito2();
      popMatrix(); 
    }
  } 
  dibujito(25, 30);
}






