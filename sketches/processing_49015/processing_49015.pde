
/** BlocksImage 12.12.2010 by Peter Bosshard<br />Imageblocks are falling down like snow until the picture is complete.<br />
 * Press numberkeys 0 through 9 to start rendering with different sizes.<br />
 */

String filename = "regenbogen.jpg";
// String outname = "Imageblock";
PImage sourceimage;
PImage img;
Imageblock[] pb;          // an array for the pixelblocks 
boolean[] feld;           // an array to mark occpied space
int blocksize;            // width and height of one block
int zeilen, spalten;      // columns and rows
int curridx;              // current index of the blocks array
PFont schrift;            // font for debug mode
int[] sizes;              // array with different part sizes
int currentsize;          // current size of a part
int currentframerate;     // current frame rate
int elapsed;              // elapsed time in seconds
int starttime;            // time as the process has been started in seconds

void setup() {
  // initialise size and framerate
  size(500, 500, P2D);
  // initialise font parameters
  schrift = loadFont("SansSerif-9.vlw");
  textFont(schrift);
  textAlign(CENTER);
  // initialize sizes
  sizes = new int[10];
  sizes[0] = 1;
  sizes[1] = 2;
  sizes[2] = 4;
  sizes[3] = 5;
  sizes[4] = 10;
  sizes[5] = 20;
  sizes[6] = 25;
  sizes[7] = 50;
  sizes[8] = 100;
  sizes[9] = 125;
  currentsize = sizes[5];
  currentframerate = 10;
  initialize();
}

void initialize() {
  starttime = (int(hour())*3600)+(int(minute())*60)+(int(second()));
  frameRate(currentframerate);
  // load the source image
  sourceimage = loadImage(filename);
  // initialise and fill the arrays
  blocksize = currentsize;
  zeilen = height/blocksize;
  spalten = width/blocksize;
  pb = new Imageblock[zeilen*spalten];
  feld = new boolean[zeilen*spalten];
  curridx = 0;
  for (int zl=0;zl<zeilen;zl++) {
    for (int sp=0;sp<spalten;sp++) {
      int idx=zl*spalten+sp;                 // index of the marked zones
      int imgidx = ((zeilen*spalten)-1)-idx; // reverse order of the image parts

      // initialise the blocks above the final picture
      img = createImage(blocksize, blocksize, RGB);
      img = (sourceimage.get(sp*blocksize, zl*blocksize, blocksize, blocksize));

      pb[imgidx] = new Imageblock(-blocksize, -blocksize, blocksize, img);
      feld[idx] = false; // no blocks are placed yet
    }
  }
  loop();
}

void draw() {
  background(color(0, 0, 0));

  // find a free random slot in the first row of the picture
  int slot = -1;
  if (curridx<(zeilen*spalten/2)) {
    slot = floor(spalten/3);
  }
  else {
    slot = -1;
  }

  while (slot < 0) {
    int zuf = floor(random(0, spalten));
    if (feld[zuf] == false) {
      slot = zuf;
    }
  }

  // place a block in the first row of the picture
  if ((pb[curridx].getY()<0)&&(slot != -1)) {
    pb[curridx].setY(0);
    pb[curridx].setX(slot*blocksize);

    // display the block
    pb[curridx].display();

    // mark the block
    int feldnr = pb[curridx].getX()/blocksize+pb[curridx].getY()/blocksize;
    feld[feldnr] = true;
  }
  // move allready placed blocks
  for (int i=0;i<curridx;i++) {

    int nx = pb[i].getX();                                       // current x-position
    int ny = pb[i].getY()+blocksize;                             // y-position underneath current block
    int nxl = nx-blocksize;                                      // x-position neighbour underneath left
    int nxr = nx+blocksize;                                      // x-position neighbour underneath right

    // find indices of the marker array
    int aktpix = (pb[i].getX()/blocksize)+((pb[i].getY()/blocksize)*(height/blocksize));                           // current block
    int midpix = (pb[i].getX()/blocksize)+((pb[i].getY()+blocksize)/blocksize*(height/blocksize));                 // neighbour underneath
    int leftpix = ((pb[i].getX()-blocksize)/blocksize)+((pb[i].getY()+blocksize)/blocksize*(height/blocksize));    // neighbour underneath left
    int rightpix = ((pb[i].getX()+blocksize)/blocksize)+((pb[i].getY()+blocksize)/blocksize*(height/blocksize));   // neighbour underneath right

    // if the block is inside the picture
    if ((midpix < feld.length)&&(leftpix >= 0)&&(leftpix < feld.length)&&(rightpix < feld.length)) {
      // if the neighbour underneath is not occupied then move the block
      if (feld[midpix] == false) {
        pb[i].setY(ny);
        feld[aktpix]=false;
        feld[midpix]=true;
      }
      // if the neighbour underneath left is not occupied and inside the picture then move the block
      else if ((feld[leftpix] == false)&&(midpix%spalten != 0)) {
        pb[i].setX(nxl);
        pb[i].setY(ny); 
        feld[aktpix]=false;
        feld[leftpix]=true;
      }
      // if the neighbour underneath right is not occupied and inside the picture then move the block
      else if ((feld[rightpix] == false)&&((midpix%spalten) != (spalten-1))) {
        pb[i].setX(nxr);
        pb[i].setY(ny);
        feld[aktpix]=false;
        feld[rightpix]=true;
      }
    }
    // update display
    pb[i].display();
  }
  // if not all blocks are placed in the picture increment the index of the current block
  if (curridx<(zeilen*spalten)-1) {
    curridx++;
  }

  // count the marked blocks in the picture 
  int cnt = 0;
  for (int zl=0;zl<zeilen;zl++) {
    for (int sp=0;sp<spalten;sp++) {
      int idx=zl*spalten+sp;
      if (feld[idx] == true) {
        cnt++;
      }
    }
  }

  // if all blocks are marked stop looping
  if (cnt == feld.length) {
    int now = (int(hour())*3600)+(int(minute())*60)+(int(second()));
    elapsed = now-starttime;
    println("Process with size " + currentsize + " used " + elapsed + " seconds");
    noLoop();
  }
}

// key commands
void keyPressed() {
  switch(key) {
  case '1':
    currentsize = sizes[0];
    currentframerate = 120;
    initialize();
    break;
  case '2':
    currentsize = sizes[1];
    currentframerate = 100;
    initialize();
    break;
  case '3':
    currentsize = sizes[2];
    currentframerate = 80;
    initialize();
    break;
  case '4':
    currentsize = sizes[3];
    currentframerate = 60;
    initialize();
    break;
  case '5':
    currentsize = sizes[4];
    currentframerate = 40;
    initialize();
    break;
  case '6':
    currentsize = sizes[5];
    currentframerate = 15;
    initialize();
    break;
  case '7':
    currentsize = sizes[6];
    currentframerate = 12;
    initialize();
    break;
  case '8':
    currentsize = sizes[7];
    currentframerate = 8;
    initialize();
    break;
  case '9':
    currentsize = sizes[8];
    currentframerate = 4;
    initialize();
    break;
  case '0':
    currentsize = sizes[9];
    currentframerate = 2;
    initialize();
    break;
  }
}


