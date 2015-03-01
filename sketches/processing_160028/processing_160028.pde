


void setup() {
  size(600, 600) ;
}

void draw() {

  // THE pattern
fill(#8DC9D3);
for (int y=0; y<height ; y++){
for (int x=0; x<width ; x++){
 ellipse(20*x,20*y,30,30);
    }
  }
  // end of pattern

  // The HEAD
  fill(0);
  ellipse(264,120,160,180);
  
  
  
  fill(255, 0, 0) ;
 beginShape();
    vertex(212,72);
    vertex(320,72);
    vertex(360,122);
    //vertex(320,172);
    vertex(360,122);
    vertex(212,172); 
    vertex(320,172);
    vertex(172,122);
    vertex(212,72);
   
    vertex(172,122);
    //vertex(212,172);
    //vertex(320,72);
  endShape();
  
  // eye
  fill(#89E548);
ellipse(266,104,55,15);
fill(0);
ellipse(266,104,15,15);


// The Torso
fill(0);
quad(218,195,311,195,333,334,190,334);
fill(#DB2CF0);
ellipse(266,220,10,25);
ellipse(266,260,10,25);
ellipse(266,300,10,25);


// Arms
fill(125);
triangle(319,236,438,310,326,281);
triangle(210,236,94,310,200,281);

// Legs
rect(200,334,20,100);
rect(255,334,20,100);
rect(307,334,20,100);

fill(95);
ellipse(211,438,40,40);
ellipse(265,438,40,40);
ellipse(318,438,40,40);
fill(0);
ellipse(211,438,10,10);
ellipse(265,438,10,10);
ellipse(318,438,10,10);



  // this is a helper area to show your mouse coordinates
  // to help you know where to place objects
  // you can comment this out when you're done with your 
  // monster

 // fill(255) ; 
 // rect(0, 0, 70, 20) ;
 // fill(0) ; 
 // text(mouseX + ", " + mouseY, 10, 15) ;
 }



