
//COLOURS

boolean ColourMixer = false;

color White = color(255,255,255);
color Grey = color(140,140,140);
color DarkGrey = color(60,60,60);
color Black = color(0,0,0);
color ToolColour = color(215,217,202); 
color Red = color(255,0,0);
color Blue = color(0,255,0);
color Green = color(0,0,255);

int r = 0;
int g = 0;
int b = 0;

int rpos = 340;
int gpos = 340;
int bpos = 340;

color[] Palette = new color[12];

color SelectedColour = color(0,0,0);
int SelectedColourInt = 0;

color FillColour;

//UI DISTANCES

int PaletteX = 4;
int PaletteY = 2;

int ToolX = 4;
int ToolY = 86;

int OptionX = 7;
int OptionY = 172;

//DRAWING VARIABLES

int PenPrevX,PenPrevY,FillX,FillY;

int Tool = 1;
int ToolOption = 2;

float RandomSprayAngle;
int RandomSprayDist, SpraySize, SprayPerFrame;

int LineToolOriginX, LineToolOriginY;

//UNDO ARRAY

color[] UndoMatrix1 = new color[2073600];
color[] UndoMatrix2 = new color[2073600];
color[] UndoMatrix3 = new color[2073600];
color[] UndoMatrix4 = new color[2073600];
color[] RedoMatrix = new color[2073600];

int UndoStage = 0;

//USGAGE

int Actions = 0;

int DetectResizeX = 800;
int DetectResizeY = 640;

//DATA

PImage IconsA;
PImage IconsB;
PImage BG;
PImage BG2;
PImage ButtonsB;
PImage ButtonsA;
PFont FontS;

String[] Options = new String[3];

//--------------------------------------------//

void setup() {
  size(800, 640);
  background(White);
  smooth();
  frameRate(200);
  IconsA = loadImage("iconsA.png");
  IconsB = loadImage("iconsB.png");
  BG = loadImage("BG.png");
  BG2 = loadImage("BG2.png");
  ButtonsA = loadImage("buttonsA.png");
  ButtonsB = loadImage("buttonsB.png");
  FontS = loadFont("FontS.vlw");
//  frame.setResizable(true);
  loadPixels();
  
  Palette[0] = color(255,255,255);
  Palette[1] = color(204,204,204);
  Palette[2] = color(153,153,153);
  Palette[3] = color(102,102,102);
  Palette[4] = color(51,51,51);
  Palette[5] = color(0,0,0);
  
  Palette[6] = color(255,0,0);
  Palette[7] = color(255,150,0);
  Palette[8] = color(255,255,0);
  Palette[9] = color(0,255,0);
  Palette[10] = color(0,0,255);
  Palette[11] = color(220,30,180);
  
  Options[0] = "Small";
  Options[1] = "Medium";
  Options[2] = "Large"; 
}

//--------------------------------------------//

