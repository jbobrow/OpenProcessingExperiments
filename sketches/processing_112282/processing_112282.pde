
 size (500, 500);
  background (32, 53, 23);

 
  for (int x = 0; x<width; x +=10) {
 
    for (int y = 0;  y<height; y+=10) {
      
    beginShape();
vertex(x+10,480);
vertex(y,y);
vertex(y+20,x+20);
vertex(217,x);
vertex(x,y);

// etc;
endShape(CLOSE);

    
 
      {
      }
    }
  }




