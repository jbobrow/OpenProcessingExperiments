


void setup() {
  size(220, 130);
  noStroke () ;
  color middle = color(204, 153, 0);
  color outside = color(250, 209, 131);
  color oval = color (21, 113, 30 );
  color roundhouse = color ( 131, 137, 132 );
  color cafe = color ( 131, 137, 132 );
  color value = color (204, 102, 0) ;
  color law = color ( 131, 137, 132 );  
  color chem = color ( 131, 137, 132 );  
  color sci = color ( 131, 137, 132 );
  color block = color ( 131, 137, 132 );
  color scit = color ( 131, 137, 132 );
  color asb = color ( 131, 137, 132 );

  
  fill(outside);
  rect(0, 0, 400, 200);
  fill(middle);
  rect(0,65, 400, 10);
  fill(oval) ;
  ellipse (40, 140, 105, 105 ) ;
  fill (roundhouse);
  ellipse (0, 0, 45, 45 ) ;
  fill (value) ;
  rect (110, 75, 70, 15) ;
  fill (cafe) ;
  rect (0, 40, 20, 10 ) ;
  fill (law) ;
  rect (30, 35, 30, 15 ) ;
  fill (chem) ;
  rect (70, 35, 35, 15 ) ;
  fill (sci) ;
  rect (110, 25, 10, 35 ) ;
  fill (block) ;
  rect (130, 25, 15, 15) ;
  fill (scit) ;
  rect (145, 40, 35, 10) ;
  fill (asb) ;
  rect (95, 8, 70, 10 ) ;
  

}

int value = 0 ;

void draw() {
    fill (value); 
    rect(115, 78, 60, 10); 
}

void mouseClicked () {
  if (value == 0) {
    value = 200;
  } else {
    value = 0;
  }

}


