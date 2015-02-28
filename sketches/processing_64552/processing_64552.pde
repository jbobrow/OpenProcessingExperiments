
float x;



void setup () {

  size(700, 500);
  smooth();
  background(255);
  noStroke();
  x = 100; 
  
  
}

void draw() {


  fill(#DED945);
  triangle(2*x, 100, 3*x, 100, 3*x, 2*x);

  fill(#84B1C6);
  triangle(2*x, 100, 3*x, 2*x, 2*x, 2*x);

  fill(#DED945);
  triangle(2*x, 2*x, 3*x, 2*x, 3*x, 3*x);
  fill(#84B1C6);
  triangle(2*x, 2*x, 3*x, 3*x, 2*x, 3*x);


  fill(#84B1C6);
  triangle(2*x, 3*x, 3*x, 3*x, 3*x, 4*x);
  fill(#A4E07C);
  triangle(2*x, 3*x, 3*x, 4*x, 2*x, 4*x);



  fill(#A4E07C);
  triangle(3*x, 2*x, 4*x, 2*x, 4*x, 3*x);


  fill(#FF6B6B);
  triangle(4*x, x, 5*x, 1*x, 5*x, 2*x);
  fill(#4ECDC4);
  triangle(4*x, x, 5*x, 2*x, 4*x, 2*x);
  fill(#4ECDC4);
  triangle(4*x, 2*x, 5*x, 2*x, 5*x, 3*x);
  fill(#79EAFF);
  triangle(4*x, 2*x, 5*x, 3*x, 4*x, 3*x);
  fill(#A4E07C);
  triangle(4*x, 3*x, 5*x, 3*x, 5*x, 4*x);
  fill(#79EAFF);
  triangle(4*x, 3*x, 5*x, 4*x, 4*x, 4*x);
}