void draw() {
  
   if(DetectResizeX != width || DetectResizeY != height) {
    UndoStage = 0;  
    Actions = 0;  
  }  


  stroke(SelectedColour);
  fill(SelectedColour);
  
  if(Tool == 1 && mousePressed == true) {
    if(ToolOption == 1) strokeWeight(1);
    if(ToolOption == 2) strokeWeight(3);
    if(ToolOption == 3) strokeWeight(5);  
    line(mouseX,mouseY,PenPrevX,PenPrevY);
}
  
  PenPrevX = mouseX;
  PenPrevY = mouseY;
  strokeWeight(1);
  
  if(Tool == 3 && mousePressed == true) {
    if(ToolOption == 1) SpraySize = 194; SprayPerFrame = 9;
    if(ToolOption == 2) SpraySize = 400; SprayPerFrame = 13;
    if(ToolOption == 3) SpraySize = 625; SprayPerFrame = 17;
    for(int i=0; i < SprayPerFrame; i++) {
    RandomSprayAngle = random(TWO_PI);
    RandomSprayDist = int(sqrt(random(SpraySize)));
    
    point(mouseX + (RandomSprayDist*cos(RandomSprayAngle)), mouseY + (RandomSprayDist*sin(RandomSprayAngle)));
    }
  }
  
  if(Tool == 4 && mousePressed == true) {
    if(ToolOption == 1) strokeWeight(1);
    if(ToolOption == 2) strokeWeight(3);
    if(ToolOption == 3) strokeWeight(5);  
    updatePixels();
    if(mouseX>80 && mouseY>80) line(mouseX,mouseY,LineToolOriginX,LineToolOriginY);
  }
  
  strokeWeight(1);
  
  
  fill(Grey);
  noStroke();
  rect(0,0,80,height);
  rect(0,0,width,80);
  image(BG, 0,80);
  image(BG2,0,0);
  strokeWeight(2);
  stroke(DarkGrey);
  line(80,80,80,height);
  line(0,80,width,80);

  textAlign(CENTER,CENTER);
  strokeWeight(1);
  stroke(Black);
  
  for(int c=0; c<12; c++) {
    stroke(Black);
    if(SelectedColour == Palette[c]) stroke(White);
    fill(Palette[c]);
    rect(PaletteX + (40*(c%6)), PaletteY + (40*floor((c)/6)), 32, 32);
  }
  
  noFill();
  
  for(int t=0; t<4; t++) {
    stroke(Black);
    if(Tool == t+1) image(IconsA, ToolX + (40*(t%2)), ToolY + (40*floor((t)/2)), 32, 32, 32*t, 0, 32*(t+1), 32);
    else image(IconsB, ToolX + (40*(t%2)), ToolY + (40*floor((t)/2)), 32, 32, 32*t, 0, 32*(t+1), 32);
    rect(ToolX + (40*(t%2)), ToolY + (40*floor((t)/2)), 32, 32);

  }
   
  if(Tool != 2) {
  for(int o=0; o<3; o++) {
    fill(ToolColour);
    if(ToolOption == o+1) fill(White);
    rect(OptionX, OptionY + (30*o), 64, 22);
    fill(Black);
    text(Options[o], OptionX, OptionY + (30*o), 64, 22);
  }
  }
  
  if(mouseX > 250 && mouseY > 2 & mouseX < 322  && mouseY < 74 && mousePressed == true)  image(ButtonsA, 250, 2, 72, 72, 144, 0, 216, 72);
  else image(ButtonsB, 250, 2, 72, 72, 144, 0, 216, 72);
  
  if(ColourMixer == false) {
  if(mouseX > 330 && mouseY > 2 & mouseX < 402  && mouseY < 74 && mousePressed == true)  image(ButtonsA, 330, 2, 72, 72, 0, 0, 72, 72);
  else image(ButtonsB, 330, 2, 72, 72, 0, 0, 72, 72);
  if(mouseX > 410 && mouseY > 2 & mouseX < 482  && mouseY < 74 && mousePressed == true)  image(ButtonsA, 410, 2, 72, 72, 72, 0, 144, 72);
  else image(ButtonsB, 410, 2, 72, 72, 72, 0, 144, 72);
  }
  
  else {
   
    stroke(Black);
    strokeWeight(3);
    line(340, 18, min(width - 30, 700), 18);
    line(340, 36, min(width - 30, 700), 36);
    line(340, 54, min(width - 30, 700), 54);
    
    strokeWeight(1);
    fill(Red);
    ellipse(rpos, 18, 12,12);
    fill(Green);
    ellipse(gpos, 36, 12,12);
    fill(Blue);
    ellipse(bpos, 54, 12,12);
    
  }
  
DetectResizeX = width;
DetectResizeY = height;
}

//--------------------------------------------//

void mousePressed(){
   
  if(mouseX > 80 && mouseY > 80)   Actions++;
  
  for(int c=0; c<12; c++) {
    if(mouseX > PaletteX + (40*(c%6)) && mouseY > PaletteY + (40*floor((c)/6)) & mouseX < PaletteX + (40*(c%6)) + 32  && mouseY < PaletteY + (40*floor((c)/6)) + 32) {
      SelectedColour = color(Palette[c]);
      SelectedColourInt = c;
      r = int(red(Palette[c]));
      g = int(green(Palette[c]));
      b = int(blue(Palette[c]));
      
      rpos = int(((min(width - 30, 700)-340)*(float(r)/255)) + 340);
      gpos = int(((min(width - 30, 700)-340)*(float(g)/255)) + 340);
      bpos = int(((min(width - 30, 700)-340)*(float(b)/255)) + 340);

    }
  }
  
  for(int t=0; t<4; t++) {
    if(mouseX > ToolX + (40*(t%2)) && mouseY > ToolY + (40*floor((t)/2)) & mouseX < ToolX + (40*(t%2)) + 32  && mouseY < ToolY + (40*floor((t)/2)) + 32) {
      Tool = t+1;
    }
  }
  
  if(Tool != 2) {
  for(int o=0; o<3; o++) {
    if(mouseX > OptionX && mouseY > OptionY + (30*o) & mouseX < OptionX + 64  && mouseY < OptionY + (30*o) + 22) {
      ToolOption = o+1;
    }
  }
  }
  
  if(mouseX > 250 && mouseY > 2 & mouseX < 322  && mouseY < 74) {
      if(ColourMixer == false) ColourMixer = true;
      else ColourMixer = false;
  }
    
  if(ColourMixer == false) {
    if(mouseX > 330 && mouseY > 2 & mouseX < 402  && mouseY < 74) {
        Undo();
    }
    if(mouseX > 410 && mouseY > 2 & mouseX < 482  && mouseY < 74) {
        Redo();
    }
  }
  
  if(Tool==2 && mouseX > 80 && mouseY > 80){
    FillColour=get(mouseX, mouseY);
    Fill(mouseX, mouseY);
    UndoStage=0;
    arrayCopy(UndoMatrix3, UndoMatrix4);
    arrayCopy(UndoMatrix2, UndoMatrix3);
    arrayCopy(UndoMatrix1, UndoMatrix2);
    arrayCopy(pixels, UndoMatrix1);
  }
 
 if(Tool==4 && mouseX > 80 && mouseY > 80) {
   LineToolOriginX = mouseX;
   LineToolOriginY = mouseY;
 }
 
}

