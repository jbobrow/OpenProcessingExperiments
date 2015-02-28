
class P_GenerationV1{
  int[][] grid;

  int worldsize;
  int maxage;
  
  P_GenerationV1(int wsize, int maxAge){
    worldsize = wsize; 
    maxage = maxAge;
    
    grid = new int[worldsize][worldsize]; 
 
    //just in case 
    for(int x=0;x<worldsize;x++){   
      for(int y=0;y<worldsize;y++){ 
        grid[x][y] = 0;           
      } 
    } 
 
    for(int x=(worldsize/2)-5;x<(worldsize/2)+5;x++){   
      for(int y=(worldsize/2)-5;y<(worldsize/2)+5;y++){   
        grid[x][y] = (int)random(0,2);                   
      } 
    } 
  }//constructor
  
   P_GenerationV1(P_GenerationV1 parent){
    int neighbours; 
    worldsize = parent.worldsize; 
    maxage = parent.maxage;
    
    grid = new int[worldsize][worldsize]; 
     
    for(int x=0;x<worldsize;x++){   
      for(int y=0;y<worldsize;y++){ 
        neighbours = countNeighbours(parent,x,y); 
         
        grid[x][y] = 0; 
         
        if(parent.grid[x][y] == 1){ 
          grid[x][y] = 1; 
          if(neighbours < 2) grid[x][y] = 0; //underpopulation 
          if(neighbours > 3) grid[x][y] = 0; //overpopulation 
           
        } 
         
        if(parent.grid[x][y] == 0){ 
          if(neighbours == 3) grid[x][y] = 1; //growth 
        } 
      } 
    } 
 
  }//constructor

  void render(int age, float fade){
 
    for(int x=0;x<worldsize;x++){   
      for(int y=0;y<worldsize;y++){ 
        if(grid[x][y] == 1) {          
          fill(255*fade,255*fade,255*fade); 
          
          noStroke(); 
             
          if(age == maxage-1){ 
            fill(255,255,255); 
            stroke(150,150,150); 
          } 
                

          pushMatrix();   
            translate(((0-(worldsize/2))+x)*1,0-age,((0-(worldsize/2))+y)*1); 
            box(1); 
          popMatrix();                   
        }//if cell alive 
      }//y 
    }//x 

  }//render

  int countNeighbours(P_GenerationV1 parent, int atx, int aty){ 
     
    int checkx, checky; 
     
    int count; 
    count = 0; 
     
    for(int x = atx-1; x <= atx+1 ; x++){ 
        for(int y = aty-1; y <= aty+1 ; y++){ 
          checkx = x; 
          checky = y; 
           
          if(checkx > worldsize-1)checkx = 0; 
          if(checkx < 0) checkx = worldsize-1; 
          if(checky > worldsize-1)checky = 0; 
          if(checky < 0) checky = worldsize-1; 
           
          if(parent.grid[checkx][checky] == 1)count++; 
           
        }//y 
    }//x 
     
    if(parent.grid[atx][aty] == 1)count--; 
     
    return count; 
     
  } //countNeighbours



}//class P_Generation


