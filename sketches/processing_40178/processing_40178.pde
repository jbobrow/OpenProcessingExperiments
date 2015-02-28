
//Homework 6.2
//Tommy Coggin
//code taken from Nick Senske's imgSpeed code

//sets the number of dots
int dots=10000;

//sets up arrays
float[] x= new float[dots];
float[] y= new float[dots];
float[] m= new float[dots];
float[] n= new float[dots];
PImage img;

void setup(){
  size(300,300);
  img = loadImage ("8ball.gif");
  
  //seeds arrays
  for (int i=0; i<dots; i++){
    x[i]= random(100,200);
    y[i]= random(height);
  }
  
  //seeds arrays
  for (int j=0; j<dots; j++){
    m[j]= random (width);
    n[j]= random (100,200);
  }
  
  //sets color of dots
  stroke(255);
}

void draw(){
  background (0);
  
  //sets up how dots will be affected by 8 ball image
  for (int i=0; i<dots; i++){
    color c = img.get(int(x[i]), int(y[i]));  
    float b = brightness(c) / 255.0;        
    float speed = pow(b,2) + 0.05;           
    y[i] += speed; 
    
    //sets the reset and directionallity of dots
    if (y[i] > height) {                      
      x[i] = random(100,200);                               
      y[i] = random(height);                  
    }
    
    point(x[i], y[i]);
  }
  
  //sets up how dots will be affected by 8 ball image
  for (int j=0; j<dots; j++){
    color c = img.get(int(m[j]), int(n[j]));  
    float b = brightness(c) / 255.0;        
    float speed = pow(b,2) + 0.05;           
    m[j] += speed; 
    
    //sets the reset and directionallity of dots
    if (m[j] > width) {                      
      m[j] = 0;                               
      n[j] = random(100,200);                  
    }
    
    point(m[j], n[j]);
  }
}


