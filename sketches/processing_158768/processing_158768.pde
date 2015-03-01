
int _num = 120;
Box[] _BoxArr = {};   
color[] blues1 = {#00bae5, #2f79ff, #74d1ff, #13a3f7, #006eeb, #003380};
color[] blues2 = {#6155ff, #8582ff, #4d00f7, #6924ff, #7466ff, #351280};
color[] greens = {#009b42, #72c900, #0ab300, #9ed927, #008a46, #004d26};
color[] oranges = {#f7b81c, #ffdd00, #ff8b00, #ff4f00, #f67d00, #802200};
color[] reds = {#f50a24, #d5000e, #ff574d, #ff574d, #ed1429, #800009};
color[] pinks = {#e83d56, #f74179, #e63262, #cd007f, #f94e91, #800046};
color[] purples = {#5f189e, #8c3db8, #a83ac5, #a352cc, #6d3cc5, #511273};
color[] colors[] = {blues1, greens, oranges, reds, pinks, purples, blues2, blues1, greens, oranges, reds};
int[] widths = {196, 158, 118, 174, 132, 106, 184, 120, 192, 98, 122};

int counter = 0;

void setup() {
  size(1024,768);
  bgBars thisBG = new bgBars();
  background(0);
  smooth();
  //strokeWeight(1);
  //fill(150, 50);
  
  drawBoxes();
}

void draw() {
  //background(0);
  bgBars thisBG = new bgBars();
  for (int i=0; i<_BoxArr.length; i++) {
    counter += 1;
    Box thisBox = _BoxArr[i];
    thisBox.updateMe();
  }
}

void mouseReleased() {
  //Box thisBox = _BoxArr[0];
  //background(0);
  drawBoxes();
  //_BoxArr = {};
}

void drawBoxes() {
  for (int i=0; i<_num; i++) { 
    Box thisBox = new Box(i);
    thisBox.drawMe();
    _BoxArr = (Box[])append(_BoxArr, thisBox);
  }
}


//================================= objects

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
      localWidth = (widths[w] * width)/1600;
      rect(prevX,0, localWidth,height);
      prevX +=localWidth;
    }
  }
}

class Box {

  // properties
  float x, y;
  float boxW; 
  color linecol, fillcol; 
  float alph;
  int triDir; //triangle? and if so, which way?
  int whichDir; //which way to move: x or y?
  float ymove, ymoveVar;
  int whichColor;
  float localWidth;
  
  // constructor
  Box (int locali) {
    whichColor = round(random(colors.length -1));
    localWidth = round(widths[whichColor] * width)/1600; //based on 1600 pixel wide screen
    x = 0;
    for(int q=0; q<whichColor; q++){
      x += round(widths[q] * width)/1600;
    }
    y = random(height);
    boxW = localWidth;
    
    fillcol = colors[whichColor][round(random(5))];
    alph = 25 + round(75); //for triangle
    triDir = round(random(4)); //for triangle 0 = none
    //whichDir = round(random(1)) + 1;
    //xmove = (round(random(1)) * 2 - 1) * boxW/50;   
    //ymove = (round(random(1)) * 2 - 1) * boxW/37;  
    ymove = (round(random(1)) * 2 - 1) * (random(10) + 1)/2;
    ymoveVar = 500 + random(500);
  }
  
  // method - render me to screen
  void drawMe() { 
    noStroke(); 
    fill(fillcol, alph);
    rect(x, y, boxW, boxW);
    
    if (triDir > 0){
      noStroke();
      fill(0, alph);
      switch(triDir) {
        case 0: 
          break;
        case 1:
          triangle(x,y, x,(y + boxW), (x + boxW),(y + boxW));
          break;
        case 2:
          triangle(x,y, (x + boxW),(y + boxW), (x + boxW), y);
          break;
        case 3:
          triangle((x + boxW),y, x,(y + boxW), (x + boxW),(y + boxW));
          break;
        case 4:
          triangle(x,(y + boxW), x,y, x,(y + boxW));
          break;
      }
    }
  }
  
  // method - called on the frameloop
  void updateMe() {
    
    //if(whichDir == 1){
      //x += xmove;
    //}else{
      
      y += sin(radians(counter/ymoveVar)) * ymove;
      //println(radians(counter/ymoveVar) + " " + (counter/ymoveVar));
    //}
    
    if (x > (width+boxW)) { x = 0 - boxW; }
    if (x < (0-boxW)) { x = width+boxW; }
    if (y > (height+boxW)) { y = 0 - boxW; }
    if (y < (0-boxW)) { y = height+boxW; }
    
    drawMe();
    //overlaps
    /*
   for (int i=0; i<_BoxArr.length; i++) {
      Box otherBox = _BoxArr[i];
      float locX = x + boxW/2;
      float locY = y + boxW/2;
      float oLocX = otherBox.x + (otherBox.boxW)/2;
      float oLocY = otherBox.y + (otherBox.boxW)/2;
    
      if (otherBox != this) {
        float dis = dist(locX, locY, oLocX, oLocY); 
        float overlap = dis - boxW/2 - otherBox.boxW/2; 
        if (overlap < 0) { 
          float midx, midy;
          if (locX < oLocX) {
            midx = locX + (otherBox.x - locX)/2;
          } else {
            midx = oLocX + (locX - oLocX)/2;
          }
          if (locY < oLocY) {
            midy = locY + (oLocY - locY)/2;
          } else {
            midy = oLocY + (locY - oLocY)/2;
          }
          midx += overlap/2;
          midy += overlap/2;
          //stroke(0, alph/2);
          noStroke();
          fill(fillcol, alph/2);
          //noFill();
          overlap *= -1;
          rect(midx, midy, overlap, overlap);
          //rotate(.001);
        }
      }
    }
    */
    //end overalps
  }
}





