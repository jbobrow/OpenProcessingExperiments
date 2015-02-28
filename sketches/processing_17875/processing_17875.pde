
size(250, 250);
background(#5BDB6A);
smooth ();
strokeWeight(0.5);
for(int b = 5; b < 150; b += 5) {
for(int a = 3; a < 250; a += 3){

line(b, 150, b, 200); 
line(20, a, 180, a);
}
} 
  noStroke();
  fill(#336B98, 50);
  for(int c=20; c < 250; c+=20){
    quad (c, 3, c+10,3,40,c,c, c);
}
  fill(#336B98, 150);
rectMode(CORNERS);
rect (170,170,210,210);


