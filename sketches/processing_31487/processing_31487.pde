
size (500,500);
smooth ();
background(0);
strokeWeight(2);
for (int y=0; y<=500; y+=10){
for (int x=0; x<=500; x+=10){
  stroke (y,x,255);
  line(x,y,x+10,y-10);
}
}

for(int y=0; y<=500; y+=10){
for(int x=0; x<=500; x+=30){
  stroke(x,y,255);
  line(x,y,x+10,y+10);
}
}
                
