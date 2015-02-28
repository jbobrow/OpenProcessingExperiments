
size(300, 300);
background(150);
fill(100);
noStroke();
smooth();

  int a=10; 
  int b=15;
 
 //creates squares
 for (int c=a; c<height-a; c+=b) {
    for (int d=a; d<width-a; d+=b) {
      rect(d, c, 10, 10);
    }
  }
  
  //creates final square
  fill(255, 200, 10);
  rect(175, 175, 55, 55);
  rect(190, 190, 55, 55);


