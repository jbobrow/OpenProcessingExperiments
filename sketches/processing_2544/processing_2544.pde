
class snow{ 
  
  float x, y;
  snow(){ 
    x = floor(random(width)); 
    y = floor(random(height));
    snows = (snow[]) append(snows, this); 
  } 

  void dessine(){ 
   
    //if (y <= height - 1) 
    y += random(0.005, 1); 
    fill(255); 
    ellipse(x,y,2,2); 
  }
  
}