//--------------------------------------------//

public void Undo() {
 
    if(UndoStage==3 && Actions > 3) arrayCopy(UndoMatrix4, pixels, height*width);
    if(UndoStage==2 && Actions > 2) arrayCopy(UndoMatrix3, pixels, height*width);
    if(UndoStage==1 && Actions > 1) arrayCopy(UndoMatrix2, pixels, height*width);
    if(UndoStage==0 && Actions > 0) {
      loadPixels();
      arrayCopy(pixels, RedoMatrix);
      arrayCopy(UndoMatrix1, pixels, height*width);
    }
    if(Actions>0) updatePixels();
    if(UndoStage<4 && Actions > UndoStage) UndoStage++;
  } 
  
public void Redo() {
  
        if(UndoStage>0){
        if(UndoStage==1) arrayCopy(RedoMatrix, pixels, height*width);
        if(UndoStage==2) arrayCopy(UndoMatrix1, pixels, height*width);
        if(UndoStage==3) arrayCopy(UndoMatrix2, pixels, height*width);
        if(UndoStage==4) arrayCopy(UndoMatrix3, pixels, height*width);
        updatePixels();
        if(UndoStage>0) UndoStage--;
      }
}

//--------------------------------------------//

public void Fill(int x, int y) {
 
 if(get(x,y) != SelectedColour) {
  
 int PXList[] = new int[2 * height * width];
 int PXListSize = 0;

 PXList[0] = (y << 16) + x;
 PXListSize = 1;

 set(x, y, SelectedColour);

 while (PXListSize > 0){

   x = PXList[0] & 0xffff;
   y = (PXList[0] >> 16) & 0xffff;

   PXListSize--;
   PXList[0] = PXList[PXListSize];

   if (x > 0) {
     if ((get(x-1, y) == FillColour)) {
       set(x-1, y, SelectedColour);
       PXList[PXListSize] = (y << 16) + x-1;
       PXListSize++;
     }
   }

   if (y > 0) {
     if ((get(x, y-1) == FillColour)) {
       set(x, y-1, SelectedColour);
       PXList[PXListSize] = ((y-1) << 16) + x;
       PXListSize++;
     }
   }

   if (x < width) {
     if ((get(x+1, y) == FillColour)) {
       set(x+1, y, SelectedColour);
       PXList[PXListSize] = (y << 16) + x+1;
       PXListSize++;
     }
   }

   if (y < height) {
     if ((get(x, y+1) == FillColour)) {
       set(x, y+1, SelectedColour);
       PXList[PXListSize] = ((y+1) << 16) + x;
       PXListSize++;
     }
   }
 }
 }

}

//--------------------------------------------//

void mouseReleased() {
  if(Tool != 2 && mouseX > 80 && mouseY > 80){
    UndoStage=0;
    arrayCopy(UndoMatrix3, UndoMatrix4);
    arrayCopy(UndoMatrix2, UndoMatrix3);
    arrayCopy(UndoMatrix1, UndoMatrix2);
    arrayCopy(pixels, UndoMatrix1);
    loadPixels();
  }
}

//--------------------------------------------//

void mouseDragged() {
 
 if(ColourMixer == true) {
  if(mouseY > 9 && mouseY < 27) {
   rpos = max(340,min(mouseX, min(width - 30, 700)));
   r = int(255*(rpos - 340)/ (min(width - 30, 700) - 340));
  }
 
  if(mouseY > 27 && mouseY < 45) {
   gpos = max(340,min(mouseX, min(width - 30, 700)));
   g = int(255*(gpos - 340)/ (min(width - 30, 700) - 340));
  }
 
  if(mouseY > 45 && mouseY < 63) {
   bpos = max(340,min(mouseX, min(width - 30, 700)));
   b = int(255*(bpos - 340)/ (min(width - 30, 700) - 340));
  }
  
  Palette[SelectedColourInt] = color(r,g,b);
  SelectedColour = Palette[SelectedColourInt];
  
 } 
  
}

//--------------------------------------------//

void keyReleased() {
  
  if(key=='w' || key=='W'){
     background(White);
  }
  
  if(key=='z' || key=='Z') {
      Undo();
  }
  
  else if(key=='y' || key=='Y') {
      Redo();  
  } 
  
  else {
    arrayCopy(UndoMatrix1, UndoMatrix2);
    arrayCopy(pixels, UndoMatrix1);
    loadPixels();
  }
}

