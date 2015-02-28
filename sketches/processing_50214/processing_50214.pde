
float[] xCoord = new float[100]; 
float[] yCoord = new float[100];
float x,y;
float c,d;


void setup() { 
  size(400, 400); 
  for (int i = 0; i < 100; i++) { 
    xCoord[i] = random(width); 
    yCoord[i] = random(height);
    float x=0;
    float y=0;
    float c=0;
    float d=10;
    smooth();
  }
}
void draw() { 
  background(0); 
  stroke(255); 

  for (int i = 0; i < 100; i++) { 
    fill(c,c,c,d);
  ellipse(mouseX, yCoord[i], x,y);
  
  x = x + 1;
  y =y + 1;

   
  
    yCoord[i]++;
    if(x > height)x= 0 ;
    if(y > height)y= 0 ;
    if(yCoord[i]>height)yCoord[i]=0;

  }
}


