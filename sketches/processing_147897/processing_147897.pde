
//generative art, 3 objects, relational but random color fade

//import processing.pdf.*;

float i;
float r = 25;
float g = 125;
float b = 255;
float x = 450;
float y = 450;

float j;
float k;
float noiseK;

void setup(){
size (900,900);

smooth();
frameRate(24);
background(50);
//beginRecord( PDF, "Concentric9.pdf");
}

void draw() {
  
    fill(25,2);
  rectMode(CENTER);
  rect(width/2, height/2, width+20, height + 20);
  
  noFill();
  x = mouseX;
y = mouseY;
  for(i = 10; i<width*.75; i = i + 10) {
    strokeWeight( i/500);
    r = r + random(-1,1);
    g = g + random(-2,2);
    b = b + random(-3,3);

     k += .02;
    j = i * (width/100);
    noiseK = noise(k) * j/5;
    
      if(r>255) {
    r=r/3;  
    }

if(r<25) {
 r = r*2; 
}
    
    if(g>255) {
    g=g/3;  
    }

if(g<25) {
 g = g*2; 
}

    if(b>255) {
    b=b/3;  
    }
    
    if(b<25) {
     b = b*2; 
    }
    
    stroke(r,b,g);
    ellipse(x,y, x+200-i, y+200-i);
    
    stroke(r,g,b,125);
    ellipse(y,x, y+100-i, x+150-i);

    stroke(g,r,b,75);
    rectMode(CENTER);
    rect((y/2)+250,(x/2)+250, (y-120)-noiseK, (x-120)-noiseK);

  }

}

void mousePressed() {

  noLoop();

}

void keyPressed(){
 loop(); 
}

