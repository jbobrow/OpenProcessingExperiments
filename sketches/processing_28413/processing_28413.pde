
int abstand = 35;

void setup(){
  size(500, 500);
}

void draw() {
  background(255);
  noStroke();
  fill(30,50);
  /////////////////////////////////////////////// 
  /*
  rect (0, 0, 30, 30);    
  rect (2.5, 2.5, 25, 25);  
  rect (5, 5, 20, 20);  
  rect (7.5, 7.5, 15, 15);  
  rect (10, 10, 10, 10);  
  rect (12.5, 12.5, 5, 5);    
  */
   for(int x=0; x <= width; x = x+abstand){
    for (int y=0; y <= height; y = y+abstand){
  rect (x, y, 30, 30);    
  rect (x+2.5, y+2.5, 25, 25);  
  rect (x+5, y+5, 20, 20);  
  rect (x+7.5, y+7.5, 15, 15);  
  rect (x+10, y+10, 10, 10);  
  rect (x+12.5, y+12.5, 5, 5); 
    }
  }
  
}

