
int patternSeperationX = 400;
int patternSeperationY = 400;
void setup(){
size(400,400);
 
for(int i = 0; i < width/patternSeperationX; i++){
for(int j = 0; j < height/patternSeperationY; j++){
pushMatrix();
translate(i*patternSeperationX, j*patternSeperationY);
yourFunction();
popMatrix();
}
}
 
}
void draw()
{
 
}
void yourFunction(){
strokeWeight(1);
background(255);  
smooth(); fill(255); stroke(1); ellipse (200,35,20,20);
smooth(); fill(255); stroke(1); ellipse (210,35,20,20);
smooth(); fill(246,255,13); ellipse (200,100,90,140);
smooth(); fill(255); stroke(1); ellipse (170,100,40,40);
smooth(); fill(255); stroke(1); ellipse (200,100,40,40);
smooth(); fill(183,153,107); stroke(1); ellipse (185,145,50,50);
smooth(); fill(1); stroke(1); ellipse (187,90,8,8);
smooth(); fill(1); stroke(1); ellipse (157,90,8,8);
smooth(); fill(1); stroke(1); ellipse (170,150,10,10);
smooth(); fill(246,255,13); stroke(1); ellipse (240,110,20,20);
smooth(); fill(246,255,13); stroke(1); ellipse (240,110,10,10);
 smooth(); fill(246,255,13); stroke(1); ellipse (240,110,10,10);
 fill(246,255,13); noStroke(); ellipse (233,110,20,20);
 smooth(); fill(246,255,13); stroke(1); ellipse (195,120,45,15);
  smooth(); fill(246,255,13); stroke(1); ellipse (180,120,15,15);
fill(246,255,13); noStroke(); ellipse (190,120,30,16);
fill(246,255,13); noStroke(); ellipse (210,120,30,16);
smooth(); fill(255); stroke(1); ellipse (200,100,40,40);
smooth(); fill(1); stroke(1); ellipse (187,90,8,8);

}


