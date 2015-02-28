
//nested loop..inception loooooop

size(250, 250);
background(0);
smooth();


//pink
for(int y=0; y<=height; y+=10){
  for(int x=0; x<=width; x+=10){
    strokeWeight(1);
    stroke(200, 5, 80, 50);
    line(125, 125, x, y);
  }
}

//
for(int y=0; y<=250; y+=4){
  for(int x=0; x<=250; x+=4){
    strokeWeight(2);
    stroke(0);
    point(x,y);
  }
}

//

for(int y=0; y<=100; y+=30){
  for(int x=0; x<=100; x+=30){
    noFill();
    strokeWeight(0.3);
    stroke(x*2, y*2, 340, 200);
    ellipse(125, 125, x, y);
  }
}

for(int y = 20; y < 250; y += 30){
  for(int x = 20; x < 250; x += 30){
    stroke(x*2, y*2, 240, 60);
    strokeWeight(0.5);
    ellipse(x, y, 150, 150);}
}

