
float angle = 0;
int mode = 0;
 
void setup(){
  size(600,600);
  smooth();
  background(0);
  fill(255);
  noStroke();
   
}
 
void draw(){
  background(0);
  float ellSize = 0;
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){           
        switch(mode){
          case 0:
            if(x%100 == 0 && y%40 == 0){
              text("click to begin",x + sin(y+angle),y + cos(x + angle));
            }
            ellSize = 1000;
            break;
          case 1:
            ellSize = sin(x*y+angle)*7 + cos(angle)*8;
            break;
          case 2:
            ellSize = cos(x / angle + sin(angle)) + sin(y / angle) * 5;  
            break;
          case 3:
            ellSize = sin(x + y / angle) * 5;
            break; 
          case 4:
            ellSize = tan(x*y*.1) + cos(x*y + angle)*10;
            break; 
          case 5:
            ellSize = cos(sin(x*y/angle/50))*10;
            break; 
          case 6:
            ellSize = sin(x*cos(y/10) + sin(angle)*3 + angle)*10; 
            break;
        } 
         
        //following lines for processing.js
        //to keep everything >= 1
        ellSize = abs(ellSize);
        ellSize = map(ellSize,0,10,1,10);
        if(ellSize > 500){
          ellSize = 0;
        } 
        ellipse(x,y,ellSize,ellSize);  
    }
  }
  angle+=.1;
  if(angle > 360){
    angle = 0;
  } 
} 
 
void mouseReleased(){
  mode++;
  angle = 0;
  if(mode > 6){
    mode = 1;
  } 
} 

