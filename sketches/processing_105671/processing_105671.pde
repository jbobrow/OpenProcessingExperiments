
int cols = 10;
int rows = 10;
color[][] colors;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  colors = new color[rows][cols];
  for(int i=0;i<rows;i++) {
    for(int j=0;j<cols;j++) {
      
      colors[i][j] = color( (5*i), (12*(i+j)), (25*j) );
      

      
    }
  }
}
void draw() {
  background(255);
{
  for(int i=1;i<rows;i++) {
    for(int j=1;j<cols;j++) {  
      fill(colors[i][j]);
      rect(i*(width/cols), j*(height/rows), 40, 40);
      
      if(mousePressed == true) 
       fill(random(250),random(100),random(100));

      rect(i*(width/cols), j*(height/rows), 40, 40);
     
     
  
  
   
}

      
    }
    
    }
      
  }
