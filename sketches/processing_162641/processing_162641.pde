
  int playArea = 500;
  void setup(){
  size(playArea, playArea);
  background(255);  //set background white
  frameRate(200);
  }
    
  void draw(){
  int rectSize= 10;
  
  
      for (int i=0;i<=playArea;i=i+rectSize){
              for (int j=0;j<=playArea;j=j+rectSize){
                  //rectangle here
                  fill(random(255),random(255),random(255))
                  rect(i,j, rectSize, rectSize)
              } 
              
              
      }  
      
      
    }
    
  
  
  
