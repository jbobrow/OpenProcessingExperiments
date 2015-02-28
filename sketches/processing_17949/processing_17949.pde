
size(250,250);
smooth();
background(0);

stroke(#00FFFF);
strokeWeight(2);
for(int b = -55; b <180; b += 20){
  line(b,250+b,250,0);
}
stroke(#FF5E00);
strokeWeight(1);
for(int a = -65; a <180; a += 20){
  line(a,250+a,250,0);
}

