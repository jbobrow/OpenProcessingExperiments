
class grunge {
  
  float x;              //declaring values for the x and y position of the ant
  float y;
  float speed = 1; 
  float grungeSize = 1;
  
  
  grunge() {                //constructor funtion, dows not need a "word" before the function name ie. void Name()

    
  };
  
  void walk() {          //void because nothing is expected to be returned
   
   
   //update the x and y values
   x = x + random(-speed,speed);
   y = y + random(-speed,speed);
   
   
   //draw the ant
    noStroke();
    fill(0,0,0,10);
    ellipse (x, y, grungeSize, grungeSize);
    
  };
  
  
  
  
};



