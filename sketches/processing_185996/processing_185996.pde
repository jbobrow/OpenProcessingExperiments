
//Properties
void setup() {
size(500,500);
frameRate(40);
smooth();
}


//Keeps Code Going
void draw(){
 
  //lines stack from coord 0 to 500
  //colors + stroke plus line size are random
  
  for (int i=0; i < 500; i=i+1) {
    
    //variable of lines
    float x= random(0,250);
    float y= random(250,500);
    
    //thickness of line is random 1-4
    strokeWeight(random(1,4));
    
     stroke(random(255),random(255),random(255));
     
    line (x , i , y , i);
    
  
  }
  
  
  //int (y) continues until y is bigger or equal to the height (500)
  for (int y=0; y <= height; y += 50) {
    for (int x = 0; x <= width; x += 50) {
      
      fill(255, 140, 0, 10);
      
      float value = 15;
      float m = map(value, 0, 100, 85, width);

      ellipse(x, m + y , 20 , m); 
    }
  }
  

 //******************************************************
  //Circle keeps growing with a no fill in the middle
  for (int i=0; i < 600; i=i+1) {
    
    
    noFill();
    
    //circle start in the middle
    ellipse(width/2 , height/2, 250 + i, 250 + i);
    
    
  }
  

  
  
  
  
  
  
 
}



