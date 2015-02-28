
size(200, 200);
background(209, 245, 250);



for (int x=1; x<width;x+=10) { // the lines are seperated at 10 pixles each
  strokeWeight(2);
  stroke(10, x, x); //this creates a gradent for the stroke color
  line(x, width, width, x);
}

for (int k=10; k<height; k+=20) { //the ciricles go down in a diagonal  
  fill(10, k, 115);
  ellipse(k, k, 20, 20);
}



