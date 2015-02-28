
/* 

Sean Thompson 11/12/10

- This is a project I did for my Processing class. It is intended to be a screen saver but the size is set to 
  800 by 400 just for demonstration purposes. The code is set up so the size can be changed freely, so just 
  make it screen.width by screen.height and uncomment the mouseMoved and keyPressed at the very bottom to enable
  full screen saver functionality. 
  
*/


Line [] ln; 
int startX = width/5; 
int startY = height/11;
int colorNum;
int palette = 1; 
int frameNum = frameCount; 

void setup() {

  size (800, 400);
  strokeWeight (5); 
  frameRate (45); 

  ln = new Line[94];


  ln[0] = new Line (width/5, 0, width/5, height, 5, 1);          // Populates array with the big vertical lines
  ln[1] = new Line (0, 0, width, height, 5, 1);
  ln[2] = new Line (width, 0, 0, height, 5, 1);
  ln[3] = new Line ((width/5)*4, 0, (width/5)*4, height, 5, 1);

  for (int i = 4; i < 14; i ++) {                      // Populates array with 1st row of horizontal lines
    startY += height/11;
    ln[i] = new Line (0, startY, (width/8)-4, startY, random(1, 3), 1);
  }

  startY = 0; 

  for (int i = 14; i < 24; i ++) {                      // Populates array with 2nd row of horizontal lines
    startY += height/11;
    ln[i] = new Line ((width/8)+4, startY, 2*(width/8)-4, startY, random(1, 3), -1);
  }

  startY = 0; 

  for (int i = 24; i < 34; i ++) {                      // Populates array with 3rd row of horizontal lines
    startY += height/11;
    ln[i] = new Line (2*(width/8)+4, startY, 3*(width/8)-4, startY, random(1, 3), 1);
  }

  startY = 0;

  for (int i = 34; i < 44; i ++) {                      // Populates array with 4th row of horizontal lines
    startY += height/11;
    ln[i] = new Line (3*(width/8)+4, startY, 4*(width/8)-4, startY, random(1, 3),- 1);
  }

  startY = 0; 

  for (int i = 44; i < 54; i ++) {                     // Populates array with 5th row of horizontal lines
    startY += height/11;
    ln[i] = new Line (3*(width/8)+4, startY, 4*(width/8)-4, startY, random(1, 3), 1);
  }

  startY = 0;

  for (int i = 54; i < 64; i ++) {                      // Populates array with 6th row of horizontal lines
    startY += height/11;
    ln[i] = new Line (4*(width/8)+4, startY, 5*(width/8)-4, startY, random(1, 3), -1);
  }

  startY = 0; 

  for (int i = 64; i < 74; i ++) {                      // Populates array with 7th row of horizontal lines
    startY += height/11;
    ln[i] = new Line (5*(width/8)+4, startY, 6*(width/8)-4, startY, random(1, 3), 1);
  }

  startY = 0; 

  for (int i = 74; i < 84; i ++) {                      // Populates array with 8th row of horizontal lines
    startY += height/11;
    ln[i] = new Line (6*(width/8)+4, startY, 7*(width/8)-4, startY, random(1, 3), -1);
  }

  startY = 0; 

  for (int i = 84; i < 94; i ++) {                      // Populates array with 9th row of horizontal lines (I have no idea why I have 9 rows)
    startY += height/11;
    ln[i] = new Line (7*(width/8)+4, startY, width, startY, random(1, 3), 1);
  }

  for (int i = 0; i < 94; i ++) {                       // Applies a color from the arrays to each line 
    ln[i].lineColor (colorNum, palette); 
    colorNum += 1; 
    if (colorNum > 9) {
      colorNum = 0;
    }
  }
}


