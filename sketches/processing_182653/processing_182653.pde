
//into the darkside

size(400,400);
background(0,0,0);
for(int a=0;a<400;a=a+50){
  for(int b=0;b<800;b=b+50){
   noStroke();
  fill(255,200,a); 
  float c=random(400);
  triangle(c,c,0,0,c,c);
  }
}
    
for(int x=0;x<410;x=x+50){
  for(int y=0;y<460;y=y+50){
    float z=random(400);
    
    stroke(z,z,z,25);
   strokeWeight(20);
   strokeCap(SQUARE);line(y,z,y,x);
    line(z,y,x,y);
  }
}


