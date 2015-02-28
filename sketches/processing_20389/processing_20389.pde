
int ticker = 0;
int xAxis = 0;
int yAxis = 0;

void setup () {
  size (1200, 1200);
  background (#00FFEC);
  ticker = (0);
 
}

void draw() {
  

  
  fill(#000000);
  stroke(#000000);
  ticker = ticker + 1;
  xAxis = xAxis + 100;
  strokeWeight (random(.1, 5));
  line (xAxis+random (0,10), yAxis+random (0,50), xAxis+random (20, 50), yAxis+random (20, 50));  // 10

  if (xAxis == 1000 )
  {
     yAxis = yAxis + 75  ;
     xAxis = 0 ;
  };
  
   if ( ticker == 100 )
   {    
     stop();
   };
 };

