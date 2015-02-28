
  /*
    Juliana Freitas Verlangieri
    Origamic //April 3, 2014
    Creative Computing - Section B

   OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/61008*@* */

//Interactions
//
//mouseX: increase tile detail
//mouseY: changes tile nod position
//arrow right/left: increase/decrease number of tiles horizontally
//arrow up/down: increase/decrease number of tiles vertically

float tileCountX = 6; //number of initial tiles horizontally
float tileCountY = 6; //number of initial tiles vertically
int count = 0;

int drawMode = 1;

void setup() {
size(600,600);
     
}

void draw(){
  
    background(230);
    smooth();
    
    //count will introduce the mouseX to the drawing,
    //because mouseX by itself would detail to much each tile
    count = mouseX/20 +5;
    //para will introduce the mouseY to the drawing,
    //because mouseY by itself would take the tiles out of the screen
    float para = (float)mouseY/height - 0.5;

    //create the grid for the tiles on Y and X
    for (int gridY=0; gridY<= tileCountY; gridY++) { 
      for (int gridX=0; gridX<= tileCountX; gridX++) { 

      //the height and width of each tile depends on the number of total tiles on the screen
      float tileWidth = width / tileCountX; 
      float tileHeight = height / tileCountY;
      float posX = tileWidth*gridX + tileWidth/2;
      float posY = tileHeight*gridY + tileHeight/2;

      pushMatrix();
      translate(posX, posY);
      
   //switch is like an if/else estatement, but it's easier to use if you have
   //three options or more. Unfortunately I didn't use more than one option,
   // but since I'm planning to add more drawModes, I left it as it is
   switch (drawMode) {
   case 1:
   
      for (float i=0; i <= count; i+= 13){
        stroke(190);
      line(0, para*tileHeight, (i/count-0.5)*tileWidth, tileHeight/2);
      line(0, para*tileHeight, (i/count-0.5)*tileWidth, -tileHeight/2);
      line(0, para*tileHeight, tileWidth/2,(i/count-0.5)*tileHeight);
      line(0, para*tileHeight, -tileWidth/2,(i/count-0.5)*tileHeight);
    }
     break;
    }
    
     popMatrix();
    }
  }
}

void keyReleased(){
  //toggles drawMode 1
   if (key == '1') drawMode = 1;
  //if (key == '2') drawMode = 2;
 // if (key == '3') drawMode = 3;

  //interactions with number of tiles
  if (keyCode == DOWN) tileCountY = max(tileCountY-1, 1);
  if (keyCode == UP) tileCountY += 1;
  if (keyCode == LEFT) tileCountX = max(tileCountX-1, 1);
  if (keyCode == RIGHT) tileCountX += 1;

}


