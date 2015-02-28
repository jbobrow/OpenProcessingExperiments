
size (500, 500);
background(57,188,237,100);
noStroke();


for (int i=0; i<width; i=i+90){
  for (int j = 0; j < height; j = j+90) {
 fill( int(random(235)), int(random(255)), int(random(255)));
    beginShape(TRIANGLES);
      vertex(i, j);
      vertex(100, 400);
      vertex(j, i);  
    endShape();
 }}


