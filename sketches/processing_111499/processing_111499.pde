
PImage BG;
PImage Hell;
float time = 0.0;
float increment = 0.3;

void setup(){
  size (455,761);
  
  BG = requestImage("SS1.png");
  Hell = requestImage("Hell.png");
  
  frameRate(80);
  smooth();
  strokeWeight(5);

    if (BG.width > 0)
  {
    image(BG,0,0,width,height);
  }
  
  
  if (Hell.width > 0)
  {
    image(Hell,0,0,width,height);
  }
  
 
 
  
}


void draw(){
  
BG.filter(THRESHOLD, 0.55);
  Hell.filter(POSTERIZE, 10);
  println(mouseX +"," + mouseY);
  image(BG,0,0,width,height);
  blend(Hell, 0,0,455,761,0,0,455,761,ADD);
   float n = noise(time)*width;
   time += increment;
noFill();
stroke(255,random(255),0);
ellipse(250,150,n,n);

stroke(random(255),0,random(255));

float a = 0;
  float b = 0;
 

  while (a < 500)
  {
    a += random(-10,20);
    b += random(-10, 20);
    line(a, b, a, b);
    
  }
   
     stroke(0);
    
  for(int x = 0; x < width; x+= 120)
  {
    line(x, 0, x, height);
  }
    
  for(int y = 0; y < height; y += 120)
  {
    line(0, y, height, y);
  }
    

   
  
}

void mousePressed()
{
  loop();
}
 
void mouseReleased()
{
  noLoop();
}


//referenced
//http://www.learningprocessing.com/examples/chapter-13/example-13-4-perlin-noise/
 



