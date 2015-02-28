
float x=0.0, y=0.0;
int colorVal = 20;
int counter = 0;
float inc = 1;
int flag = 0;
int numLines = 1, total = 30, i = 0;

void setup(){
 size(400, 400);
 background(255);  
}

void draw(){
  if(numLines < total){ 
      if( counter % 4 == 0){
            if(x < width/numLines){
              stroke(255, 255, 0);
              for(i = numLines; i >= 0; i --){     
                  line(x+ i * width/numLines, 0, x + i * width/numLines, height);
              }                 x+=inc;
            }
            else{
               x = 0.0; y=0.0;
               //background(0);
               counter += 1;
               flag++;
            }
      }
      else if(counter % 4 == 1) {
            if(y < height/numLines){
              stroke(255, 0, 0);
              for(i = numLines; i >= 0; i --){     
                  line(0, y + i * width/numLines, width , y + i * width/numLines);
              }    
              y+=inc;
            }
            else{
               x = width; y=0.0;
               counter += 1;
               flag++;
           } 
      }
      else if(counter % 4 == 2){
            if(x > (width - width/numLines)){
              stroke(0, 255, 0);
              for(i = numLines; i >= 0; i --){     
                  line(x- i * width/numLines, 0, x - i * width/numLines, height);
              }    
              
              x-=inc;
            }
            else{
               x = 0.0; y = height ;
               //background(0);
               counter += 1;
               flag++;
               
            }
      }
      else if(counter % 4 == 3){
            if(y > (width - width/numLines)){
              stroke(0, 0, 255);
              for(i = numLines; i >= 0; i --){                       
                  line(0, y - i * width/numLines, width , y - i * width/numLines);
              }    
              y-=inc;
            }
            else{
               x = 0.0;y=0.0;
               counter += 1;
               flag++;
           }
      }
      if(flag == 4){
        flag = 0;
        numLines+=1;    
      }
  }
  else{
    numLines = 1;
    background(255);
  } 
}

                
                                
