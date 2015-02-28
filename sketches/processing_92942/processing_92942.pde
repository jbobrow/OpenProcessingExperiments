
PFont font;
int range = 20;
Line[] lines= new Line[range];
boolean[][] supervisor;
int count=2;
int supercounter=0;
int superlimit= width;

//SETUP//////////////////////////////////////////////////////////
void setup() {
  //frameRate(1);
  size(800, 800);
  background(0);

  supervisor= new boolean[width][height];
  for (int i=0; i<supervisor.length; i++) {
    for (int j=0; j<supervisor[i].length; j++) {
      supervisor[i][j]=true;
    }
  }
}

//DRAW//////////////////////////////////////////////////////////
void draw() {
  //println(supervisor[0][0]);
  if (lines[lines.length-1]==null) {
    lines[0]= new Line(0, height/2, 100, height/2+100, 0);
    lines[1]= new Line(width/2-100, height-100, width/2, height, 0);
  }
  if (count<lines.length) {
    createLineInBetween(count);
    count++;
  }
  else {
    count=0;
  }
}
//DISPLAY ALL///////////////////////////////////////////////////
void displayAll(int count) {
  background(0);
  if (lines[lines.length-1]==null) {
    for (int i=0; i<=count; i++) {
      lines[i].display();
    }
  }
  else {
    for (int i=0; i<lines.length; i++) {
      lines[i].display();
    }
  }
}

//PEREVIOUS COUNTER/////////////////////////////////////////////
int getPrevCount(int count) {
  if (count==0) {
    return lines.length-1;
  }
  return count-1;
}

int getPrevPrevCount(int count) {
  if (count==1) {
    return lines.length-1;
  }
  if(count==0){
    return lines.length-2; 
  }
  return count-2;
}

//SUPERVISOR////////////////////////////////////////////////////
boolean supervisor(int x1, int y1) {
  println("s "+supercounter);
  if (supervisor[x1][y1]==true) {
    supercounter++;
    supervisor[x1][y1]=false;
    return true;
  }
  else {
    return false;
  }
}

class Line {
  color c;
  int x1, y1, x2, y2;
  int rangeWidth;
  int rangeHeight;
  int num;

  Line(int x1, int y1, int x2, int y2, int num) {
    this.x1=x1;
    this.y1=y1;
    this.x2=x2;
    this.y2=y2;
    this.num=num;
    rangeWidth=x2-x1;
    rangeHeight=y2-y1;
  }

  int getX1() {
    return x1;
  }
  int getY1() {
    return y1;
  }
  int getX2() {
    return x2;
  }
  int getY2() {
    return y2;
  }

  int getRangeWidth() {
    return rangeWidth;
  }

  int getRangeHeight() {
    return rangeHeight;
  }

//DISPLAY LINE //////////////////////////////////////////////////
  void display() {
    //rectangle();
    //c=color(255, 100);
    c=color(x1*255/width, y1*255/height, 0, 100);
    stroke(c);
    strokeWeight(5);
    fill(255, 0, 0, 70);
    //text(num+"/"+count, x2, y2);
    line(x1, y1, x2, y2);
    point(x1, y1);
  }

  void rectangle() {
    noFill();
    stroke(255, 0, 0);
    strokeWeight(1);
    rect(x1, y1, x2-x1, y2-y1);
  }
}

boolean enable = true;

void createLineInBetween(int count) {
  lines[count]=null;
  int x1 = returnMinX(count);
  int x2 = returnMaxX(count);
  int y1 = returnMinY(count);
  int y2 = returnMaxY(count);
  int randomX=0;
  int randomY=0;

    randomX = (int)random(x1, x2);
    randomY = (int)random(y1, y2);
    while (randomX>=width||randomX<0||randomX-100<0||randomX+100>width) {
      randomX = (int)random(x1, x2);
    }
    while (randomY>=height||randomY<0||randomY-100<0||randomY+100>height) {
      randomY = (int)random(y1, y2);
    }

  int random1 = (int)(pow(-1, (int)(random(1, 3))));
  int random2 = (int)(pow(-1, (int)(random(1, 3))));
  lines[count] = new Line(randomX, randomY, randomX+100*random1, randomY +100*random2, count);
  displayAll(count);
}

