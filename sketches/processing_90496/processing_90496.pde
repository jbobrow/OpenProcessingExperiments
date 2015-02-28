
int n = 100; 
float y = .015; 
float dy = .15;  
                  
float noiseY;     
int x;            
float noiseX;
  
void setup(){  
    size(500, 200);
    colorMode(HSB, 360, 100, 100);
    background(6, 35, 99);
    frameRate(10);
    fill(0);
    text("Click mouse to refresh screen", 0, 195);
}
 
void draw(){
    perlin(int(random(width)));
    if(mousePressed){
      background(6, 35, 99);
    }else{
    }
}
   
void perlin(int i) {   // This cycles through the loop n times
  i++;
  stroke(126, 100, random(40, 60));
  strokeWeight(random(0, 4));
  noFill();
  y += dy;  
  x = i * (width/n);  
  noiseY = noise(y)*height;    
  noiseX = noise(x)*width;                             
  ellipse(x, random(height), noiseX, noiseY); 
}
