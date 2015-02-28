

size (400, 400);
background (255);
colorMode (RGB, width);
rectMode (CENTER);
ellipseMode (CENTER);
smooth();


for (int P = 20; P < width; P+=30) {      // This line decide begining point and distance of each object on X-axis    
  for (int J = 20; J < height; J+=30) {   // This line decide begining point and distance of each object on Y-axis     
    noStroke();
    fill (width, J, P, random(255));      // Color for ellipses & random transparency   
    ellipse (P, J, 20, 20);
    stroke (width, P, J);                 // Color for rectangles
    rect (P, J, 10, 10);
  }
}


