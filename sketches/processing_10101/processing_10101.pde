
int grid_size=100;

void setup(){
  size (500,100);
  background(255);
  strokeCap(SQUARE);
  pushStyle();
  stroke(200);
  rect(0,0,499,99);
  popStyle();
}

void draw(){
     
    for (int i = grid_size; i<width;i=i+grid_size)
      {
        pushStyle();
         stroke(200);
         line(i,0,i,height);
        popStyle();  
      }
 
     for (int g=0;g<(width/grid_size);g=g+1)
      {    
        pushMatrix();
          pushStyle();
      
            translate(g*grid_size,0);
            strokeWeight(5);
            line(height/2,0,height/2,width+100);
            line(width,50,0,50);
            
            pushMatrix();
              translate(grid_size/2,grid_size/2);
           
                for (int j = grid_size; j<500;j=j+100)
                  {
                    line(j+grid_size/-4,grid_size/-2,j+grid_size/-4,grid_size);
                    if(j==0){             
                     }
                    else if(j==100){
                      line(j+grid_size/-4,-50,j+grid_size/-4,grid_size);
                     }
                    else if(j==200){
                      line(j-50,grid_size/-4,j+50,grid_size/-4);         
                     }
                    else if(j==300){
                      line(j+grid_size/4,-50,j+grid_size/4,grid_size);  
                     }
                    else if(j==400){
                      line(j-50,grid_size/4,j+50,grid_size/4);
                     }
                   }  
             popMatrix();
         
          popStyle();
        popMatrix();
      }
}

