
size(600,600);
smooth();
background(0);

for(int x = 50;x <=550;x += 15){
    for(int y = 50;y <=550;y += 15){
      noFill();
      stroke(random(255),y,x);
      strokeWeight(1);
      ellipse(x,y,30,30);
    }
  }

