
size(500,500); 
background(255); 
smooth();

float w = width; 

while (w > 0) { 
  stroke(0); 
  fill(w); 
  ellipse(width/2,height/2,w,w); 
  w = w - 20; 
}
