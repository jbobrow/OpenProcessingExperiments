
size (500, 500);
smooth();
background (255);

strokeWeight(1);
for (int x=10; x<500; x=x+60) {
  for (int y=10; y<500; y=y+60) {
    
    stroke(255, 46, 23);
    strokeWeight(4);
    fill(255,163,23);
    ellipse(x-10, y-10, 60, 60);
    
    stroke(23, 90, 255);
    strokeWeight(2);
    noFill();
    ellipse(x, y, 90, 90);
    
     fill(0);
    noStroke();
    ellipse(x+5,y+5, 40,40);
    
  
    stroke(23, 90, 255);
    strokeWeight(4);
    noFill();
    ellipse(x, y, 100, 100);
    
   
   
    
   

  }
}



