
size(600, 600);
smooth();
background(0);

for(int x = 0; x<=width; x=x+25){
  for(int y = 0; y<=width; y=y+15){
      for(int z = 2; z < y; z+=20){
        noFill();
        stroke(166, 37,206,25);
        ellipse(x,y, x+5,5);
        noFill();
         stroke(255,10);

        triangle(x,y, 550, 280, 550,550);
      }
  }
}


for(int x = 150; x<=width; x=x+50){
  for(int y = 250; y<=width; y=y+150){
      for(int z = 2; z < y; z++){
        noFill();
    
        stroke(35,144,90, 10);
        triangle(z, y, x, x, y,y);
        rotate(PI*2);
      }
  }
}

stroke(35,144,90, 10);
triangle(475, 80, 500, 80, 500, 125);


