
size(300,300);
smooth();
for (int x=0;x<=400;x+=20){
  for(int y=0;y<=400;y+=20){   
fill(#ff0000);
    rect(x,y,15,15);
}
}
stroke(10,60);
for (int i = 0; i <400; i++) {
  float r = random (10);
  strokeWeight(r);
  float offset = r*0.0;
  line(i-0,400, i+ offset, 0);
}

for (int x=0;x<=400;x+=40){
  for(int y=0;y<=400;y+=40){   
fill(#ff0000);
    rect(x,y,15,15);
}
}