void createLineInRange(int count) {
  lines[count]=null;
  int x1 = lines[getPrevCount(count)].getX1(); 
  int y1 = lines[getPrevCount(count)].getY1(); 
  int x2 = lines[getPrevCount(count)].getX2(); 
  int y2 = lines[getPrevCount(count)].getY2(); 
  int rangeWidth = x2-x1;
  int rangeHeight = y1-y2;
  int randomX=0;
  int randomY=0;

  if (x2<x1) {
    int temp = x1;
    x1=x2;
    x2=temp;
  }
  if (y2<y1) {
    int temp = y1;
    y1=y2;
    y2= temp;
  }
  enable = true;
  println("#0 test enable ="+enable);
  while (enable==true) {
    println("#1 start");
    randomX = (int)random(x1, x2);
    randomY = (int)random(y1, y2);
    println("#2 randomX "+randomX+ " randomY " +randomY);
    while (randomX>=width||randomX<0) {
      println("#3 check randomX");
      randomX = (int)random(x1, x2);
      println("#4 randomX "+randomX);
    }
    while (randomY>=height||randomY<0) {
      println("#5 check randomY");
      randomY = (int)random(y1, y2);
      println("#6 randomY "+randomY);
    }
    if (supervisor(randomX, randomY)==true) {
      println("#7 check supervisor OK");
      break;
    }
    println("#9 end checking, enable="+enable);
  }
  println("#10 end while");
  //println(randomX+", "+randomY);
  int random1 = (int)(pow(-1, (int)(random(1, 3))));
  int random2 = (int)(pow(-1, (int)(random(1, 3))));
  println("#10 CREATE LINE");
  lines[count] = new Line(randomX, randomY, randomX+100*random1, randomY +100*random2, count);
  displayAll(count);
}

void createLineRandomPos(int count) {
  int x1 = (int)(random(width));
  int y1 = (int)(random(height));
  int random2 = (int)(pow(-1, (int)(random(1, 3))));
  int random1 = (int)(pow(-1, (int)(random(1, 3))));
  lines[count] = new Line(x1, y1, x1+100*random1, y1+100*random2, count);
}

void createLineOrderedPos(int count) {
  int x1 = count*width/range;
  int y1 = (int)(random(height));
  int random2 = (int)(pow(-1, (int)(random(1, 3))));
  int random1 = (int)(pow(-1, (int)(random(1, 3))));
  lines[count] = new Line(x1, y1, x1+100*random1, y1+100*random2, count);
}

int returnMaxX(int count) {
  int x1 = lines[getPrevCount(count)].getX1(); 
  int x2 = lines[getPrevCount(count)].getX2(); 
  int px1 = lines[getPrevPrevCount(count)].getX1(); 
  int px2 = lines[getPrevPrevCount(count)].getX2(); 

  int highest=x1;
  if (x2>highest) {
    highest=x2;
  }
  if (px1>highest) {
    highest=px1;
  }
  if (px2>highest) {
    highest=px2;
  }
  return highest;
}

int returnMinX(int count) {
  int x1 = lines[getPrevCount(count)].getX1(); 
  int x2 = lines[getPrevCount(count)].getX2(); 
  int px1 = lines[getPrevPrevCount(count)].getX1(); 
  int px2 = lines[getPrevPrevCount(count)].getX2(); 
  int lowest=x1;
  if (x2<lowest) {
    lowest=x2;
  }
  if (px1<lowest) {
    lowest=px1;
  }
  if (px2<lowest) {
    lowest=px2;
  }
  return lowest;
}

int returnMaxY(int count) {
  int y1 = lines[getPrevCount(count)].getY1();
  int y2 = lines[getPrevCount(count)].getY2();
  int py1 = lines[getPrevPrevCount(count)].getY1(); 
  int py2 = lines[getPrevPrevCount(count)].getY2(); 
  int highest=y1;
  if (y2>highest) {
    highest=y2;
  }
  if (py1>highest) {
    highest=py1;
  }
  if (py2>highest) {
    highest=py2;
  }
  return highest;
}

int returnMinY(int count) {
  int y1 = lines[getPrevCount(count)].getY1();
  int y2 = lines[getPrevCount(count)].getY2();
  int py1 = lines[getPrevPrevCount(count)].getY1(); 
  int py2 = lines[getPrevPrevCount(count)].getY2(); 
  int lowest=y1;
  if (y2<lowest) {
    lowest=y2;
  }
  if (py1<lowest) {
    lowest=py1;
  }
  if (py2<lowest) {
    lowest=py2;
  }
  return lowest;
}



