
size (500,500);
smooth();
background (0);

    fill(247,208,62);
for(int x=0; x<500; x=x+60){
  for(int y=0; y<500; y=y+60){ 
    rect (x+10,y, 100,50);
    stroke(255,46,23);
    line (x, x, y, y+500);
    stroke(255);
    line (x+500, x,y,y);
    stroke(255,46,23);
    line (y, x,y,y);
    stroke(255);
    line (x, y,y,y);
    ellipse(x,y,10,10);
  }
}

for(int x=0; x<400; x=x+20){
  for(int y=0; y<400; y=y+20){ 
    rect (x+10,y, 100,50);
    stroke(255,46,23);
    line (x, x, y, y+500);
    stroke(255);
    line (x+500, x,y,y);
    stroke(255,46,23);
    stroke(255);
    line (x, y,y,y);
    ellipse(x,y,10,10);
  }
}

for(int x=0; x<300; x=x+20){
  for(int y=0; y<500; y=y+20){ 
    rect (x+10,y, 100,50);
    stroke(150,52,152);
    line (x, x, y, y+500);
    stroke(255);
    line (x+400, x,y+200,y);
    stroke(255,46,23);
    stroke(255);
    line (x, y,y,y);
    ellipse(x,10,10,10);
  }
}

for(int x=0; x<200; x=x+20){
  for(int y=0; y<200; y=y+20){ 
    line (x+400, x,y+200,y);
    stroke(295,46,23);
    line (x, 40,y,40);
    ellipse(x,y,40,40);
  }
}


