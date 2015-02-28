
class Ear {
  
  
  float x,y; //starting point of the curve shape
  color cEar; //color of the ear
  
  Ear (float xEar_, float yEar_){
  x= xEar_;
  y= yEar_;
  
  }
  
  
  void ear(){
    
   noStroke();
   fill(0);
   
   ellipse(x,y,60,60); 
  
  }
}

