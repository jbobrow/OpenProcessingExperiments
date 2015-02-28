
color[] palette = new color[5];
color c1;
color c2;
color c3;
color c4;
color c5;
color bgColor;


int numRows; //number of color bands
int numCols;
int scW;
int scH;

//Non-definables
int colorIndex;
int opIndex;
int curOpStep;
float rowHeight;
float colWidth;
int directionalMod;

void setup(){
    noStroke();
  //define definables, definitley.
  frameRate(5);
  numRows = 11;
  numCols = 11;
  scW = 600;
  scH = 600;
  //size(scW,scH); //changing this might go wonky on the web version
  size(600,600);
  //define color palette
  c1= #FF472E;
  c2= #FF7E62;
  c3= #FFC19F;
  c4= #CDE1FF;
  c5= #C1FFFF;
  bgColor = #CDE1FF;
  setPalette();
  
  //ndf
  colorIndex = 0;
  opIndex = 255;
  rowHeight = scH / numRows;
  colWidth = scW / numCols;
  curOpStep = 1;
  directionalMod = 1;
}

void draw(){
  drawRows();
}

void drawRows(){
 for(int x = 0; x < numCols; x++){
   for(int y = 0; y < numRows; y++){
     fill(palette[colorIndex],opIndex);
     opIndex -= curOpStep;
     colorIndex++;
     if(colorIndex > 4){colorIndex = 0;}
     
     if(opIndex < 5){opIndex = 255; curOpStep += 1;}
     if(curOpStep > int(random(100,255))){ curOpStep = 1; }
     
     rect(x * colWidth * directionalMod, y * rowHeight, scW, rowHeight);
   } 
 }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
       directionalMod *= -1; 
       c1 = #714721;
       c2 = #BF9B30;
       c3 = #BF8450;
       c4 = #D9AC84;
       c5 = #A0AE9F;
       setPalette();
    }
    else if(keyCode == DOWN){
      directionalMod *= -1; 
       c1 = #172738;
       c2 = #213048;
       c3 = #001A21;
       c4 = #172D36;
       c5 = #123327;
       setPalette();
   }
   else if(keyCode == LEFT){
     directionalMod *= -1; 
       c1 = #AB311A;
       c2 = #7E7257;
       c3 = #778C8B;
       c4 = #444B47;
       c5 = #7E7E72;
       setPalette();
   }
   else if(keyCode == RIGHT){
     directionalMod *= -1; 
       c1 = #537F79 ;
       c2 = #78A68F ;
       c3 = #CBD49C;
       c4 = #FED457;
       c5 = #CB252A;
       setPalette();
   }
}
}

void setPalette(){
  palette[0] = c1;
  palette[1] = c2;
  palette[2] = c3;
  palette[3] = c4;
  palette[4] = c5;
}


