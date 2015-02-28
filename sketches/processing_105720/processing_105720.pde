


//"class Cell" reference from Daniel Shiffman Learning Processing Chapter 13

Cell[][] grid;//array of rectangles in a grid

int numColumns= 20;//initial columns
int numRows = 20;//initial rows
float r= random(0,100);//color value
float g= random(0,100);
float b= random(0,100);




void setup(){
  size(400,400);
  grid = new Cell[numColumns][numRows];//array of rects according to  array

  for (int i = 0; i<numColumns;i++){//construct x axis 
    for(int j=0; j<numRows;j++){//construct y axis
    
      grid[i][j]=new Cell(i*20,j*20,numColumns,numRows,i+j); //new grid every 20x20
     

    }
  }
}

void draw(){  
  background(r,g,b);
  for(int i = 0; i <numColumns; i++){
    for(int j = 0; j<numRows; j++){
      grid[i][j].display();//displays initial grid with random color
    }
  }
  
  if(mousePressed==true){//if mouse is pressed, color oscillates by 1 higher
  for(int i = 0; i <numColumns; i++){
    for(int j = 0; j<numRows; j++){
       grid[i][j].oscillate();
     
    }
  }
}
}




  class Cell{//draws cells with location and size
  float x,y;//x y location
  float w,h;//width and height
  float fade;
  
  Cell(float posX, float posY, float gridW, float gridH, float tempFade){
    x= posX;
    y=posY;
    w=gridW;
    h=gridH;
    fade= tempFade;
  }
  
  void oscillate(){//rate of fading to white
    fade+=1;
  }
  
  
  void display(){
    stroke(0);//black outline
    fill(r+fade,g+fade,b+fade);//choose random color and increment +1 toward 255 for fade
    rect(x,y,w,h);//draws the rectangle
  }
  


}