void draw() {
  //backdrop ();


  for (int i = 0; i < 4; i ++) {                       // Draws vertical lines to canvas
    ln[i].display (20, 40);
  }
  for (int i = 4; i < 94; i ++) {                      // Draws horizontal lines to canvas
    ln[i].display (8, 80);
  }
  
  ln[0].move1 ();                                      // Aqpply the proper move functions to the big lines
  ln[1].move3 ();
  ln[2].move2 ();
  ln[3].move4 ();
  for (int i = 4; i < 94; i ++) {                       // Applies the move function for the horizontal lines
    ln[i].move5 ();
  }

  if (ln[0].x1 <= 0 || ln[0].x2 <= 0 || ln[0].x1 >= width || ln[0].x2 >= width ) {                //   This whole block of if statments makes all line bounce off the enge of the screen 
    ln[0].direction *= -1;
  }
  if (ln[1].x1 <= 0 || ln[1].x2 <= 0 || ln[1].x1 >= width || ln[1].x2 >= width ) {                   
    ln[1].direction *= -1;
  }
  if (ln[2].x1 <= 0 || ln[2].x2 <= 0 || ln[2].x1 >= width || ln[2].x2 >= width ) {                   
    ln[2].direction *= -1;
  }
  if (ln[3].x1 <= 0 || ln[3].x2 <= 0 || ln[3].x1 >= width || ln[3].x2 >= width ) {                   
    ln[3].direction *= -1;
  }
  for (int i = 4; i < 94; i ++) {
    if (ln[i].y1 <= 0 || ln[i].y1 >= height || ln[i].y2 <= 0 || ln[i].y2 >= height) {
      ln[i].direction *= -1;
    }
  }

  if (frameCount % 450 == 0) {              // This if statment changes the color pallete every 10 seconds 
    palette ++; 
    if (palette > 3) {
      palette = 1;
    } 

    for (int i = 0; i < 94; i ++) {         
      ln[i].lineColor (colorNum, palette); 
      colorNum += 1; 
      if (colorNum > 9) {
        colorNum = 0;
      }
    }
  }
}

class Line {                        // Define the class for the lines.

  float x1, y1, x2, y2;
  float speed, direction;
  int Color;  


  Line (float x1pos, float y1pos, float x2pos, float y2pos, float s, float d) {          // Constructor function
    x1 = x1pos;
    x2 = x2pos;
    y1 = y1pos; 
    y2 = y2pos;
    speed = s;
    direction = d;
  }

  void display (int strokeWeigh, int trans) {            //Display function
    strokeWeight (strokeWeigh); 
    stroke (Color, trans);
    line (x1, y1, x2, y2);
  }

  void move1 () {                       // These functions apply various types of movement to the lines
    x1 += speed * direction;
    x2 += speed * direction;
  }
  void move2 () {
    x1 += speed *- direction;
    x2 += speed * direction;
  }
  void move3 () {
    x1 += speed * direction;
    x2 += speed * -direction;
  }
  void move4 () {
    x1 += speed * -direction;
    x2 += speed * -direction;
  } 
  void move5 () {
    y1 += speed * direction;
    y2 += speed * direction;
  } 
  void move6 () {
    y1 += speed * -direction;
    y2 += speed * direction;
  } 
  void move7 () {
    y1 += speed * direction;
    y2 += speed * -direction;
  } 

  void lineColor (int i, int arrayNum) {                        // This function contains the 3 color pallets in arrays and define them to the "Color" variable.
    int[] clr1 = {
      #54421C, #1220B7, #132C38, #6B868B, #FFD47F, 
      #FF7700, #0074AA, #515E91, #FFAA00, #DDCAAA
    };

    int[] clr2 = {
      #1EE200, #00A073, #3F9732, #D39EAC, #D30038, 
      #50A089, #B9755C, #B1E2AA, #F74100, #688B81
    };

    int[] clr3 = {
      #502B87, #E2D895, #CBE248, #8C9752, #E2CE48, 
      #812B87, #AAA270, #978E52, #20182D, #C0C5A3
    };

    if (arrayNum == 1) {          
      Color = clr1[i];
    }
    if (arrayNum == 2) {
      Color = clr2[i];
    }
    if (arrayNum == 3) {
      Color = clr3[i];
    }
  }
}

void backdrop () {              // A funtion to make the transparent background. 
  fill (100, 1);
  rect (0, 0, width, height);
}

//void keyPressed () {          // Kill the program if keyborad pressed. 
//  exit (); 
//}
//void mouseMoved () {          // Kill the program if mouse moved. 
//  exit ();
//}


