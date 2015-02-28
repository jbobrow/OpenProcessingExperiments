

void setup(){
  size(800, 420);
  background(255);
  
}

void draw(){
  
 for(int i=30; i<400; i=i + 30){
  strokeWeight(8);
  line(0, i, width, i);
}
  
  for(int x=0; x<840; x= x + 40){
    for(int y=20; y<400; y= y+60){
     
      fill(0);
      rect(x, y, 3, 20);
      
    }
  }

 for(int x=20; x<840; x= x + 40){
    for(int y=20; y<400; y= y+60){
     
      fill(0);
      rect(x, y, 3, 20);
      
    }
  }
  
}

