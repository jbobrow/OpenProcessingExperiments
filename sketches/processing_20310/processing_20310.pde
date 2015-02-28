
//set global variables
float r = 150;
float g = 0;
float b = 0;
boolean button = false;


void setup () {
  size (500, 500);
}


void draw () {
  background (r, g, b);
  

if (!button) {
  fill(0);
  stroke(255);
  rect(width/2, height/2, width/2, height/2);
  stroke (0);
  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);
}
else {
  fill(255);
  stroke(0);
  rect(width/2, height/2, width/2, height/2);
  stroke (255);
  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);
}

//upper right
if (mouseX > width/2 && mouseY < height/2) {
r +=1;
g -=1;
b -=1;
}

//upper left
else if (mouseX < width/2 && mouseY < height/2) {
g +=1;
r -=1;
b -=1;
}

//lower left
else if (mouseX < width/2 && mouseY > height/2) {
g -=1;
b +=1;
r -=1;
}

//lower right
else if (mouseX > width/2 && mouseY > height/2 && mousePressed && !button) {
r = 0; 
b = 0;
g = 0;
button = !button;
  
}  

else if (mouseX > width/2 && mouseY > height/2 && mousePressed && button) {
r = 255; 
b = 255;
g = 255;
button = !button;
  
} 



//keep r from being greater than 255
if (r>255) {
r =255;
}


//keep r positive
else if (r<0) {
r=0;
}




//keep g from being greater than 255
if (g>255) {
g =255;
}
//keep g positive
else if (g<0) {
g=0;
}

//keep b from being greater than 255
if (b>255) {
b =255;
}
//keep g positive
else if (b<0) {
b=0;
}




}
                
                
