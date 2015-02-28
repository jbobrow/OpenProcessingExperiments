
void setup () {
size(600,600);
background(59,227,234); 
stroke(255,0,0);
noFill();



for (float i = 1.0; i< width; i *= 1.1){
  rect (0, i, i, i*500);
}  
}


