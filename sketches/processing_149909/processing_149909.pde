
size(750,750);
background(170);

strokeWeight(2);
for (int i = 0; i < height; i += 15){
  line(0,i,i,0);
}
strokeWeight(1);
for (int i = 0; i < height; i += 10){
  line(i,0,width,i);
}
for (int i=0; i < height; i += 20){
  line(0,i,width,height);
}

fill(0);
for(int x = 0; x < height/2; x+=20){
  for(int j = width/2; j < width; j += 20){
    ellipse(j+x,height/2+x, 10, 10);
  }
}


