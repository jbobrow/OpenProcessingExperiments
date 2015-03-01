
/**Conway's Game of Life
   c to clear,r to randomize,p to pause,s to step forward one generation
   -code by Andzu Schaefer
   **/

import java.util.Random;

int cols = 50;
int rows = 50;
float[][] current = new float[cols][rows];
float[][] previous = new float[cols][rows];
boolean pause=false,scramble=false,reset=false;
int size=50;

void setup(){
  size(250,250); //changing the size doesn't change the size of the window.
  background(255);
  frameRate(10);
  
  int i=0;
  while(i<size){
    int j = 0;
    while(j<size){
        float random=random(1);
        if(random<.5){
         current[i][j]=0;
         previous[i][j]=0;
        }
        else{
         current[i][j]=1;
         previous[i][j]=1;
        }
        
        j++;
    }
    i++;
    
  }
  
}
void draw(){
  update();
  applyNature();
  drawSquares();
}

void update(){ //this guy puts all info thats in current into previous
  int i=0;
  while(i<size){
    int j = 0;
    while(j<size){
        
        previous[i][j]=current[i][j];
        
        j++;
    }
    i++;
    
  }
}

void  drawSquares(){
  int i=0;
  while(i<size){
    int j = 0;
    while(j<size){
        
        if(current[i][j]==1){
          fill(0);  
        }
        else{
         fill(255); 
        }
        noStroke();
        rect(i*5,j*5,4,4);
        
        j++;
    }
    i++;
    
  }
}
void  applyNature(){ //causes cells to die/live/be born depending on their surroundings
  int i=0;
  while(i<size){
    int j = 0;
    while(j<size){
        
         int x1=i-1;
            int x2=i;
            int x3=i+1;
            int y1=j-1;
            int y2=j;
            int y3=j+1;
            /**'''torroidal boundary conditions'''**/
            if( x1==-1){
                x1=49;
            }
            if (x3>49){
                x3=0;
            }
            if (y1==-1){
                y1=49;
            }
            if (y3>49){
                y3=0;
            }
            /**'''count the live neighbors'''**/
            int liveNeighbors=0;
            if (previous[x1][y1]==1){
                 liveNeighbors+=1;
            }
            if (previous[x1][y2]==1){
                 liveNeighbors+=1;
            }
            if (previous[x1][y3]==1){
                 liveNeighbors+=1;
            }
            if (previous[x2][y1]==1){
                 liveNeighbors+=1;
            }
            if (previous[x2][y3]==1){
                 liveNeighbors+=1;
            }
            if (previous[x3][y1]==1){
                 liveNeighbors+=1;
            }
            if (previous[x3][y2]==1){
                 liveNeighbors+=1;
            }
            if (previous[x3][y3]==1){
                 liveNeighbors+=1;
            }
            /**
            Any live cell with fewer than two live neighbours dies, as if caused by under-population.
            Any live cell with two or three live neighbours lives on to the next generation.
            Any live cell with more than three live neighbours dies, as if by overcrowding.
            Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
            '''
            '''death**/
            if ((liveNeighbors<2) ||( liveNeighbors>3)){
                current[i][j]=0;
            }
            if (liveNeighbors==3){
                current[i][j]=1;
            }
            if (liveNeighbors==2){
                current[i][j]=previous[i][j];
            }
            //create life when mousecliked
            int xpos=5*i;
            int ypos=5*j;
            if ((mouseX-10<=xpos)&&(mouseX+10>xpos)&&(mouseY-10<=ypos)&&(mouseY+10>ypos)&& mousePressed){
                current[i][j]=1;
            }
        j++;
    }
    i++;
    
  }
}

void keyPressed(){
    
    if(key=='r'){
        /**randomize**/
        scramble();
    }
    if(key=='p'){
        /**pause'''
        '''use a global bool that toggles, as well as loop() and noloop()**/
        pause=!pause;
        if (pause){
            noLoop();
        }
        else{
            loop();
        }
    }
    if(key=='c'){
        /**clear'''
        '''set all cells to 0**/
        reset();
    }
    if(key=='s'){
        redraw();
    }

}
void scramble(){
  int i=0;
  while(i<size){
    int j = 0;
    while(j<size){
        float random=random(1);
        if(random<.5){
         current[i][j]=0;
         previous[i][j]=0;
        }
        else{
         current[i][j]=1;
         previous[i][j]=1;
        }
        
        j++;
    }
    i++;
    
  }
}
void reset(){
  int i=0;
  while(i<size){
    int j = 0;
    while(j<size){
        
         current[i][j]=0;
         previous[i][j]=0;
        
        
        j++;
    }
    i++;
    
  }
}



