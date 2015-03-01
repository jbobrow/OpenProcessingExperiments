


ArrayList<shaft> shafts;
int currentActive;
GraphPaper paper;
Weave mWeave;

void setup(){
  background(255);
  size(1280,750);
  
  paper = new GraphPaper(20);
  paper.update();
  shafts = new ArrayList<shaft>(24);
  
  for(int i =0 ; i<24; i ++)  {
    shafts.add(new shaft(i+1,40,40+i*20,400));
    shafts.get(i).update();
  }  
  
  
  
  text("Shafts, click to add needles", 40, 20);
  text("Loom Simulator v1.0 -- Built By Pranoy -- www.gpranoy.in",40,700);
  fill(0);
  text("Press \'a\' when you want to weave!",600,600);
  fill(200);
  text("Graph Paper/ Programmable, click to enable shaft", 600,20);
  for(int i = 1; i<= 24; i++)  {
    text(i,605+(i-1)*20,460);
  }
  fill(0);
}

void draw(){
   if(mouseX < 450 && mouseY < 500) checkForMouse();
   
     
  
}

void checkForMouse()  {
  for(int i = 0; i< 24;i++)  {
    shaft tempShaft = shafts.get(i);
    if(mouseY > tempShaft.yPosition-10 && mouseY < tempShaft.yPosition+10)  {
    tempShaft.active(true);
    currentActive = i;
    }
    else  {
        tempShaft.active(false);
    }
  }
}

void mouseClicked()  {
  if(mouseX < 450 && mouseY <519) {
    shafts.get(currentActive).addNeedle(mouseX);
  }
  else if(mouseX > 600 && mouseY < 447){
    paper.updateArray();
  }
}
 
 void keyPressed()  {
   if(key == 'a')  {
     println("keyPressed");
     mWeave = new Weave(shafts,paper);
     mWeave.startWeave();
   }
} 


class GraphPaper{
 
  int[][] graphMatrix;
  int mRows;
  int squareThing = 20;
  
  GraphPaper(int rows)  {
  mRows = rows;
  graphMatrix = new int[24][rows];
  }
  
  void update()  {
    strokeWeight(1);
    for(int i = 0; i< 24;i++)  {
      for(int j = 0;j<mRows;j++)  {
        if(graphMatrix[i][j] == 0) fill(200); 
        else fill(0);  
        rect(600+i*squareThing,40+j*squareThing,squareThing,squareThing);
      }
    }
  }
  
  void updateArray(){
    int x = (mouseX-600)/squareThing;
    int y = (mouseY-40)/squareThing;
    if(graphMatrix[x][y] == 1) graphMatrix[x][y] = 0;
    else if(graphMatrix[x][y] == 0) graphMatrix[x][y] = 1; 
    
    fill(0);  
    stroke(0);
    rect(600+x*squareThing,40+y*squareThing,squareThing,squareThing);
  }
}
class Weave{
  
  ArrayList<shaft> shafts;
  GraphPaper mGraphPaper;
  
  Weave (ArrayList<shaft> mShafts, GraphPaper graphPaper)  {
    mGraphPaper = graphPaper;
    shafts = mShafts;
  }
  
  void startWeave(){
    int[][] matrix = mGraphPaper.graphMatrix;
       for(int i = matrix[0].length-1; i>=0; i--)  {
         for(int j=0; j< matrix.length; j++)  {
           if(matrix[j][i] ==  1)  {
             int selectedShaft = 23-j;
             shaft makeHighShaft = shafts.get(selectedShaft);
             for(int k=0; k< makeHighShaft.needles.size();k++)  {
               needle tempNeedle = makeHighShaft.needles.get(k);
               line(tempNeedle.getPosX(),600+i*5,tempNeedle.getPosX()+5,600+i*5);
             }
           }
         }
       }
    }
}
class needle{
  int shaftNumber;
  int positionOnShaftX;
  
   needle(int mShaftNumber,int mPosX)  {
    shaftNumber = mShaftNumber;
    positionOnShaftX = mPosX;
    fill(200);
    ellipse(positionOnShaftX,40+(shaftNumber-1)*20,10,10);
    //println("needleAdded");
  }
  
  int getPosX(){
    return positionOnShaftX;
  }
  void setPositionOnShaft(int mShaftNumber,int posX)  {
    shaftNumber = mShaftNumber;
    positionOnShaftX = posX;
  } 
  
  void draw()   {
    
  }
}
class shaft{
  
  int numberOfShaft;
  int xPosition, yPosition, lengthOfShaft;
  ArrayList<needle> needles;
  boolean position; // True --- High ; False --- Low
  boolean activeState = false;
  
  shaft(int num, int xPos, int yPos, int shaftLength){
    numberOfShaft = num;
    xPosition = xPos;
    yPosition = yPos;
    lengthOfShaft = shaftLength; 
    needles = new ArrayList<needle>();
  }
  
  void addNeedle(int posX){
    needles.add(new needle(numberOfShaft,posX));
  } 
  
  void update(){
    strokeWeight(3);
    if(activeState) {
      pushMatrix();
      translate(mouseX,0);
      popMatrix();
      stroke(0);
    }
    else {
      stroke(200);
    }
    line(xPosition,yPosition,lengthOfShaft+xPosition, yPosition);
  }  
  
  void draw()  {
  }
  
  void active(boolean state)  {
    activeState = state;
    update();
  }
  
}



