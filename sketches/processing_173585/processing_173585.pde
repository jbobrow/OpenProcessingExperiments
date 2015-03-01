
size(500,500);
background(255);
noStroke();

for(int i=0; i<height; i+=40) {
  
  
  fill(#32D8B6,50);
  rect(0,i, width, 20);
  fill(#FF0ABA,30);
  rect(i,0,20,height);

}


stroke(255);
strokeWeight(3);
triangle (250,50,450,450,50,450);
fill(#32D8B6,50);
triangle(150,250,350,250,250,450);
