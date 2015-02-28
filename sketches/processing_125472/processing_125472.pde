
size(450, 450);
background(255);

fill(0);

int y = 920;
ellipse(0, 0, y, y);

for (int x=0; x<255; x=x+30){
fill(x);
ellipse(0, 0, y=y-6, y=y-6);
}


pushMatrix();
strokeWeight(1);

for( int k=1; k<20; k++) {
  for(int i=0; i<15; i++) {
    for(int j=380; j>0; j=j-30) { 
   
rotate(radians(i*0.1));
  noFill();
  stroke(1);
rect(j, 0, k*0.5, k*0.5); 
  stroke(1); 
  fill(150);
ellipse(j+15, 0, k*0.8, k*0.8);
   }
  }
}
popMatrix();

fill(0);
rect(212, 80, 4, 65);
noStroke();
rect(205, 75, 20, 60, 10);
translate(-130, 300);


rotate(radians(-35));
rect(10, 10, 400, 30, 7);
