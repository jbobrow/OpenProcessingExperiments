
/* I have created an art application which simulates a set of blocks (in a 5 x 5 matrix), which the user "rolls" between the various
faces to create two-tone geometric pictures.  The user can arrange the blocks to create geometric patterns, or basic
representations of real-life objects.  As well as providing the user the ability to create their own images, the application
includes a number of preset block arrangements which the user can view or use as starting-points for their own art.

The faces of the blocks are based on a toy called Ornabo by Naef - http://www.naefspiele.ch/

INSTRUCTIONS:
left-click: change block face (colour1,colour2,rectangle,triangle,quadrant,inverse-quadrant)
right-click: rotate block face
[space]: change palette
Number key 0: reset all blocks to plain face
Number keys 1 to 9: display preset block arrangements
s or S: Capture screen to clipboard
*/

int ROWS=5;
int COLS=5;

int blockWidth;
int blockHeight;

int blockShape[] = new int[ROWS*COLS];
int blockRotate[] = new int[ROWS*COLS];
color palettes[][] = {{#ffffff,#ff0000},{#61FF16,#FF6D04},{#ffffff,#000000},{#4A86FF,#25437F}};
int palNum = 0;
color palette[] = palettes[palNum];
  
int presetShape[][] = {
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,},
  {0,0,0,5,5,5,1,5,2,2,2,2,2,2,2,2,1,1,1,1,5,5,1,5,5,},
  {1,0,1,0,1,0,3,0,3,0,1,0,2,0,1,0,3,1,3,0,1,0,1,0,1,},
  {5,5,1,2,2,5,5,1,2,2,1,1,0,1,1,4,4,1,3,3,4,4,1,3,3,},
  {3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,},
  {0,0,0,3,1,0,3,3,1,3,3,1,1,3,0,3,1,1,3,0,0,3,3,0,0,},
  {0,0,0,0,0,0,4,4,1,3,0,1,1,1,0,2,1,1,1,0,0,2,0,2,0,},
  {5,5,5,5,4,5,5,4,4,4,5,4,4,5,4,5,4,5,5,4,5,5,4,4,4,},
  {5,3,2,3,4,3,5,3,5,3,2,3,1,3,2,3,5,3,5,3,4,3,2,3,5,},
  {3,5,1,5,3,5,3,0,3,5,5,0,1,0,5,1,3,0,3,1,3,5,1,5,3,}
};
int presetRotate[][] = {
  {0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3,0,},
  {0,1,2,0,1,0,2,1,1,3,1,2,3,1,3,1,0,1,2,3,2,3,2,2,3,},
  {0,1,2,3,0,1,1,3,0,1,2,3,0,3,2,3,0,1,1,3,0,1,2,3,0,},
  {0,1,2,1,3,3,2,3,1,3,2,3,0,1,2,2,3,1,0,1,1,0,2,3,2,},
  {0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3,0,},
  {0,1,2,1,0,1,0,1,0,1,0,0,0,1,2,3,0,1,2,3,0,3,2,3,0,},
  {0,1,2,1,0,1,2,3,0,1,0,0,0,1,2,0,0,1,2,3,0,3,2,1,0,},
  {2,3,2,3,0,1,0,3,2,3,2,1,0,3,0,1,2,1,0,3,2,3,0,1,0,},
  {2,2,0,3,1,2,0,0,1,3,3,3,0,1,1,1,3,2,2,0,3,1,2,0,0,},
  {2,1,1,0,3,3,0,3,1,2,1,3,0,1,0,3,3,1,2,3,1,1,0,0,0,}
};

void setup() {
  size(800,800);
  background(palette[0]);
  noLoop();
  noStroke();

  blockWidth = width/COLS;
  blockHeight = height/ROWS;

  for(int i=0; i < ROWS*COLS; ++i) {
    blockShape[i] = 0;
    blockRotate[i] = i%4;
  }
}

void draw() {
  for(int i=0; i < ROWS*COLS; ++i) {
    color qPal[];
    int[] r = getRect(i);
    switch(blockShape[i]) {
      case 0: // colour 1
        fill(palette[0]);
        rect(r[0],r[1],blockWidth,blockHeight);
        break;
      case 1: // colour 2
        fill(palette[1]);
        rect(r[0],r[1],blockWidth,blockHeight);
        break;
      case 2: // rectangle
        fill(palette[0]);
        rect(r[0],r[1],blockWidth,blockHeight);
        fill(palette[1]);
        switch(blockRotate[i]) {
          case 0: rect(r[0],r[1],blockWidth,blockHeight/2); break; 
          case 1: rect(r[0]+(blockWidth/2),r[1],blockWidth/2,blockHeight); break; 
          case 2: rect(r[0],r[1]+(blockHeight/2),blockWidth,blockHeight/2); break; 
          case 3: rect(r[0],r[1],blockWidth/2,blockHeight); break; 
        }
        break;
      case 3: // triangle
        fill(palette[0]);
        rect(r[0],r[1],blockWidth,blockHeight);
        fill(palette[1]);
        switch(blockRotate[i]) {
          case 0: triangle(r[0]+blockWidth,r[1],r[0]+blockWidth,r[1]+blockHeight,r[0],r[1]+blockHeight); break; 
          case 1: triangle(r[0],r[1],r[0]+blockWidth,r[1]+blockHeight,r[0],r[1]+blockHeight); break;  
          case 2: triangle(r[0]+blockWidth,r[1],r[0],r[1],r[0],r[1]+blockHeight); break;  
          case 3: triangle(r[0],r[1],r[0]+blockWidth,r[1],r[0]+blockWidth,r[1]+blockHeight); break;  
        }
        break;
      case 4: // quadrant
      case 5: // quadrant (inverse)
        qPal = (blockShape[i]==4) ? new color[]{palette[0],palette[1]} : new color[]{palette[1],palette[0]};
        fill(qPal[0]);
        rect(r[0],r[1],blockWidth,blockHeight);
        fill(qPal[1]);
        switch(blockRotate[i]) {
          case 0: arc(r[0],r[1],blockWidth*2,blockHeight*2,0,PI/2,PIE); break; 
          case 1: arc(r[0]+blockWidth,r[1],blockWidth*2,blockHeight*2,PI/2,PI,PIE); break;   
          case 2: arc(r[0]+blockWidth,r[1]+blockHeight,blockWidth*2,blockHeight*2,PI,PI*1.5,PIE); break;  
          case 3: arc(r[0],r[1]+blockHeight,blockWidth*2,blockHeight*2,PI*1.5,PI*2,PIE); break;  
        }
    }
  }
  //logShape();
}

void logShape() {
  print("shape{");
  for(int i=0; i < ROWS*COLS; ++i) {
    print(blockShape[i] + ",");
  }
  println("}");
  print("rotate{");
  for(int i=0; i < ROWS*COLS; ++i) {
    print(blockRotate[i] + ",");
  }
  println("}");
}

void mouseClicked() {
  int pos = getPos(mouseX, mouseY);
  if (mouseButton == LEFT) {
    blockShape[pos] = (blockShape[pos]+1)%6;
  } else {
    blockRotate[pos] = (blockRotate[pos]+1)%4;
  }
  redraw();
}

void keyPressed() {
  if (key == ' ') {
    palNum = (palNum+1)%palettes.length;
    palette = palettes[palNum];
  } else if (key >= '0' && key <= '9') {
    arrayCopy(presetShape[key-'0'],blockShape);
    arrayCopy(presetRotate[key-'0'],blockRotate);
  } else if (key == 's' || key == 'S') {
    saveFrame("screenshot.png");
  }
  redraw();
}

int getPos(int x, int y) {
  int col = x/blockWidth;
  int row = y/blockHeight;
  return (row*COLS)+col;
}

int[] getRect(int pos) {
  int x = pos % COLS;
  int y = pos / COLS;
  
  return new int[] {x*blockWidth,y*blockHeight};
}

