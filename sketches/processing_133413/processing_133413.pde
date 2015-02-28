
void setup(){
 
 size(800,300);
 frameRate(1);

}

void draw(){
  background(20, 44, 50);
  fill(255, 223, 114, 5);
  stroke(245, 213, 104, 5);
  
  
  
  int flight = 0;
 while (flight < 50){
   flight = flight + 10;
 
   
  for( int loong = 30; loong < 750; loong = loong + 50){
    quad( 15, 150 + flight, 35, 170 + flight, loong + 30, 150 + flight, 35, 130 + flight);
    
      int looong = loong - 20;
    fill(255, 223, 114, 4);
  stroke(245, 213, 104, 4);
      int fliight = flight/5;
    quad( 615, 50 + fliight, 625, 55 + fliight, looong + 630, 50 + fliight, 625, 45 + fliight);
    
      int loooong = (loong * 2) + 700;
    quad( 700, 270 + flight, 735, 320 + flight, loooong  + 30, 270 + flight, 735, 220 + flight);
          
      }
  
   }
  
}
