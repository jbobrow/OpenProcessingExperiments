
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #428 Graphic novel
// http://geometrydaily.tumblr.com/post/49177905452/428-graphic-novel-i-could-imagine-doing-a-whole
//
// Controls:
// MouseClick   - redraw 
//
// Keys:
// Q/W    - remove/add one bgColorumn
// A/S    - remove/add one row
//
/////////////////////////////////////////////////

int sz = 700;
int bgColor = 235;
color clr = #C63434;

int hrzPiece = 3;
int vrtPiece = 3;
int cells;

int vrstart = 100;
int hrstart = 150;

int wdhLine = (sz-400)/10;
int wdhSpace = wdhLine/2;

int choise;
int [] boats;
int [][] cellsMap;

int hrzWdth = (sz-(hrstart*2) - (wdhSpace*(hrzPiece-1)))/vrtPiece ;    //Ñ�Ð¸Ñ�Ð¸Ð½Ð° Ð±Ð»Ð¾ÐºÐ° Ð¿Ð¾ Ð³Ð¾Ñ�Ð¸Ð·Ð¾Ð½Ñ�Ð°Ð»Ð¸
int vrtHgth = (sz-(vrstart*2) - (wdhSpace*(vrtPiece-1)))/hrzPiece;    //Ð²Ñ�Ñ�Ð¾Ñ�Ð° Ð±Ð»Ð¾ÐºÐ° Ð¿Ð¾ Ð²ÐµÑ�Ñ�Ð¸ÐºÐ°Ð»Ð¸

void setup() {
  size(sz, sz);
  noLoop();
}

void draw() {
  background(bgColor);
  setVars();
  int dir = 0;

  for (int i=boats.length-1, k=choise+1; i>=0; --i, --k) {
    boolean isEmpty = false;
    int lng = boats[i];
    int count = 0;

    while (!isEmpty) {
      dir = (int)random(2);
      int [] start = { (int)random(hrzPiece), (int)random(vrtPiece) };
      isEmpty = checkLine(cellsMap, start, lng, dir);

      if (isEmpty) {
        fillLine (cellsMap, start, lng, dir, k);
        int hrdir = dir==0? lng : 1 ;
        int vrdir = dir==1? lng : 1 ;
        image(createBlock (hrdir, vrdir), hrstart+ start[1]* hrzWdth, vrstart+ start[0]* vrtHgth);

        stroke(bgColor);
        strokeWeight(wdhSpace);
        noFill();
        rect(hrstart+ start[1]* hrzWdth, vrstart+ start[0]* vrtHgth, hrzWdth*hrdir, vrtHgth *vrdir);
      }
      
      count++;
      if (count > cells*cells) {  break;  }
    }
  }

  for (int i=0; i<cellsMap.length; ++i) {
    for (int j=0; j<cellsMap[i].length; ++j) {
      if (cellsMap[i][j]==0) {
        image(createBlock (1, 1), hrstart+ hrzWdth*j, vrstart+vrtHgth*i);
        stroke(bgColor);
        strokeWeight(wdhSpace);
        noFill();
        rect(hrstart+ j* hrzWdth, vrstart+ i* vrtHgth, hrzWdth, vrtHgth);
      }
    }
  }
  paper(30);
}

void setVars () {
  cells = hrzPiece * vrtPiece;
  choise = (int)random(min(hrzPiece, vrtPiece), cells + 1);
  boats = new int [choise];
  cellsMap = new int[hrzPiece][vrtPiece];
  wdhLine = (sz-400)/(4*max(hrzPiece, vrtPiece));
  wdhSpace = wdhLine/2;
  hrzWdth = (sz-(hrstart*2) - wdhSpace)/vrtPiece;    //Ñ�Ð¸Ñ�Ð¸Ð½Ð° Ð±Ð»Ð¾ÐºÐ° Ð¿Ð¾ Ð³Ð¾Ñ�Ð¸Ð·Ð¾Ð½Ñ�Ð°Ð»Ð¸
  vrtHgth = (sz-(vrstart*2) - wdhSpace)/hrzPiece ;    //Ð²Ñ�Ñ�Ð¾Ñ�Ð° Ð±Ð»Ð¾ÐºÐ° Ð¿Ð¾ Ð²ÐµÑ�Ñ�Ð¸ÐºÐ°Ð»Ð¸
  
  int i = 0;
  for ( ; i<boats.length; ++i) {
    boats[i] = 1;
  }

  for ( ;i<cells; ) {
    int bufRand = (int)random(boats.length);
    if (boats[bufRand] != max(hrzPiece, vrtPiece)) {
      boats[bufRand] += 1;
      ++i;
    }
  }
  
  comb_sort(boats);  
}


