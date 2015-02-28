
size(250,250);
smooth();

background(34,161,185);
noStroke();

//main circles
fill(171,203,209,80);
for(int y=0; y<=height; y+=50){
  for(int x=0; x<=width; x+=50){
    ellipse(x,y,40,40);
  }
}


//shadow of circles (lower)
fill(171,203,209,110);
for(int y=20; y<=height; y+=50){
  for(int x=20; x<=width; x+=50){
    ellipse(x,y,40,40);
  }
}


//faded circles (above)
fill(171,203,209,80);
for(int y=10; y<=height; y+=50){
  for(int x=10; x<=width; x+=50){
    ellipse(x,y,40,40);
  }
}


//lines at top going down
strokeWeight(30);
for(int i=-120; i<300; i +=50){
  line (i,150,i+100,0);
  stroke (255,255,255,140);
}

strokeWeight(10);
for(int i=-100; i<300; i +=50){
  line (i,150,i+100,0);
  stroke (255,255,255,140);
}




