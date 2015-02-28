
size(600, 600);
smooth();
background(0);

for(int x = 300; x<=width; x=x+100){
  for(int y = 150; y<=width; y=y+150){
      for(int z = 2; z < y; z++){
        noFill();
        stroke(255, 20);
        ellipse(x,y, 50,50);
        noFill();
        stroke(35,144,90, 50);
        quad(x,y, 550, 280, 550,550, 400, 550);
      }
  }
}

for(int x = 300; x<=width; x=x+50){
  for(int y = 150; y<=width; y=y+75){
      for(int z = 2; z < y; z++){
        noFill();
        stroke(255, 20);
        ellipse(x,y, 50,10);
        noFill();
        stroke(35,144,90, 10);
        quad(x,y, 550, 280, 550,550, 400, 550);
      }
  }
}

for(int x = 150; x<=width; x=x+50){
  for(int y = 250; y<=width; y=y+75){
      for(int z = 2; z < y; z++){
        noFill();
        stroke(255, 20);
        ellipse(x,y, 50,50);
        noFill();
        stroke(35,144,90, 10);
        quad(x,y, 550, 280, 550,550, 400, 550);
      }
  }
}


for(int x = 150; x<=width; x=x+50){
  for(int y = 250; y<=width; y=y+75){
      for(int z = 2; z < y; z++){
        noFill();
        stroke(255,10);
        triangle(x, z, x, y, z,y);
      }
  }
}