void comb_sort(int []input) {
    float shrink = 1.3f;
    int swap;
    int i = 0,
    gap =input.length;
    boolean swapped = false;
 
    while ((gap > 1) || swapped) {
        if (gap > 1) { gap = (int)((float)gap / shrink); }
         swapped = false;
 
        for (i = 0; gap + i < input.length; ++i) {
            if (input[i] - input[i + gap] > 0) {
                swap = input[i];
                input[i] = input[i + gap];
                input[i + gap] = swap;
                swapped = true;
            }
        }
    }
}


boolean checkLine (int [][] in_arr, int [] start, int lngth, int direct) {
  if (in_arr[start[0]][start[1]] != 0) {
    return false;
  }

  switch (direct) {
  case 0: {
      if ( start[1]+lngth >  cellsMap[start[0]].length) {
        return false;
      } else {
        for (int hr = start[1];  hr < start[1]+lngth; ++hr) {
          if (in_arr[start[0]][hr] != 0 ) {
            return false;
          }
        }
      }
      break;
    }
  case 1: {
      if ( start[0]+lngth >  cellsMap.length) {
        return false;
      } else {
        for (int vr = start[0];  vr < start[0]+lngth; ++vr) {
          if (in_arr[vr][start[1]] != 0 ) {
            return false;
          }
        }
      }
      break;
    }
  default: { return false; }
  }
  return true;
}  


void fillLine (int [][] in_arr, int [] start, int lngth, int direct, int num) {
  switch (direct) {
  case 0: {
      for (int hr = start[1];  hr < start[1]+lngth; ++hr) {
        in_arr[start[0]][hr] = num;
      }
      break;
    }

  case 1: {
      for (int vr = start[0];  vr < start[0]+lngth; ++vr) {
        in_arr[vr][start[1]] = num;
      }
      break;
    }

  default: {
      return;
    }
  }
}

PGraphics createBlock (int hrdir, int vrdir) {
  PGraphics blck = createGraphics(hrzWdth*hrdir, vrtHgth *vrdir);
  blck.beginDraw();
  blck.background(clr);
  blck.strokeWeight(wdhLine-wdhLine/5);
  blck.stroke(0);

  if (blck.width > blck.height  || random(1)>0.9) { 
    float bf = random(wdhLine, blck.height-wdhLine);
    blck.line(-10, bf, blck.width+10, random(bf-bf/3, bf+bf/3));
  } 
  else {
    float bf = random(wdhLine, blck.width-wdhLine);
    blck.line(bf, -10, random(bf-bf/3, bf+bf/3), blck.height+10);
  }   

  blck.endDraw();
  return blck;
}

void mouseClicked() { redraw(); }

void keyPressed() {
  if (key == 'a' || key == 's' || key == 'q' || key == 'w' ) {
    if      (key== 'a') { --hrzPiece;   } 
    else if (key== 's') {  ++hrzPiece;  } 
    else if (key== 'q') {  --vrtPiece;  } 
    else if (key== 'w') {  ++vrtPiece;  }

    hrzPiece = constrain(hrzPiece, 2, 5);
    vrtPiece = constrain(vrtPiece, 2, 5);
    redraw();
  }
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(bgColor-40, bgColor+30), in_val-2);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(70, 170), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}
