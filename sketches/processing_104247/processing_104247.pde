
/*
To do list:
  -Change chaser to periodically shift selectedC to a new value (use a list of vivid colors, derive their complements)
  -Add a new effect (checkerboard - every other pixel with color + complement, and a 3-step animation)
  -Add mechanism to switch which effect is running, and UI to select between them
  -Change HSB color wheel to a grid of good solid colors (too many bad colors in the color hweel)
  -Abstract pixel mapping for 8 physical strips of pixels but N logical
  -Add a new effect (row-by-row shift or update)
  -Add a new effect (color random pixel, then color 2 random pixels, then 3, until all are colored)
  -Full lighting breathe pattern (change brightness on all lights simultaneously, using sine wave style algorithm)
  -Add ability to make chase run in reverse
  -Build as an android package and run on n7
  -Make a list of 'good' colors that will display well on LEDs
  -Implement a 'reset' that changes all pixels back to their original state
*/

//set global list of rows to simulate varying strip lengths
int[] rowList = {10, 10, 8, 12, 8, 13, 10, 10, 11, 12 , 7, 10, 10, 10};

ArrayList<Boxel> boxels;
ArrayList<Palette> palettes;
int frameIndex;
color selectedC; //User selected color that effects use as a base

/*----------------- Effects listed here ---------------*/
ChaseFX chase;
CheckerFX checker;

/*----------------- Color palettes here ---------------*/



void createPalettes() {
    String p1[] = {
        "Winnersh triangle",
        "B68529",
        "FCE3B5",
        "F7F572",
        "B2FFFD",
        "07F7CB"
    };
    String p2[] = {
        "Hymn For My Soul",
        "2A044A",
        "0B2E59",
        "0D6759",
        "7AB317",
        "A0C55F"
    };
  String p3[] = {
    "gemtone",
    "1693A5",
    "02AAB0",
    "00CDAC",
    "7FFF24",
    "C3FF68"
  };
    String[][] plist = new String[][] {p1, p2, p3};
    palettes = new ArrayList<Palette>();
    for (int i = 0; i < plist.length; i++) {
        String pname = plist[i][0];
        color[] newColors = new color[plist[i].length - 1];
        //for (int j = 1; j < plist[i].length; j++) {
        for (int j = 0; j < newColors.length; j++) {
            newColors[j] = color(unhex("FF" + plist[i][j + 1]));
        }
        Palette newPalette = new Palette(pname, newColors);
        palettes.add(newPalette);
    }
}

void setup() {
  size(400, 600); //change this to 800 x 1200 for nexus 7
  background(255);
  colorMode(HSB);//, 360, 255, 255);
  boxels = new ArrayList<Boxel>();
  for (int i = 0; i < rowList.length; i++) {
    for (int j = 0; j < rowList[i]; j++) {
      Boxel newBoxel = new Boxel(j, i);
      boxels.add(newBoxel);
    }
  }
  chase = new ChaseFX();
  checker = new CheckerFX();
  noStroke();
  noSmooth();
  //translate(width * 0.25, height * 0.75);
  //saturationChanger(128,256);
  createPalettes();
  translate(0, height/2);
  float pHeight = height/palettes.size();
  for (int i = 0; i < palettes.size(); i++) {
    Palette palette = palettes.get(i);
    float pWidth = width * 0.75 / palette.colors.length;
    for (int j = 0; j < palette.colors.length; j++) {
        fill(palette.colors[j]);
        rect(0, 0, pWidth, pHeight);
      translate(pWidth, 0);
    }
    translate(-(pWidth * palette.colors.length), (height/2)/palettes.size());
  }
}

void draw(){
  frameIndex = (frameCount % boxels.size());
  doEffect();
  for (int i = 0; i < boxels.size(); i++) {
      Boxel b = boxels.get(i);
      render(b);
    }
}

void mousePressed() {
  selectedC = get(mouseX, mouseY);
}

void render(Boxel b) {
  if (b.currentC != b.lastC) {
    fill(b.currentC);
    b.setC(b.currentC);
    float ysize = (height/rowList.length)/2;
    float xsize = width/rowList[b.ypos];
    rect((xsize * b.xpos), (ysize * b.ypos), xsize, ysize);
  }
}

