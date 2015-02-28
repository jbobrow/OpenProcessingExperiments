
int ScrWidth = 800;
int ScrHeight = 600;

void setup(){
  frameRate(30);
  rectMode(CENTER);
  size(800,600);
  stroke(#5E5B74);
  //noStroke();
}

boolean initializingDone = false; // For Variables than need to be set in draw() only once
boolean rectOver; // Is Arrow over Rectangle?
boolean run = false; //APPLICATION RUN
boolean cursorXrowDetected = false;
boolean cursorYrowDetected = false;
//float space = 10; // Space between X,Y points of squares
int sqSize = 5; // Square Size
float space = sqSize; // Space between X,Y points of squares
float rZeroX = 10; // 10 pixel border
float rZeroY = 10; // 10 pixel border
int Which_RowOrCollum_IsBeingTested = 0;
int Xsq = (ScrWidth / sqSize) - (10 / sqSize);
int Ysq = (ScrHeight / sqSize) - (10 / sqSize);
//int Xsq = 79//+130;//+310; //  = (800 / 10) - 1 // 1 is 10 pixel border
//int Ysq = 59;//+230; //  = (600 / 10) - 1 // 1 is 10 pixel border
int [][] squ = new int[Xsq][Ysq];//SQUARE INFORMATION // 0 = NIL; 1 = DEAD; 2 = LIVE;
int [][] NEXTsqu = new int[Xsq][Ysq];
int livingNeighbours = 0;
//**** CURSOR DETECTOR ****//
int owb_x; // Over what button X
int owb_y; // Over what button Y

void draw(){
  background(#05040F);
  if(initializingDone == false){
    for (int i=0;i<Xsq; i++){
      for(int j=0; j<Ysq; j++){
         squ[i][j]=1;
      }
    }
    for (int i=0;i<Xsq; i++){
      for(int j=0; j<Ysq; j++){
         NEXTsqu[i][j]=squ[i][j];
      }
    }
  initializingDone = true;
  }//END OF initializing
  update_mouse_loc(mouseX, mouseY); // UPDATE-MOUSE
  
  if(run){// IF ENTER IS PRESSED!!!
    for (int i=1; i < Xsq - 1; i++){
      for(int j=1; j < Ysq - 1; j++){
        livingNeighbours = NearestPopulation(i,j);
        if(squ[i][j] == 2){
          if(livingNeighbours < 2){
            NEXTsqu[i][j] = 1;
          }else if(livingNeighbours == 2 || livingNeighbours == 3){
            NEXTsqu[i][j] = 2;
          }else if(livingNeighbours > 3){
            NEXTsqu[i][j] = 1;
          }
        } else if (squ[i][j] == 1){   //END OF IF CELL IS ALIVE (2)
          if(livingNeighbours == 3){
            NEXTsqu[i][j] = 2;
          }
        } //END OF IF CELL IS DEAD (2)
        
      }
    }
    
    //FLIP THE BOARD!!
    for (int i=0;i<Xsq; i++){
      for(int j=0; j<Ysq; j++){
        squ[i][j] = NEXTsqu[i][j];
      }
    }
    
    
  }//END OF 'IF ENTER IS PRESSED!!!'
  
  fill(255,255,255);
  for (int i=1;i<Xsq-1; i++){
    for(int j=1; j<Ysq-1; j++){
      if(squ[i][j]>0){
          switch(squ[i][j]){
            case 1:
              fill(255,255,255);
              break;
            case 2:
              fill(255,0,0);
              break;
            case 3:
              fill(0,0,255);
              break;
            case 4:
              fill(0,255,0);
              break;
          }
          rect((rZeroX) + (space*i), (rZeroY) + (space*j), sqSize, sqSize);
         //squ[i][j]=1;                 CHANGE THIS!
         //initializingDone = true;
      }
    }//END OF 2nd FOR
  }//END OF 1st FOR
}//END OF DRAW

void update_mouse_loc(int x, int y){
  if (overRectField()){
  cursorXrowDetected = false;
  Which_RowOrCollum_IsBeingTested = 0;
  while(cursorXrowDetected == false){
    if (mouseX >= rZeroX-(sqSize/2)+(sqSize*Which_RowOrCollum_IsBeingTested) && mouseX <= (rZeroX-(sqSize/2)+(sqSize*Which_RowOrCollum_IsBeingTested))+sqSize){
      owb_x = Which_RowOrCollum_IsBeingTested;
      cursorXrowDetected = true;
    }
    Which_RowOrCollum_IsBeingTested++;
  }
    
  cursorYrowDetected = false;
  Which_RowOrCollum_IsBeingTested = 0;
  while(cursorYrowDetected == false){
    if (mouseY >= rZeroY-(sqSize/2)+(sqSize*Which_RowOrCollum_IsBeingTested) && mouseY <= (rZeroY-(sqSize/2)+(sqSize*Which_RowOrCollum_IsBeingTested))+sqSize){
      owb_y = Which_RowOrCollum_IsBeingTested;
      cursorYrowDetected = true;
    }
    Which_RowOrCollum_IsBeingTested++;
    }
    rectOver = true;
    }else{
      rectOver = false;
    }
}// END OF UPDATE

boolean overRectField(){
  if (mouseX >= rZeroX-(sqSize/2)+sqSize && mouseX <= ScrWidth-(sqSize/2)-sqSize && mouseY >= rZeroY-(sqSize/2)+sqSize && mouseY <= ScrHeight-(sqSize/2)-sqSize){
    cursor(HAND);
    return true;
  }else{
    cursor(ARROW);
    return false;
  }
}// END of overRect

void mousePressed(){
  if(rectOver){
    if(squ[owb_x][owb_y] < 4){
      squ[owb_x][owb_y] = squ[owb_x][owb_y] + 1;
    }else{
      squ[owb_x][owb_y] = 1;
    }
  }
}

void keyPressed(){
  if (key == ENTER){
    if(run){
      run = false;   
    }else{
      run = true;
    }
  }
  if (key == 'A' || key == 'a'){
    for (int i=1;i<Xsq-1; i++){
      for(int j=1; j<Ysq-1; j++){
        squ[i][j]=2;
      }
    }
  }
}

int NearestPopulation(int arrayX, int arrayY){
  livingNeighbours = 0;
    if(squ[arrayX][arrayY-1] == 2){
      livingNeighbours++;
    }
    if(squ[arrayX][arrayY+1] == 2){
      livingNeighbours++;
    }
    if(squ[arrayX+1][arrayY] == 2){
      livingNeighbours++;
    }
    if(squ[arrayX+1][arrayY+1] == 2){
      livingNeighbours++;
    }
    if(squ[arrayX+1][arrayY-1] == 2){
      livingNeighbours++;
    }
    if(squ[arrayX-1][arrayY] == 2){
      livingNeighbours++;
    }
    if(squ[arrayX-1][arrayY+1] == 2){
      livingNeighbours++;
    }
    if(squ[arrayX-1][arrayY-1] == 2){
      livingNeighbours++;
    }  
  return livingNeighbours;
}

