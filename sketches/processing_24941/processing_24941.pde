
//use in architecture as a light diagram, people move faster through areas with more light
int num = 4;                               //Number of people moving through the space at one time
float [] x = new float [num];
float[]y = new float [num];
PImage img;                                //floor plan

void setup(){ 
  size(400,326);
  img = loadImage("house.jpg");
  background(img);
  stroke(0,50);
  frameRate(10);
  
  
  for(int i = 0; i < num; i++){ 
    // limiting the occupied area
    x[i] = random(115,width); 
    y[i] = random(80,height);
  }
}

void draw(){
  for (int i = 0; i < num; i++){
    //set up of the color variables, brightness variable, and speed
    color c = img.get(int(x[i]), int(y[i]));
    float b = brightness(c) / 255.0+.05;   //brightness extracted from img      
    float speed = pow(b,2.5);              //move 2.5x faster in areas of greater brightness
    x[i] += speed*7;
    y[i] += speed*7;
    
    //reset occupant location (representation of a new occupant)
    if (y[i] > height-75) {                
      y[i] = 0;                              
      y[i] = random(height);                 
    }

    if (x[i] > 300) {                      
      x[i] = 0;                              
      x[i] = random(width);                 
    }
//set steps and their distance    
float aa = x[i]+random(-15,15); 
float bb = y[i]+random(-15,15);

fill(c,90);                                //set occupant fill to img color at that location
ellipse(aa,bb,15,15);                      //create occupant
  }
}


