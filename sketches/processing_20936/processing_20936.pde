
  //1337399
  
  
  
  // trippy purple-y stuff
  
  int counter = 0;
  
  void setup(){
    
   size(1024, 960);
   background(0);
    
  }
  
  void draw(){
   
   
    background(0);
    fill(109280219);
    
    for(int i = 0; i < width - 39; i+= 10){
      for(int j = 0; j < height - 39; j+= 10){
        
     
      arc(i + 20, j + 20, 50, 50, 0, TWO_PI);
      counter++;
     
      } 
    }
    
     for(int i = 70; i < width - 49; i+= 10){
      for(int j = 70; j < height - 49; j+= 10){
        
  
      arc(i - 10, j - 10, 50, 50, 0, TWO_PI);
      counter++;
      
        } 
      }
    
    println("number of arcs..." + counter);
    
  //  for(int k = 0 ; k < counter ; k++){      //loops forevah! apparently ( ; ; ) refuses to work
  //  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  //  textSize(30);
  //  text(counter, 360, 450);
  //  
  //  }
    
  }
    

