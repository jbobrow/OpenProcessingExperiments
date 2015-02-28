
//Kim Sipkens
//Wed. Class
//PS1 Question 4
// 8x8 Grid 

int NumBars = 35;
int cols, rows;

void setup() {
  size(280,280); 
  cols = width/NumBars;  
  rows = height/NumBars; 
}

void draw() {
  
  
  for (int i = 0; i < cols; i++) {  
   
    for (int z = 0; z < rows; z++) { 
      
     
      int x = i*NumBars;
      int y = z*NumBars; 
     
      stroke(0);
     
      rect(x,y,NumBars,NumBars); 
      

      
    }
  }
}


                
                
