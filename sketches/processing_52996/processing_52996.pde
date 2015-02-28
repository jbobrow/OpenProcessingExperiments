


void setup(){
  size(600,600);


  
  smooth();
 
 background(221,255,3);
  //fill(255);
  noStroke();
}

void draw(){
   background(285,255,5);

  float ellSize = 0;
  for(int x = 1 ; x < width; x+=10){
   for(int y= 1 ; y < height; y+=10){
      
      if(y<random(600)) {
     ellSize = (random(tan(mouseY)));//tan((cos(cos(mouseX))*sin(x))*10);
      
    } else {
      
      ellSize = (tan(random(mouseX)));
    }
     if(y>random(500)){
   fill(255,205,0);
    ellipse(x,y,ellSize,ellSize);
   
     }else{
   fill(255,100,0);
   ellipse(x,y,ellSize,ellSize);
   
   fill(255,0,0);
   ellipse(x,y,ellSize,ellSize);    
     }
    }
  }
}
    

