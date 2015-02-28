
// Original Code from toxi
// http://toxi.co.uk/p5/remixed/hair/


//Press mouse to zoom out

int xSize = 255;
int ySize = 255;
float noiseScale = 0.005;
float noiseCount = 0.0;
float noiseSpeed = 0.005;
int noiseRes = 2;
public color c = 0;
float xCount, xSpeed;
float yCount, ySpeed;
float theta;
float angle;
float angleDelta;
float xv, yv;
float speed = 10;

boolean lines = true;
float noiseVal;
  void setup(){
    loadPixels();
  size(xSize,ySize,P2D);
smooth();

  colorMode(HSB, 360);
  }
  void draw() {
background(0);
      if (mousePressed){
    noiseDetail(2, .5f);
    noiseScale -= (noiseScale - 0.019) * .2;
  } else {
    noiseDetail(2, .5f);
    noiseScale -= (noiseScale - 0.005) * .2;
  }
  
  
  for(int y=0; y<height; y++) {
    for(int x=0; x<width; x++) {
     
      if (x%noiseRes == 0 && y%noiseRes == 0){
        noiseVal=noise((x - xCount)*noiseScale, (y - yCount)*noiseScale, noiseCount);
        float g = noiseVal*800.0f;
        theta = (-(g * PI))/180.0f;
        xv = cos(theta) * speed;
        yv = sin(theta) * speed;

        if (lines){
       // 
         c= color(g - 180, 360, 360, 20);             
   
       stroke(c);
       fill(c);          
        line (x - (xv*3), y - (yv*2), x, y);
        //  pixels[x+width*y]=color(g);
        }
       }
    }
  }

    
     noiseCount += noiseSpeed; 
    
  }