void doEffect() {
  //checker.FXloop();
  chase.FXloop();
}

void saturationChanger(int i, int initial){
 if(i > 0){
  colorTriangle(256,0,initial,initial);
  saturationChanger(i-1, initial-2);
 }
}

void colorTriangle(int iteration, int h, int s,int height){
 if(iteration > 0){
  fill(h%6,s,256);
  triangle(0,0,128*tan(radians(5.625/4)),height,-128*tan(radians(5.625/4)),height);
  rotate(radians(5.625/4));
  colorTriangle(iteration-1, h+1, s, height);
 }
}

class ChaseFX {
  int chaseFlip;

  ChaseFX() {
    chaseFlip = 1;
  }

  void FXloop() {
    int gradientWidth = 25;

    for (int i = 0; i < boxels.size(); i++) {
      if ((i >= (frameIndex - gradientWidth)) && ((i + 1) <= frameIndex)) {
        changeBri(i, (frameIndex - i));
      }
      if ((frameIndex <= gradientWidth) && (frameCount > gradientWidth)) { //skip the wrap case the first frames to create gradient
        int diff = gradientWidth - frameIndex;
        if (i >= (boxels.size() - diff)) {
          changeBri(i, (boxels.size() - i + frameIndex));
        }
      }
    }
  }

  void changeBri(int bIndex, int briChange) {
    Boxel b = boxels.get(bIndex);
    float bri = brightness(b.currentC);
    int increment = 2;
    if (brightness(b.currentC) > brightness(b.lastC)) {
      chaseFlip = 1;
    } else if (brightness(b.currentC) < brightness(b.lastC)) {
      chaseFlip = -1;
    }
    if ((bri + chaseFlip) > 100) {
      bri = 101;
      chaseFlip *= -1;
    } else if ((bri + chaseFlip) < 0) {
      bri = -1;
      chaseFlip *= -1;
    }
    color newC = color(hue(selectedC), saturation(selectedC), (bri + chaseFlip));
    b.setC(newC);
  }
}

class CheckerFX 
{  color color1;
  color c1complement;

  CheckerFX(){
    color1 = selectedC;
  }

  void FXloop() {
    if ((frameCount % 90) == 0) {
      color1 = selectedC;
      c1complement = color(0,0,0); // Currently setting this to black, because I don't know how to derive a color's complement and am on an airplane and can't look it up...
    }
    for (int i = 0; i < boxels.size(); i++) {
      Boxel b = boxels.get(i);
      if ((i % 2) == 0) {
        b.setC(color1);
      } else {
        b.setC(c1complement);
      }
    }
  }

}

class Boxel {
  color currentC;
  color lastC;
  int xpos;
  int ypos;

  Boxel(int tempXpos, int tempYpos) {
    currentC = color(0,0,1);
    lastC = color(0,0,0);
    xpos = tempXpos;
    ypos = tempYpos;
  }

  void setC(color newC) {
    lastC = currentC;
    currentC = newC;
  }
}

class Palette {
    String name;
    color[] colors;
    color[] complements;
    color curCol;
    color compCol;
    private int colCounter;

    Palette(String tempname, color[] tempcolors) {
        name = tempname;
        colors = tempcolors;
        complements = new color[colors.length];
        for (int i = 0; i < colors.length; i++) {
            complements[i] = this.getComplement(colors[i]);
        }
        colCounter = 0;
        curCol = colors[colCounter];
        compCol = complements[colCounter];
    }

    color getComplement(color startColor) {
        float startHue = hue(startColor);
        float complementHue;
        if (startHue <= 180) {
            complementHue = startHue - 180;
        } else {
            complementHue = startHue + 180;
        }
        color complementColor = color(complementHue, saturation(startColor), brightness(startColor));
        return complementColor;
    }

    void nextColor() {
        if (colCounter <= colors.length) {
            colCounter++;
        } else {
            colCounter = 0;
        }
        curCol = colors[colCounter];
        compCol = complements[colCounter];
    }
}
