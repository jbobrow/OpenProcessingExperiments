
int x = 0;
int y = 20;
int circlecolour1 = 250;
int circlecolour2 = 0;
int circledimensions = 50;


void setup() {
  size(500,500);
  background (255, 255, 255);
  noStroke();
  }
  
  void draw(){
         smooth();



ellipse (380,380,circledimensions,circledimensions);    
      fill (0, 230, circlecolour2, 1);
      
      ellipse (200,50,circledimensions,circledimensions);    
      fill (0, 230, 230, 1);
     
     
      ellipse (50,350,circledimensions,circledimensions);    
      fill (0, 230, 230, 1);


      
   
      
      

  }

