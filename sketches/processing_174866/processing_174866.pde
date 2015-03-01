
int[] x = new int[230]; 
int[] y = new int[230];

  

boolean runToySnake = true;


void setup() {
  size(800,700);
  
  smooth();
  //set up arrays
  for (int i = 0; i < x.length; i ++ ) {
    x[i] = 0; 
    y[i] = 0;
  }
}

void draw() {
  //set up pause/play toggle boolean
  if(runToySnake){
    toySnake();
  }
  
  
  //shift array values down
  for (int i = 0; i < x.length-1; i ++ ) {
    x[i] = x[i+1]; 
    y[i] = y[i+1];
    
  }
  
  //update location
  x[x.length-1] = mouseX; 
  y[y.length-1] = mouseY; 
  
    
  
}

//set up pause/play toggle function
void mousePressed() {
  if(runToySnake == true){
     runToySnake = false; 
     
  }
  else{
    runToySnake = true;   
  }
  
}

void toySnake(){
background(255);  
//draw snake
for (int i = 0; i < x.length; i ++ ) {
    noStroke();
    fill(255-i*500);
    if (key == 'a' || key == 'a'){
         fill(255-i*700);}
    //set up 'animate snake w. stroke'
    if (key == 's' || key == 's'){
         fill(255-i*700);
       stroke(255);}
    //set up 'animate dark-colored snake w. stroke
    if (key == 'd' || key == 'd'){  
        fill(255-i*1);
        stroke(255-i*700);
          
        }
    ellipse(x[i],y[i],i,i);
    //set up 'animate snake
    
    
    
  }
  
 
  
}


