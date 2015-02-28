
float fps=6;
float sw=0; // strokeWeight control
  
void setup(){
size(250,250);
frameRate(fps);
}
  
void draw(){
background(255);

// loop for line movement and changing strokeWeight  
for(int a=0; a<250; a+=15)
 for(int b=0; b<250; b+=15)
 {
 strokeWeight(sw);
 stroke(0);
 line(a,b,a+random(width),b+random(height));
 strokeWeight(1);
 stroke(75,75,75);
 line(a,b,a-random(width),b+random(height));
}

// condition for sw - rotate between 2 and 1 weight  
if (sw>2){
sw=1;
}
  sw++;
}

