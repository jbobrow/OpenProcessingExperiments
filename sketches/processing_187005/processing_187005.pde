
// Andrea Pagan, pattern sketch


void setup(){
 size(640,480);
  background(255,255,0);
   
}
 
void draw(){
         for( int i = 1; i < width/20; i = i + 2){
  for(int j = 1; j < height/20; j = j + 2){

    fill(0);
    ellipse(i*50, j*50, 600, 50);
    ellipse(i*50, j*50, 50, 400);
  }
  }


  for( int i = 4; i < width/50; i = i + 2){
  for(int j = 2; j < height/50; j = j + 2){
    
    fill(255,0,0);
    ellipse(i*40, j*50, 50, 50);
    
  }
  }
    for( int i = 5; i < width/50; i = i + 2){
  for(int j = 1; j < height/50; j = j + 2){
    
    fill(0,255,0);
    ellipse(i*40, j*50, 40, 50);
    
  }
  }
  
     for( int i = 4; i < width/50; i = i + 2){
  for(int j = 1; j < height/50; j = j + 2){
    noStroke();
    fill(0,0,255);
    ellipse(i*40, j*50, 30, 50);
    
  }
  }
 
}
