
size(250, 250);
background(0);
smooth();

noStroke();
fill(#95BF19,180);

for(int y = 5; y < 280; y += 40) {
  for(int x = 5; x < 280; x += 40) {
    ellipse(x, y, 50, 50);}
}
noFill(); 
stroke(255,120);
for (int i=45;i<250; i+=20) {
  for(int m=5; m<80; m+= 20){
rect(i,m,m,i,i+40,m+40,i,i+40);}
}




