
size(500,500);  
background(0);  
stroke(255,0,0);  
noFill(); 

for (float i = 1.0; i < width; i *= 1.1) {
 rect(0,i,i,i*2);
}

for (float i = 1.0; i < height; i *= 1.1) {
 rect(0,i,i,i*2);
}
