
float x,y,angle;

void setup(){
  size (800,800);
  x=0;
  y=0;
  angle=0;
  smooth();
}

void draw(){
  background (0);
  float glowlight = sin(radians(angle));
  float glow2 = cos (radians(angle));
  float glow3 = tan (radians(angle));


  //take the old range of my old variable )of -1 to 1) and make it 0 to 255
  glowlight = map(glowlight,-1,1,0,255);
  glow2 = map(glow2,-1,1,0,255);
  glow3 = map(glow3, -1, 1, 0,255);
  angle++;
  
  noStroke();
  fill (200, glow2, 100);
  ellipse (width/2, height/2, glowlight,glowlight);
  
  noStroke();
  fill (40, glow2, 100);
  ellipse (70, glow2, 130, 130);
  
  noStroke();
  fill (glowlight, glow3, 100);
  ellipse (glowlight, glow2, glow2,glow2);
  
  
  noStroke();
  fill (glowlight, glow2, 50);
  ellipse (glowlight, 650, 300,300);
  
  noStroke();
  fill (50, 20, glow3);
  ellipse (650, 350,glow3,glow3);
  
  
  noStroke();
  fill (glowlight, 200, 200);  
  ellipse (width/4, glow3, 200,200);
 
  
  noStroke();
  fill (100, 255, glow3);
  ellipse (700, glowlight, glowlight,glowlight);
  
  noStroke();
  fill (50, 200, glow3);
  ellipse (700, 100, 80,80);
 
  noStroke();
  fill (10, 255, glowlight);
  ellipse (width/6, glow2, 125,125);
  
  noStroke();
  fill (300, 200, glow3);
  ellipse (450, 300, 100,100);
  
  noStroke();
  fill (100, 0, glow2);
  ellipse (100, 500, glow2,glow2);
  
  noStroke();
  fill (glowlight, glow2, glow3);
  ellipse (600, glowlight, 50,50);
   
  noStroke();
  fill (glowlight, 20, glow3);
  ellipse (700, 650, glowlight,glowlight);
  
  noStroke();
  fill (100, glowlight, glow3);
  ellipse (50, glow2, glow3,glow3);
  
  noStroke();
  fill (45, glowlight, glow3);
  ellipse (glow3, 500, 35,35);
  
}

