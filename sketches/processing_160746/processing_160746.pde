
size(330,330);
for (int p = 15; p < 300; p += 5) {
  if (p < 150){
    line (p,p * 1.5,p,p * 2);
  } else {
    strokeWeight(3);
     line (p-100,p,p*1.5,p/2);
  } 
}



