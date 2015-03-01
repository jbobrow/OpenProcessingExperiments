

void setup() {
size(600,600);
noStroke();
background(255);
}



void draw() { 
if (keyPressed) { 
if ((key == 'r') ||(key == 'R')) { 
fill(255, 0, 0, 128); 
ellipse(pmouseX, pmouseY, 9, 9);
} 

if ((key =='b') || (key == 'B')) { 
fill(0, 0, 255, 128); 
ellipse(pmouseX, pmouseY, 9, 9);
} 

if ((key =='g') || (key == 'G')) { 
fill(0, 255, 0, 128); 
ellipse(pmouseX, pmouseY, 9, 9);
}

if ((key =='c') || (key == 'C')) {
  background(255);
}
 
if ((key =='1')) { 
float x = random(256);
float y = random(256);
float z = random(256); 
stroke(x,y,z); 
noFill();
rect(mouseX, mouseY, pmouseX,pmouseY); 
}

if ((key =='2')) { 
float x = random(255);
float y = random(255);
float z = random(255); 
stroke(x,y,z); 
noFill();
line(mouseX, mouseY, pmouseX, pmouseY); 
}


if ((key =='9') || (key == '9')) {
  background(0); 
} 


}
}


