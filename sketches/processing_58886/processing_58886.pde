
int start = 1;
int rid = start;
int x = 25;
int y = 25;
int g = 1;
int w = 0;

PImage b;


int[] answerArray = new int [65];


int[][] myArray = new int[65][8];
int[][] corArray = new int[65][2];

void setup() {
  b = loadImage("knight.png");
  size(400, 400);
  smooth();
  noStroke();
  frameRate(30);
  for (int i = 0; i < width; i += width/8) {

    for (int j = 0; j < height; j += height/8) {
      if (g == 1) {
        fill(200);
      }
      if (g == -1) { 
        fill(255);
      }

      rect(i, j, width/8, height/8);

      g*=-1;
    } 

    g*=-1;
  }
  stroke(0);
  
  for (int i = 1; i < 65; i++) {
    for (int j = 0; j < 2; j++) {
      if (j == 0) {
        corArray[i][j] = x;
        //println(x);
      }
      if (j == 1) {
        corArray[i][j] = y;
        //println(y);
      }
    }
    x += width/8;
    if (i % 8 == 0) {
      x = width/16;
      y += width/8;
    }
  }

  //creates possiblities
  for (int i = 0; i < 65; i++ ) {
    for (int po = 0; po < 8; po++) {
      if (po == 0) {
        int thenum = i + 6;
        if ((i + 7) % 8 == 0 || (i + 6) % 8 == 0) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      } 
      if (po == 1) {
        int thenum = i - 6;

        if (i % 8 == 0 || (i + 1) % 8 == 0) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      } 
      if (po == 2) {
        int thenum = i + 10;
        if (i % 8 == 0 || (i + 1) % 8 == 0) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      } 
      if (po == 3) {
        int thenum = i - 10;
        if ((i + 7) % 8 == 0 || (i + 6) % 8 == 0) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      } 
      if (po == 4) {
        int thenum = i + 15;
        if ((i + 7) % 8 == 0) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      } 
      if (po == 5) {
        int thenum = i - 15;
        if (i % 8 == 0) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      } 
      if (po == 6) {
        int thenum = i + 17;
        if (i % 8 == 0) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      } 
      if (po == 7) {
        int thenum = i - 17;
        if ((i + 7) % 8 == 0 ) {
          myArray[i][po] = 0;
        }
        else {
          myArray[i][po] = thenum;
        }
      }
      int zero = myArray[i][po]; 
      if (zero < 1 || zero > 64) {
        myArray[i][po] = 0;
      }
    }
  }
  //  for (int j = 0; j < 8; j++) {
  //      int p = myArray[34][j];
  //      println(p);
  //    }
  answerArray[0] = start; 


  for (int i = 1; i < 64; i++) {
    start = doIt(start);
   answerArray[i] = start; 
    
    
    
    println(answerArray[i]);
    //println(rid);
  }
    
}

void draw() {


  if (w < 63) {
    int num2 = 0;
    int num = 0;
    if (w < 64) {
      num = answerArray[w];

      num2 = answerArray[w+1];
    }
    //image(b, corArray[num][0]-25, corArray[num][1]-25);
    line(corArray[num][0], corArray[num][1], corArray[num2][0], corArray[num2][1]);
  }
  w++;
}


int doIt(int yup) {
  int counter = 0;
  int canidate = 0;
  //number of possibilities for a square
  for (int i = 0; i < 8; i++) {
    int hey = myArray[yup][i];

    if (hey != 0) {
      counter++;
    }
  }
  int[] posArray = new int [counter];//creates an array length of possiblities
  int posLoop = 0;
  int[] smallerArray = new int [counter];
  //
  for (int i = 0; i < 8; i++) {
    int hey = myArray[yup][i];
    if (hey != 0) {
      posArray[posLoop] = hey;
      posLoop++;
    }
  }

  for (int i = 0; i < counter; i++) {
    int yaboi = posArray[i];
    smallerArray[i] = fasho(yaboi);
  }
  //    for (int i = 0; i < smallerArray.length; i++) {
  //      int t = smallerArray[i];
  //      println(t);
  //    }
  for (int i = 0; i < smallerArray.length; i++) {
    int r = int(random(2));
    if (smallerArray[i] < smallerArray[canidate]) {
      canidate = i;
    }
    if (smallerArray[i] == smallerArray[canidate] && r == 0) {
        canidate = i;
    }
  
  }
 // println(canidate);
  //println(posArray[canidate]);
  for (int i = 0; i < 65; i++ ) {
    for (int po = 0; po < 8; po++) {
      if ( myArray[i][po] == posArray[canidate]) {
        //println(i); 
        myArray[i][po] = 0;
      }
       if ( myArray[i][po] == rid) {
        //println(i); 
        myArray[i][po] = 0;
      }
    }
  }
  //println(posArray[canidate]);
  return posArray[canidate];
}

int fasho(int options) {
  int c = 0;
  for (int i = 0; i < 8; i++) {
    int hey = myArray[options][i];

    if (hey != 0) {
      c++;
    }
  }
  return c;
}


