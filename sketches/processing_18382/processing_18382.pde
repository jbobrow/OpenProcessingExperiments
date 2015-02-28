
size(250,250);
smooth();

background(132,150,198);
smooth();
noStroke();

for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
    fill(255,140);
    ellipse (x,y,20,20);
      ellipse (x,y,5,5);
  }
}


size(250, 250);

for(int y=20; y<=230; y+=20){
  for(int x=20; x<=230; x+=20){
    strokeWeight (2);
  }
}

noStroke();

for(int y=0; y<=height; y+=40){
  for(int x=0; x<=width; x+=40){
    fill(255,140);
    ellipse (x,y,40,40);
  }
}

for(int y=20; y<=230; y+=4){
  for(int x=20; x<=230; x+=4){
    strokeWeight (2);
    point (x,y);
  }
}

fill(100,116,160,70);
ellipse(0,0,200,200);
ellipse(0,0,150,150);
ellipse(0,0,100,100);
ellipse(0,0,50,50);
ellipse(0,250,200,200);
ellipse(0,250,150,150);
ellipse(0,250,100,100);
ellipse(0,250,50,50);
ellipse(250,0,200,200);
ellipse(250,0,150,150);
ellipse(250,0,100,100);
ellipse(250,0,50,50);
ellipse(250,250,200,200);
ellipse(250,250,150,150);
ellipse(250,250,100,100);
ellipse(250,250,50,50);
ellipseMode(CENTER);
ellipse(125,125,200,200);
ellipse(125,125,150,150);
ellipse(125,125,100,100);


