
float fps = 10;
  
void setup(){
size(250,250);
background(255);
smooth();
frameRate(fps);
}
  
void draw(){
// random white opaque beziers to add softness/fluffiness
noFill();
stroke(255,255,255,50);
bezier (random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));

// random multicoloured transparent circles  
fill(random(255),random(255),random(255),50);
noStroke();
pushMatrix();
translate(125,125);
rotate(frameCount/5f);
ellipse(random(width),random(height),100,100);
popMatrix();

// more random white opaque beziers to add softness/fluffiness
noFill();
stroke(255,255,255,50);
bezier (random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
}

// reset background  
void keyPressed(){
  if(key==' '){
background(255);
    }
}

