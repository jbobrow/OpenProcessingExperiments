
size(1000, 1000);
//strokeWeight(2);
noStroke();
fill(153, 95, 137);


int x=180;
for (int y=0; y<800; y+=50) {
  fill(y*2,y/2,x);
  
  beginShape();
  vertex(x, y);
  vertex(x+100, y+100);
  vertex(x+80, y+120);
  vertex(x, y+40);
  vertex(x-80, y+120); 
  vertex(x-100, y+100);
  vertex(x, y);
  endShape();
  
  
}

x=340;

for (int y=0; y<800; y+=50) {
  fill(y*2,y/2,180);
  
  beginShape();
  vertex(x, y);
  vertex(x+100, y+100);
  vertex(x+80, y+120);
  vertex(x, y+40);
  vertex(x-80, y+120); 
  vertex(x-100, y+100);
  vertex(x, y);

  endShape();
}

x=500; 

for (int y=0; y<800; y+=50) {
  fill(y*2,y/2,180);
  
  beginShape();
  vertex(x, y);
  vertex(x+100, y+100);
  vertex(x+80, y+120);
  vertex(x, y+40);
  vertex(x-80, y+120); 
  vertex(x-100, y+100);
  vertex(x, y);

  endShape();
}


x=660; 

for (int y=0; y<800; y+=50) {
  fill(y*2,y/2,180);
  
  beginShape();
  vertex(x, y);
  vertex(x+100, y+100);
  vertex(x+80, y+120);
  vertex(x, y+40);
  vertex(x-80, y+120); 
  vertex(x-100, y+100);
  vertex(x, y);

  endShape();
}

x=820; 

for (int y=0; y<800; y+=50) {
  fill(y*2,y/2,180);
  
  beginShape();
  vertex(x, y);
  vertex(x+100, y+100);
  vertex(x+80, y+120);
  vertex(x, y+40);
  vertex(x-80, y+120); 
  vertex(x-100, y+100);
  vertex(x, y);

  endShape();
}


