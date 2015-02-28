
size(600, 600);
background(50,0,200);

strokeWeight(2);
stroke(255,0,0);
for (int i=0; i<=700; i+=40) {
  line (0,i,600,i);
}
strokeWeight (10); 
stroke(0,0,255);
for (int i=0; i<=600; i+=30) {
  line (i,0,i,600);
}
 
strokeWeight (1); 
stroke(250,0,50);
for (int i=0; i<=300; i+=60) {
  line (20,0,i,600);
}

strokeWeight (1); 
stroke(250,0,50);
for (int i=0; i<=300; i+=60) {
  line (i,0,20,600);
}

