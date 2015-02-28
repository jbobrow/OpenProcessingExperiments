
size(500,500);
background(#FFFFFF);

//bluegrid
for(int x=10; x<=450; x+=15){
  for(int y=10; y<=490; y+=10){
strokeWeight(2);
stroke(80,80,200,80);
noFill();
rect(x,y,20,20);
  }
}

//green squares
for(int x=25; x<=455; x+=25){
  for(int y=10; y<=490; y+=15){
fill(0,255,0);
strokeWeight(0);
noStroke();
rect(x,y,40,5);
 }
}

fill(0,255,0,180);
rect(478,10,100,500);
