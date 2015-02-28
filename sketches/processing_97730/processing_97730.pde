
size(400,400);
background(220,232,231);

for(int i = 0; i < 400; i = i + 15){
  
  if (i < 350) {
    stroke(102,102,118,99);
    line(i - 30, 350 +i, 60 + i, 50 + i);
  }
  
  if (i > 200) {
    noStroke();
    fill(156,140,157,33);
    ellipse(i/4,i/4,i,i);
  }


  
}




