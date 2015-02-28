
//Liliana Osorio
//Labtwo_Mandala
//September 14,2010

void setup(){
  size(600, 600);
  background(255);
  
  
  color fc = color(32, 127, 94, 50);
  for (int i=0; i<10; i++){
    color sc = color(i*10, 100, 0);
     
  polyStar(width/6+ i*30, height/2.3 + i*20, 6, 20, -50, fc, sc, .2, PI/6.0);
   polyStar(width/6+ i*30, height/2.9 + i*20, 6, 20, -50, fc, sc, .2, PI/6.0);
    polyStar(width/8+ i*30, height/2 + i*20, 6, 20, -50, fc, sc, .2, PI/6.0);
     polyStar(width/7+ i*30, height/3.98 + i*20, 6, 20, -50, fc, sc, .2, PI/6.0);
  polyStar(width/6+ i*30, height/6 + i*20, 6, 20, -50, fc, sc, .2, PI/6.0);
   polyStar(width/5+ i*30, height/10 + i*20, 6, 20, -50, fc, sc, .2, PI/6.0);
    polyStar(width/2.5+ i*30, height/7 + i*20, 6, 20, -50, fc, sc, .2, PI/6.0);
  }
  
  
  
  
  
 
 
}

