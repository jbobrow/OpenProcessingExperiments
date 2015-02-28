
size(250,250);
background(#D3DDE3);
smooth();
strokeWeight(5);
stroke(#869CAA);
for(int ax = 1; ax <260; ax += 50){
  for(int ay = 4; ay <260; ay += 50){
    line(-10, -10, random(ax), random(ay));}
}

strokeWeight(1);
stroke(#103E5A);
for(int ax = 30; ax <260; ax += 50){
  for(int ay = 0; ay <260; ay += 50){
    line(-10, -10, random(ax), random(ay));}
}

strokeWeight(1);
stroke(255);
for(int ax = 0; ax <260; ax += 10){
  for(int ay = 1; ay <260; ay += 50){
    line(-20, -20, random(ax), random(ay));}
}

strokeWeight(1);
stroke(#2E83B7,70);
for(int ax = 0; ax <260; ax += 100){
  for(int ay = 1; ay <260; ay += 50){
    line(-20, -20, random(ax), random(ay));}
}                                   
