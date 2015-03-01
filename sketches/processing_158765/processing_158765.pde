
float xstart, xnoise, ystart, ynoise, offCent;
color boxColor;
int boxWidth;

/*-------colors-----*/
color[] blues1 = {#00bae5, #2f79ff, #74d1ff, #13a3f7, #006eeb, #003380};
color[] blues2 = {#6155ff, #8582ff, #4d00f7, #6924ff, #7466ff, #351280};
color[] greens = {#009b42, #72c900, #0ab300, #9ed927, #008a46, #004d26};
color[] oranges = {#f7b81c, #ffdd00, #ff8b00, #ff4f00, #f67d00, #802200};
color[] reds = {#f50a24, #d5000e, #ff574d, #ff574d, #ed1429, #800009};
color[] pinks = {#e83d56, #f74179, #e63262, #cd007f, #f94e91, #800046};
color[] purples = {#5f189e, #8c3db8, #a83ac5, #a352cc, #6d3cc5, #511273};
color[] colors[] = {blues1, greens, oranges, reds, pinks, purples, blues2, blues1, greens, oranges, reds};
int[] widths = {196, 158, 118, 174, 132, 106, 184, 120, 192, 98, 122};



void setup() {	
  size(1024,768);
  smooth();
  //background(0);
  boxWidth = round(width/(colors.length-1));
  bgBars thisBG = new bgBars();
  frameRate(24);
  
  xstart = random(10);
  ystart = random(10);
  
  xnoise = xstart;
  ynoise = random(10);
}

void draw() {
  //background(0);

  bgBars thisBG = new bgBars();
  xstart += 0.05;   
  ystart += 0.05;  
  
  xnoise = xstart;
  ynoise = ystart;
  
  for (int y = 0; y <= height; y+=boxWidth) {
    ynoise += 0.1;    
    xnoise = xstart;
    for (int x = 0; x < width; x+=boxWidth) {
      xnoise += 0.1;
      //println(floor(x/boxWidth) + " " + colors[floor(x/boxWidth)][2]);
      boxColor = colors[floor(x/boxWidth)][round(random(4))];
      drawPoint(x, y, noise(xnoise, ynoise));  
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  //pushMatrix();
  float len = boxWidth * noiseFactor * 1.5;
  if(len > boxWidth){
    len = boxWidth;
  }
  //translate(x,y);
  //rotate(noiseFactor * radians(540));
  noStroke();
  float locOpacity = 255 * (len/boxWidth);
  fill(0, locOpacity);
  //fill(boxColor);
  offCent = (boxWidth - len)/2;
  
  rect((x+offCent),(y+offCent), len, len);
  // rect(x, y, len, len);
  int triDir = round(random(4)); //for triangle 0 = none
  //add triangles
  /*
      if (triDir > 0){
      noStroke();
      fill(0, 125);
      switch(triDir) {
        case 0: 
          break;
        case 1:
          triangle((x+offCent),(y+offCent), (x+offCent),(y + len), (x + len),(y + len));
          break;
        case 2:
          triangle((x+offCent),(y+offCent), (x + len),(y + len), (x + len), (y+offCent));
          break;
        case 3:
          triangle((x + len),(y+offCent), (x+offCent),(y + len), (x + len),(y + len));
          break;
        case 4:
          triangle((x+offCent),(y + len), (x+offCent),(y+offCent), (x+offCent),(y + len));
          break;
      }
     }
  */
  
  //popMatrix();
}



//bg object
class bgBars{
  // properties
  int prevX;
  color localColor;
  int localWidth;
  
  // constructor
  bgBars(){
    drawBGBars();
  }
  
  // method
  void drawBGBars(){
    prevX = 0;
    for(int w=0; w<colors.length ; w++){
      localColor = colors[w][5];
      noStroke();
      fill(localColor);
      
      localWidth = boxWidth;
      rect(prevX,0, localWidth,height);
      prevX +=localWidth;
    }
  }
}




