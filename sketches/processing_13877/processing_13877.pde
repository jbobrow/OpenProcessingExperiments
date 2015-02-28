


void setup() { 
size(600, 600); 
frameRate(300); 
 
} 

void draw() { 
  stroke (234,9,9);
float distance = dist(pmouseX, pmouseY, mouseY, mouseX); 
float maxStroke = 0; 
strokeWeight(maxStroke - constrain(distance, 0, maxStroke)); 
fill (234,9,9);  
if (mousePressed) { 
stroke (240,103,24);
  fill(240,103,24);

} else { 

} 
ellipse(mouseX, mouseY, 80, 80); 
if (keyPressed) { 
  stroke (240,233,24);
 fill(240,233,24);
ellipse (mouseX, mouseY, 80,80); 
} 

}


