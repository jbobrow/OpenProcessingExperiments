
//global variables 


float radius = 50.0; 


int X, Y; //ellipse 


int nX, nY; //ellipse 


int delay = 9; //delay effect 


int num = 60; 


float mx[] = new float[num]; 


float my[] = new float [num]; 


int r, g, b; //colors for background 


  


  


// setup the processing canvas 


void setup() { 


  size(400, 400); 


  strokeWeight(1); 


  frameRate(35);  


  X = width/2; 


  Y = height/2; 


  nX = X;  


  nY = Y; 


  r = 0; 


  g = 0; 


  b = 0; 


  


  


    


} 


  


//main draw loop  


void draw () { 


    


  radius = radius + sin( frameCount /4); 


  //track cricle to new destination 


  X+=(nX-X)/delay; //delay effect 


  Y+=(nY-Y)/delay; //delay effect 


    


  background(0); //color 


  fill(r, g, b); //color 


  stroke(255); 


  ellipse(X, Y, radius, radius); //shape
  ellipse(Y, X, 5, 5 );
  fill(100, 0, 0);
  ellipse(Y, X, radius, radius);
  fill(100, 0, 0);
 
  ellipse(Y, X, 25, 25);
  ellipse(X,Y, radius, 25);
  ellipse(Y, X, radius, 25);


  for(int i =1; i<num; i++) { 


    mx[i-1] = mx[i]; 


    my[i-1] = my[i]; 


  } 


    


  mx[num-1] = mouseX; 


  my[num-1] = mouseY; 


    


  //for(int i=0; i<num; i++) { 


    //ellipse(mx[i], my[i], i/2, i/2); 


  } 


 



  


  


void mouseMoved() { 


  nX = mouseX; // interactive  


  nY = mouseY; 


}  
