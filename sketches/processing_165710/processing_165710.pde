
Cir [] cir = new Cir[200];
float xoff = 0.0;
float[] xRay = new float [15];
float[] yRay = new float [15];
float[] xMov = new float [15];
float[] yMov = new float [15];
float xPoos, yPos;


void setup(  ) {
  background(0);
  noiseSeed(0);
  size(800, 800);
  frameRate(24);
  for (int j = 0; j < cir.length; j++) {  
    cir[j] = new Cir(
    random(20, width-20),random(20, width-20), 1
      );
  }
  for (int i = 0; i < 15; i++) {
    for(int j = 0; j < 15; j++) {
    xRay[i] = (width/15) * i  + ((width/15)/2);
    xPoos = xRay[i];
    yRay[j] = (height/15) * j + ((height/15)/2);
    yPos = yRay[j];
     
     
     
  }
  }
  
  
  
}

void draw() { 
  
  
  fill(0,0,0,5);
  rect(0,0,height,width);
   xoff = xoff + .01;
  //randomSeed(0);
for (int i=0; i < 100; i++) {
  float r = random(0, 255);

 // line(i, 0, i, 100);
}

//background(204);

  for (int i = 0; i < cir.length; i++) {  
    
    cir[i].makecir();
    cir[i].update(); 
    
  } 

}






class Cir { 
  float n = noise(xoff) * width;
    float speed; 
    float balPos;
    float xPos;
    float y;
    float x;
    float s;

    Cir (float y,float x, float s) { 
      balPos = y; 
      xPos = x;
      speed = s;
    } 
    
    void makecir(){
      
        for (int i = 0; i <15; i++) {
     for(int j = 0; j<15; j++){
    xMov[i] = random(-3, 3);
    yMov[j] = random(-3, 3);
     
    xPoos = xPoos + xMov[i];
    yPos = yPos + yMov[j];
    fill(random(xoff),random(230,255),random(230,255),random(25));
    rect(xPoos, yPos, random(5), random(5));
  }}
       float n = noise(xoff) * width;
      noStroke();
      //fill(noise(xoff),random(210,230),55,240);
      fill(random(230,255),220);
      ellipse(xPos,balPos,random(20),random(20));
       xoff = xoff + .01;
      
      
    }
    
    
    void update() { 
       
      balPos += random(-speed,speed); 
      if (balPos > height) { 
        balPos = 0;
      } 
       //xPos += random(-speed-(n/25),speed +(n/25));
      xPos += random(-speed-(n/25),speed +(n/25)); 
      if (balPos > width) { 
        speed *= -1;
      } 
      if (xPoos > height) { 
        xPoos = 0+1;
      } 
      if (yPos > height) { 
        yPos = 0+1;
      }
      if (xPoos < 0) { 
        xPoos = height-1;
      } 
      if (yPos < 0) { 
        yPos = width-1;
      }
      //line(0, balPos, width, balPos);
    }
  }

