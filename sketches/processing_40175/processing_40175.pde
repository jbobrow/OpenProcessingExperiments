
int num= 50000; //sets the set number of controlled variables
//set  x and y coordinates
float[] x = new float[num];
float[] y = new float[num];

PImage img;

void setup(){
  size(453,562);
  img= loadImage("optical illusion.jpg"); //set picture info
  
  for(int i=0; i<num; i++){
    x[i]=random(width); //set array for random x coordinate 
    y[i]=random(height); //set array for random y coordinate
  }
  
  stroke(0);
}

void draw(){
  background (255);
  for (int i =0; i<num; i++){ 
    color a= img.get(int(x[i]),int(y[i])); //differentiating between color due to the array
    float b= brightness(a)/255; //to determine brightness of c and breaks it down into a fraction from 0-1
    float speed= pow(-b,2) + .05; //let speed equal the negative value of x+designated speed which then determines the new x position
    x[i] +=speed; //moves the points
    
    if(x[i] > width){ // if the partical is greater than the width
      x[i]=0; // then the x array is 0
      y[i]= random(height); // then the y array determines random height
    }

    point(x[i],y[i]); //designates where the point is on the screen based on color, brightness, and placement
  }
}
  

