
//setupstuff

size(500,500);
smooth();
noStroke();
background(0,0,0);


//graphics
 
 
 for(int y=15; y<=height; y+=35) {
  for(int x=15; x<=width; x+=25) {
    
    stroke(1);
    strokeWeight(0.15);
    fill(200,170,250,1);
    ellipse(x*0.75,y*0.65,x,y);
    
  }
}

// Credit Daniel White's Triangle Pattern (http://www.openprocessing.org/sketch/93094) 
