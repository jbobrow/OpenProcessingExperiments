
float[][]eColor = new float[6][8];
float[][]rect = new float[6][8];
float[][]speed = {{0.1, 0.5, 0.3, 0.2, 1.5, 0.5,0.4, 0.8},    //円の拡大縮小のスピード
                   {1.0, 2.0, 1.5, 2.0, 0.3, 1.1,1.0, 2.0},
                   {0.4, 0.8, 0.8, 1.1, 1.4, 2.0,0.1, 0.5},
                   {0.1, 0.5, 0.3, 0.2, 1.5, 1.3,2.0, 0.5},    
                   {1.0, 2.0, 1.5, 2.0, 0.5, 0.7,1.1, 1.4},
                   {0.4, 0.8, 0.08, 1.1, 1.4, 0.9,1.5, 2.0}};

float minSize = 1;
float maxSize = 100;



void setup(){
  size(500,500);
  background(0);
  smooth();
  noStroke();
  fill(0);
  rectMode(CENTER);
  
  for(int y = 0; y < 6; y++){
    for(int x = 0; x < 6; x++){
     rect[y][x] = maxSize;
     eColor[y][x] = 0;
    }
  }
}


void draw(){
  background(0);
  
    for(int y = 0; y < 3; y++){
    for(int x = 0; x < 5; x++){

      eColor[y][x] += speed[y][x]; 
      if(rect[y][x] > maxSize || rect[y][x] < minSize || eColor[y][x] > 255 || eColor[y][x] < 0)speed[y][x] = -speed[y][x];
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 0, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 30, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 60, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 90, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 120, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30, 150, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30, 180, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30, 210, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30, 240, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30, 270, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30, 300, 20, 20); 
 
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30, 330, 20, 20);    
    
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 360, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 390, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 420, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 450, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30, 480, 20, 20); 
      

 
      
        }
  }
      
        
  
  for(int y = 0; y < 6; y++){
    for(int x = 0; x < 7; x++){

      eColor[y][x] += speed[y][x]; 
      if(rect[y][x] > maxSize || rect[y][x] < minSize || eColor[y][x] > 255 || eColor[y][x] < 0)speed[y][x] = -speed[y][x];
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 0, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 30, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 60, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 90, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 120, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+155, 150, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+155, 180, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+155, 210, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+155, 240, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+155, 270, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+155, 300, 20, 20); 
 
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+155, 330, 20, 20);    
    
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 360, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 390, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 420, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 450, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+155, 480, 20, 20); 
           
        }
  }
  
  
  
    for(int y = 0; y < 3; y++){
    for(int x = 0; x < 5; x++){

      eColor[y][x] += speed[y][x]; 
      if(rect[y][x] > maxSize || rect[y][x] < minSize || eColor[y][x] > 255 || eColor[y][x] < 0)speed[y][x] = -speed[y][x];
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 0, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 30, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 60, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 90, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 120, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+370, 150, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+370, 180, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+370, 210, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+370, 240, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+370, 270, 20, 20); 
      
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+370, 300, 20, 20); 
 
      fill(100, eColor[y][x], 255, 127);
      ellipse(x*30+370, 330, 20, 20);    
    
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 360, 20, 20); 
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 390, 20, 20);
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 420, 20, 20);
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 450, 20, 20);
      
      fill(250, 170, eColor[y][x], 127);
      ellipse(x*30+370, 480, 20, 20);
      

      
        }
    }      
}
  
  


