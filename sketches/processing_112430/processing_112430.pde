
void setup(){
  size(500,500);
  rectMode(CENTER);
  
}
  void draw(){
    rect(width/2,height/2,100,100);
    rect(width/8,height/8,100,100);
    rect(7*width/8,7*height/8,100,100);
    rect(width/8,height/2,100,100);
    rect(width/2,height/8,100,100);
    rect(7*width/8,height/8,100,100);
    rect(7*width/8,height/2,100,100);
    rect(width/2,7*height/8,100,100);
    rect(width/8,7*height/8,100,100);

   if(mousePressed == true){
      fill(252,252,12);
    }else{
      fill(255);
      
rect(width/2,height/2,100,100);
  }
  }


