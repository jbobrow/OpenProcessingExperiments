
float space = 30;

  size(400,400);
  //smooth();

  for(float x = 0; x < width; x=x+space){
    for (float y = 0; y < width; y=y+space){
       if(random(100) > 50){
         fill(140,0,0);
         strokeWeight(random(10));
         stroke(255,210,90);
         ellipse(x+random(10), y+random(10), 10, 10);
       }else{
         fill(255,210,90);
         strokeWeight(random(10));
         stroke(140,0,0);
         ellipse(x, y, 15, 15);
       } 
    }
  }


