
//Alex Lee, asl1@andrew.cmu.edu, HW2
//Copyright Alex Lee 2013, Pittsburgh PA

/*
background are the same squares, maybe many more 
a forms the center of the glasses, s forms the glass lenses, l forms
the nose
head is blocky, made up the same squares but another color, maybe yellow?
-maybe the non initial skin is a lighter red 
make the colors a bit darker and sharper, brighter, stand out more 
four strands of vertical hair on top, like homer 
the top of the head is a curve, can you make it integrate the blocks?

for the background, DEFINE the number of elements in the array when
you first define the array 
*/ 
int screenWidth = 400;
int screenHeight = 400; 

int x = 0; // this moves the location of the face, put these vars in every rect function 
int y = 0;

color glassColor1 = #FFD66C;
color glassColor2 = #FFCE05;
//color faceColor1 = ;
//color faceColor2 = ;
color bgColor1 = #D4245F;
color bgColor2 = #AB0039;

int bgRectX = 50; 
int bgRectY = 50; 
color[][] bgArray = new color[bgRectY][bgRectX]; 
int bgRectSizeX = screenWidth / bgRectX; 
int bgRectSizeY = screenHeight / bgRectY;

int faceMagni = 2;
int faceRectSizeX = bgRectSizeX * faceMagni;
int faceRectSizeY = bgRectSizeY * faceMagni;
color[][] faceArray = new color[bgRectY/faceMagni][bgRectX/faceMagni]; 
int[][] faceFillArray = new int[bgRectY/faceMagni][bgRectX/faceMagni]; //each inner array represents a row, don't do it like the glass array

int glassMagni = 3;
int glassRectSizeX = bgRectSizeX * glassMagni;
int glassRectSizeY = bgRectSizeY * glassMagni;
color[][] glassArray = new color[bgRectY/glassMagni][bgRectX/glassMagni]; 
int[][] glassFillArray = {{7, 6}, {8, 6}, {9, 6}, {10, 6}, {7, 7}, {7, 8}, {7, 9}, {8, 8}, {9, 8}, {10, 7}, {10, 8}, {10, 9}, {7, 11}, {7, 12}, {7, 13}, {8, 13}, {9, 13}, {10, 13}};


void setup() {
  size(400, 400);
  noStroke();
  smooth();
  drawBgRect();
  drawFaceRect();
  drawGlassRect();
  drawFaceVector();
}

void draw() {
  
}

void drawBgRect() {
  for(int i = 0; i < bgArray.length; i++) {
    if(i == 0 || i % 2 == 0) {
      for(int j = 0; j < bgArray[0].length; j++) {
        if (j == 0 || j % 2 == 0) {
          bgArray[i][j] = bgColor1;
        }
        else if (j == 1 || j % 2 == 1) {
          bgArray[i][j] = bgColor2;
        }
        fill(bgArray[i][j]);
        rect(j * bgRectSizeX, i * bgRectSizeY, bgRectSizeX, bgRectSizeY);
      }
    }
    else if(i == 1 || i % 2 == 1) {
      for(int j = 0; j < bgArray[0].length; j++) {
        if (j == 0 || j % 2 == 0) {
          bgArray[i][j] = bgColor2;
        }
        else if (j == 1 || j % 2 == 1) {
          bgArray[i][j] = bgColor1;
        }
        fill(bgArray[i][j]);
        rect(j * bgRectSizeX, i * bgRectSizeY, bgRectSizeX, bgRectSizeY);
      }
    }
  }
}


void drawFaceRect() {
  
  for(int k = 0; k < 20; k++) {
    faceFillArray[k + 2][7] = 1;
  }
  for(int i = 0; i < 7; i++) {
    faceFillArray[i + 2][12] = 1;
    faceFillArray[i + 15][12] = 1;
  }
  for(int i = 0; i < 6; i++) {
    faceFillArray[2][i + 7] = 1;
    faceFillArray[21][i + 7] = 1;
  }
  faceFillArray[13][16] = 1;
  faceFillArray[14][16] = 1;
  
  for(int i = 0; i < faceFillArray.length; i++) {
    for(int j = 0; j < faceFillArray[i].length; j++) {
      if (faceFillArray[i][j] > 0) {
        int rn = round(random(1));
        if(rn == 0) {
          faceArray[i][j] = glassColor1;
        }
        else {
          faceArray[i][j] = glassColor2;
        }
        fill(faceArray[i][j]);
        rect(i * faceRectSizeX + x, j * faceRectSizeY + y, faceRectSizeX, faceRectSizeY);
      }
    }
  }
  
  //nostrils, glasses, hairs
}

void drawGlassRect() {
  //add colors to array 
  for(int i = 0; i < glassFillArray.length; i++) {
    int glassX = glassFillArray[i][0] - 1;
    int glassY = glassFillArray[i][1] - 1;
    if(i == 0 || i % 2 == 0) {
      glassArray[glassX][glassY] = glassColor1;
    }
    else if(i == 1 || i % 2 == 1) {
      glassArray[glassX][glassY] = glassColor2;
    }
    fill(glassArray[glassX][glassY]);
    rect(glassX * glassRectSizeX + x, glassY * glassRectSizeY + y, glassRectSizeX, glassRectSizeY);
  }
  //a better way to have done this is to make a 2D array where each inner array represents a row,
  //and you put the numbers of the squares you wanted to fill in those inner arrays,
  //and then use a match function to see whether you make a rectangle there 
}

void drawFaceVector() {
  fill(glassColor1);
  beginShape();
  curveVertex(x + bgRectSizeX * 2, y + bgRectSizeY * 16);
  curveVertex(x + bgRectSizeX * 4, y + bgRectSizeY * 14);
  curveVertex(x + bgRectSizeX * 12, y + bgRectSizeY * 6);
  curveVertex(x + bgRectSizeX * 25, y + bgRectSizeY * 3);
  curveVertex(x + bgRectSizeX * 35, y + bgRectSizeY * 5);
  curveVertex(x + bgRectSizeX * 44, y + bgRectSizeY * 12);
  curveVertex(x + bgRectSizeX * 50, y + bgRectSizeY * 16);
  endShape();
}

//half circle arcs for eyes
  
//when drawing the top of the head, make the fill above the head, make that area just one bg color 
//to fill the top, make a shape that encompasses the entire top area of the bg, like a large rectangle (use vertexes)
//maybe not the entire top, leave a couple lines of squares at the top

//to draw the face, replace values in the bg array 


