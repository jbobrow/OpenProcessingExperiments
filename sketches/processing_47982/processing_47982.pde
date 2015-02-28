
//

float segLength = 100;

void setup(){
  size (400,600, P3D);
  
}

void draw(){

  float xPositionFigFixed = width/2;
  float yPositionFigFixed = 200;
  float zPositionFigFixed = 0;
  
  //float xPositionFig = width/2;  //Figure's x position is based off this 
  //float yPositionFig = 200;  //Figure's y position is based off this
  //float zPositionFig = 0;        //Figure's z position is based off this
  
  float xPositionChange = mouseX/10-20;  //This will eventually be based on x position of square
  float yPositionChange = mouseY/20-10;  //This will eventually be based on y position of square
  float zPositionChange = mouseX/5-40;  //This will eventually be based on size of captured square
  
  float xPositionFig = xPositionFigFixed + xPositionChange;
  float yPositionFig = yPositionFigFixed + yPositionChange;
  float zPositionFig = zPositionFigFixed + zPositionChange;
  
  float xStep = 15;  //
  float yStep = 100;  //unit of difference for y position
  float zStep = 5;  //unit of difference for z position
  
  background(0);
  smooth();
  ambientLight(55,55,105);
  directionalLight(205,235,235,0, 0,-.25);
  spotLight(251, 233, 230, mouseX, mouseY/2, mouseX-200, -1, 0, 0, PI/2, 2);  //eventually based on xposition, yposition, and size of square
 
  fill(255,0,0);
  noStroke();
  
  beginShape(TRIANGLES);
  
    //Head
    vertex((xPositionFig)-(2*xStep),yPositionFig-(yStep)-(yPositionChange*.75),zPositionFig);  //top
    vertex((xPositionFig)+(2*xStep),yPositionFig-(yStep)-(yPositionChange*.75),(zPositionFig)*(-1));
    vertex(xPositionFig,yPositionFig-(yStep)+30,zPositionFig+(zStep*4));
  
    vertex((xPositionFig)-(2*xStep),yPositionFig-(yStep)-(yPositionChange*.75),zPositionFig);  //left
    vertex(xPositionFig,yPositionFig-(yStep)+30,zPositionFig+(zStep*4));
    vertex(xPositionFig,yPositionFig-20,zPositionFig);
    
    vertex((xPositionFig)+(2*xStep),yPositionFig-(yStep)-(yPositionChange*.75),(zPositionFig)*(-1));  //right
    vertex(xPositionFig,yPositionFig-(yStep)+30,zPositionFig+(zStep*4));
    vertex(xPositionFig,yPositionFig-20,zPositionFig);


    //Left Arm
    vertex((xPositionFig)-(4*xStep)-5,yPositionFig-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));  //top
    vertex((xPositionFig)-(5*xStep)-5,yPositionFig-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));
    vertex((xPositionFig)-(5*xStep)+5,yPositionFig+10-(yPositionChange*.75),zPositionFig);
    
    vertex((xPositionFig)-(5*xStep)-5,yPositionFig-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));
    vertex((xPositionFig)-(5*xStep)+5,yPositionFig+10-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)-(5*xStep),(yPositionFig)+segLength-(yPositionChange*.75),zPositionFig+(zStep));
    
    vertex((xPositionFig)-(4*xStep)-5,yPositionFig-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));
    vertex((xPositionFig)-(5*xStep)+5,yPositionFig+10-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)-(5*xStep),(yPositionFig)+segLength-(yPositionChange*.75),zPositionFig+(zStep));
    
    vertex((xPositionFig)-(5*xStep)-5,(yPositionFig)+segLength-(yPositionChange*.75),zPositionFig-(zStep*2));  //bottom
    vertex((xPositionFig)-(5*xStep)+5,(yPositionFig)+segLength-(yPositionChange*.75),zPositionFig-(zStep*2));
    vertex((xPositionFig)-(5*xStep),yPositionFig+(yStep+10)-(yPositionChange*.75),zPositionFig);
    
    vertex((xPositionFig)-(5*xStep)-5,(yPositionFig)+segLength-(yPositionChange*.75),zPositionFig-(zStep*2));
    vertex((xPositionFig)-(5*xStep),yPositionFig+(yStep+10)-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)-(5*xStep),yPositionFig+(yStep*2)-(yPositionChange*.75),(zPositionFig+(zStep))*(2));
    
    vertex((xPositionFig)-(5*xStep)+5,(yPositionFig)+segLength-(yPositionChange*.75),zPositionFig-(zStep*2));
    vertex((xPositionFig)-(5*xStep),yPositionFig+(yStep+10)-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)-(5*xStep),yPositionFig+(yStep*2)-(yPositionChange*.75),(zPositionFig+(zStep))*(2));
    
    //Right Arm
    vertex((xPositionFig)+(4*xStep)+5,yPositionFig-(yPositionChange*.75),zPositionFig-(zStep*2));  //top
    vertex((xPositionFig)+(5*xStep)+5,yPositionFig-(yPositionChange*.75),zPositionFig-(zStep*2));
    vertex((xPositionFig)+(5*xStep)-5,yPositionFig+10-(yPositionChange*.75),zPositionFig);
    
    vertex((xPositionFig)+80,yPositionFig-(yPositionChange*.75),zPositionFig-(zStep*2));
    vertex((xPositionFig)+70,yPositionFig+10-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)+(5*xStep),(yPositionFig)+segLength-(yPositionChange*.75),(zPositionFig+(zStep))*(-1));
    
    vertex((xPositionFig)+(4*xStep)+5,yPositionFig-(yPositionChange*.75),zPositionFig-(zStep*2));
    vertex((xPositionFig)+70,yPositionFig+10-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)+(5*xStep),(yPositionFig)+segLength-(yPositionChange*.75),(zPositionFig+(zStep))*(-1));
    
    vertex((xPositionFig)+(5*xStep)+5,(yPositionFig)+segLength-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));  //bottom
    vertex((xPositionFig)+(5*xStep)-5,(yPositionFig)+segLength-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));
    vertex((xPositionFig)+(5*xStep),yPositionFig+(yStep+10)-(yPositionChange*.75),zPositionFig);
    
    vertex((xPositionFig)+(5*xStep)+5,(yPositionFig)+segLength-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));
    vertex((xPositionFig)+(5*xStep),yPositionFig+(yStep+10)-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)+(5*xStep),yPositionFig+(yStep*2)-(yPositionChange*.75),(zPositionFig+(zStep))*(-2));
    
    vertex((xPositionFig)+(5*xStep)-5,(yPositionFig)+segLength-(yPositionChange*.75),(zPositionFig-(zStep*2))*(-1));
    vertex((xPositionFig)+(5*xStep),yPositionFig+(yStep+10)-(yPositionChange*.75),zPositionFig);
    vertex((xPositionFig)+(5*xStep),yPositionFig+(yStep*2)-(yPositionChange*.75),(zPositionFig+(zStep))*(-2));
    

    //Torso
    vertex((xPositionFig)-(4*xStep),yPositionFig-(yPositionChange*.5),(zPositionFig-(zStep*2))*(-1));  //top
    vertex((xPositionFig)+(4*xStep),yPositionFig-(yPositionChange*.5),zPositionFig-(zStep*2));
    vertex(xPositionFig,yPositionFig+30,zPositionFig+(zStep*5));
  
  endShape();
  
  beginShape(QUADS);
  
    vertex((xPositionFig)-(4*xStep),yPositionFig-(yPositionChange*.5),(zPositionFig-(zStep*2))*(-1));  //left
    vertex(xPositionFig,yPositionFig+30,zPositionFig+(zStep*5));
    vertex(xPositionFig,yPositionFig+(yStep)+15,zPositionFig);
    vertex((xPositionFig)-(xStep),yPositionFig+(yStep)+30,(zPositionFig-(zStep))*(-1));
  
    vertex((xPositionFig)+(4*xStep),yPositionFig-(yPositionChange*.5),zPositionFig-(zStep*2));  //right
    vertex(xPositionFig,yPositionFig+30,zPositionFig+(zStep*5));
    vertex(xPositionFig,yPositionFig+(yStep)+15,zPositionFig);
    vertex((xPositionFig)+(xStep),yPositionFig+(yStep)+30,zPositionFig-(zStep));
  
  endShape();
  
  beginShape(TRIANGLES);

    vertex((xPositionFig)-(xStep),yPositionFig+(yStep)+30,(zPositionFig-(zStep))*(-1));  //bottom left
    vertex(xPositionFig,yPositionFig+(yStep)+15,zPositionFig);
    vertex(xPositionFig,yPositionFig+(yStep)+25,zPositionFig-(zStep*2));
    
    vertex((xPositionFig)+(xStep),yPositionFig+(yStep)+30,zPositionFig-(zStep));  //bottom right
    vertex(xPositionFig,yPositionFig+(yStep)+15,zPositionFig);
    vertex(xPositionFig,yPositionFig+(yStep)+25,zPositionFig-(zStep*2));
  
  
    //Base
    vertex(xPositionFig,yPositionFig+(yStep)+55,zPositionFig);  //left
    vertex(xPositionFigFixed,yPositionFigFixed+(2*yStep)+35,zPositionFigFixed+(zStep*3));
    vertex(xPositionFigFixed-(xStep)-7,yPositionFigFixed+(2*yStep)+25,zPositionFigFixed-(zStep*2));
    
    vertex(xPositionFig,yPositionFig+(yStep)+55,zPositionFig);  //right
    vertex(xPositionFigFixed,yPositionFigFixed+(2*yStep)+35,zPositionFigFixed+(zStep*3));
    vertex(xPositionFigFixed+(xStep)+7,yPositionFigFixed+(2*yStep)+25,zPositionFigFixed-(zStep*2));
    
    
  endShape();
}

