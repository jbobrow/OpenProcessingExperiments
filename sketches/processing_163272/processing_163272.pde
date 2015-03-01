
size(400,400);
smooth();
noStroke();
background(0,0,0);
 
 
for(int y=20; y<=height; y+=15) {
  for(int x=20; x<=width; y+=15) {
    fill(200,170,250,1);
    stroke(1);
    strokeWeight(0);
    ellipse(x*1.5,y*1.1,x*1.1,y*1.1);
  }
}


