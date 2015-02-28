
class bubble{ 
  
  int x, y;
  bubble(){ 
    x = floor(random(width)); 
    y = floor(random(height));
    bubbles = (bubble[]) append(bubbles, this); 
  } 

  void dessine(){ 
   
    y += random (-1,0.005);
    fill(255); 
    ellipse(x,y,2,2); 
  }
  
}


