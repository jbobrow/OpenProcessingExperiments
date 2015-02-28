
/*Based on Car
balanceandunity@hotmail.com 
June 2009*/


class Car {
  
  float x;
  float y;
  float speed = 1;
  float carSize = 1;

Car(){
};
  
void walk(){
    x = x + random (-speed, speed);
    y = y + random (-speed, speed); 
    
    fill(104, 128, 234);
    noStroke();
    ellipse(x,y,carSize, carSize);
  };
  
};

