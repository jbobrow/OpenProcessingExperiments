
 int x;
 int y;

 int pixelSize=2;
 PGraphics pg;
 PImage bg;


void setup(){
  size(775,775);
  frameRate(10);
  noStroke();
   pg = createGraphics(160, 90, P2D);
  colorMode(HSB);
  noSmooth();
  
}

 void draw(){
 
  float  xc = 25;

  int timeDisplacement = frameCount;

  float calculation1 = sin( radians(timeDisplacement * 0.61655617));
  float calculation2 = sin( radians(timeDisplacement * -3.6352262));

  pg.beginDraw();
  pg.loadPixels();

  for (int x = 0; x < pg.width; x++, xc += pixelSize)
  {
    float  yc    = 25;
    float s1 = 128 + 128 * sin(radians(xc) * calculation1 );

    for (int y = 0; y < pg.height; y++, yc += pixelSize)
    {
      float s2 = 128 + 128 * sin(radians(yc) * calculation2 );
      float s3 = 128 + 128 * sin(radians((xc + yc + timeDisplacement * 5) / 2));  
      float s  = (s1+ s2 + s3) / 3;
      pg.pixels[x+y*pg.width] = color(s, 255 - s / 2.0, 255);
    }
  }   
  pg.updatePixels();
  pg.endDraw();

  // display the results
  image(pg,0,0,width,height); 

  
  
  
  y=0;
  x=0;

  while (y < 800){
    x=0;
    
    while (x < 800) {
      smooth();
      fill(255, random(25) );
      ellipse(x,y,40,40);
      fill(random(180+255),random(180+255),random(180+255), random(25) );
      ellipse(x,y,40,40);
      
      x=x+5;
     
    }
    
   
    

    y=y+25;
    x=x+25;

  }

}


 void keyPressed() {
  bg = loadImage("rofl.jpg");
}

