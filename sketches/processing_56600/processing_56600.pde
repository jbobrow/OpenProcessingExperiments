
//int W_WIDTH = screen.width/2;
//int W_HEIGHT = screen.height/2;
final int W_WIDTH = 896;
final int W_HEIGHT = 480;
int INPUT_LENGTH = 64;
List<Long[]> bitLines = new LinkedList<Long[]> ();
int CELL_SIZE = 7;

int PIXELS_PER_COL = 64;
int LINES_PER_FRAME = 1;
int RULE = 105;
int MAJOR_COLS = 0;
int GRID_HEIGHT = 0;
int GRID_WIDTH = 0;

int DRAW_METHOD = 0; // 0 for bitwise, 1 for words, 2 for bytes
final int DRAW_BITS = 0, DRAW_WORDS = 1, DRAW_BYTES = 2;

int COLOR_ROTATION = 0;
float COLOR_CYCLE_LENGTH = 60; // In seconds

Long[] input;

PFont fnt, smallFnt;
PGraphics pBuf = createGraphics (W_WIDTH,W_HEIGHT,JAVA2D);

void Reset () {
  MAJOR_COLS = W_WIDTH/CELL_SIZE/PIXELS_PER_COL;
  GRID_HEIGHT = W_HEIGHT/CELL_SIZE;
  GRID_WIDTH = PIXELS_PER_COL*MAJOR_COLS;
  COLOR_ROTATION = 0;
  input = new Long[MAJOR_COLS];
  bitLines.clear();
  for (int i=0; i<input.length; i++) input[i] = 0L;
  if ( (float)MAJOR_COLS % 2 == 0)
    input [MAJOR_COLS/2-1] = 1L;
  else
    input[MAJOR_COLS/2] = 1L << 32;
  bitLines.add (input);
  pBuf.beginDraw ();
  pBuf.background (0,0,0);
  pBuf.endDraw ();
}

void setup () {
  //size (W_WIDTH,W_HEIGHT);
  size (896,480);
  frameRate(30);
  noSmooth ();
  noStroke ();
  fnt = loadFont ("Lane-Narrow-48.vlw");
  smallFnt = loadFont ("Lane-Narrow-24.vlw");
  textFont (fnt,48);
  pBuf.beginDraw ();
  pBuf.background (0,0,0);
  pBuf.endDraw ();
  Reset ();
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
  }}); 
}

Long[] ComputeLine (Long[] inputStr, int rule) {
  Long[] output = new Long[MAJOR_COLS];
  long tripleMask = 0x07L;
  long remainder = 0L;

  for (int col=MAJOR_COLS-1; col>=0; col--) {
    long inSegment = inputStr[col];
    long outSegment = 0L;
    
    // Special case for first bit of output
    int token = (int) (((inSegment << 1) | remainder) & tripleMask);
    int ruleBit = 1 << token;
    if ((rule & ruleBit) == ruleBit)
      outSegment = outSegment | 1L;
      
    for (int i=0; i<=61; i++) {
      token = (int) ((inSegment >>> i) & tripleMask); // Get three-digit code (eg: 101)
      ruleBit = 1 << token; // Get bitmask to check rule
      if ((rule & ruleBit) == ruleBit) // Rule is draw pixel
        outSegment = outSegment | (1L << (i+1));
    }
    
    // Special case for last bit of output, if not on last column
    if (col > 0) {
      long nextSegment = inputStr[col-1];
      long firstBitMask = (nextSegment << 2) & tripleMask;
      token = (int) (((inSegment >> 62) | firstBitMask) & tripleMask);
      ruleBit = 1 << token;
      if ((rule & ruleBit) == ruleBit)
        outSegment = outSegment | (1L << 63);
    } else {
      token = (int) ((inSegment >> 62) & tripleMask);
      ruleBit = 1 << token;
      if ((rule & ruleBit) == ruleBit)
        outSegment = outSegment | (1L << 63);
    }
    
    remainder = inSegment >>> 63;
    output[col] = outSegment;
  }
  return output;
}

void PrintLine (Long[] inputStr) {
  for (int col=0; col<inputStr.length; col++) {
    print ("[");
    long inSegment = inputStr[col];
    for (int i=0; i<64; i++) {
      long bitMask = 1L << (63-i);
      if ((inSegment & bitMask) == bitMask) print ("1");
      else print ("0");
    }
    print ("]");
  }
  print ("\n");
}

void DrawBitLine (Long[] inputStr, int x, int y) {
  for (int col=MAJOR_COLS-1; col>=0; col--) {
    long inSegment = inputStr[col];
    for (int i=0; i<64; i++) {
      long bitMask = 1L << (63-i);
      if ((inSegment & bitMask) == bitMask) {
        pBuf.fill(0,200,0);
        pBuf.rect (col*CELL_SIZE*64 + x + i*CELL_SIZE + 1,y + 1, CELL_SIZE - 2,CELL_SIZE - 2);
      }
      else pBuf.fill(255,255,255);
    
    }
  }
}

void DrawWordLine (Long[] inputStr, int x, int y) {
  for (int col=MAJOR_COLS-1; col>=0; col--) {
    long inSegment = inputStr[col];
    for (int i=0; i<63; i+=2) {
      long bitMask = 3L;
      long digits = inSegment >> (62-i);
      long word = digits & bitMask;
      switch ((int) word) {
        case 0: continue;
        case 1: pBuf.fill (255,0,0);
                break;
        case 2: pBuf.fill (0,255,0);
                break;
        case 3: pBuf.fill (0,0,255);
                break;
      }
      pBuf.rect (col*CELL_SIZE*32 + x + (i/2)*CELL_SIZE + 1,y + 1, CELL_SIZE - 2,CELL_SIZE - 2);    
    }
  }
}

void DrawByteLine (Long[] inputStr, int x, int y) {
  for (int col=MAJOR_COLS-1; col>=0; col--) {
    long inSegment = inputStr[col];
    for (int i=0; i<61; i+=4) {
      long bitMask = 15L;
      long digits = inSegment >> (62-i);
      long word = digits & bitMask;
      if (word == 0) continue;
      
      float t = (TWO_PI) * (frameCount % (frameRate*COLOR_CYCLE_LENGTH)) / (float)(frameRate*COLOR_CYCLE_LENGTH);
      float n = (word+5) % 16;
      int r = (int) (sin(t)*75 +              180*(((int)word+0)%16)/16);
      int g = (int) (sin(t+(TWO_PI/3))*75 +   180*(((int)word+5)%16)/16);
      int b = (int) (sin(t+(2*TWO_PI/3))*75 + 180*(((int)word+10)%16)/16);
      pBuf.fill (r,g,b);
      pBuf.rect (col*CELL_SIZE*PIXELS_PER_COL + x + (i/4)*CELL_SIZE + 1,y + 1, CELL_SIZE - 2,CELL_SIZE - 2);    
    }
  }
}

void DrawLine (Long[] input, int idx) {
  switch (DRAW_METHOD) {
      case DRAW_BITS: DrawBitLine(input,0, idx*CELL_SIZE);
                      break;
      case DRAW_WORDS: DrawWordLine(input,0,idx*CELL_SIZE);
                       break;
      case DRAW_BYTES: DrawByteLine(input,0, idx*CELL_SIZE);
                       break;
    }
}

void draw () {
  background (0,0,0);
  pBuf.beginDraw ();
  
  if (bitLines.size() == 1) DrawLine (bitLines.get(0), 0);
  if (bitLines.size() + LINES_PER_FRAME > GRID_HEIGHT) {
    int nShift = (bitLines.size () + LINES_PER_FRAME) - GRID_HEIGHT;
    for (int i=0; i<nShift; i++) bitLines.remove (0);
    int pShift = nShift * CELL_SIZE;
    pBuf.copy (0,pShift,W_WIDTH,W_HEIGHT-pShift,0,0,W_WIDTH,W_HEIGHT-pShift);
    pBuf.fill (0,0,0);
    pBuf.rect (0,W_HEIGHT-pShift,W_WIDTH,pShift);
  }
  for (int i=0;i<LINES_PER_FRAME;i++) {
    input = ComputeLine (input, RULE);
    bitLines.add (input);
    
    DrawLine (input, bitLines.size()-1);
  }
  pBuf.endDraw ();
  image (pBuf,0,0);
  
  fill (0,0,0,128);
  rect (5,5,200,55);
  rect (5,W_HEIGHT-60,200,55);
  fill (255,255,255);
  textFont (fnt,48);
  text ("Rule " + Integer.toString(RULE),13,50);
  //textFont (smallFnt,24);
  text ("FPS:  " + Integer.toString((int)frameRate),13,W_HEIGHT-17);
}

Long[] PadBitstring (Long[] bitstring, int padding) {
  int paddingCols = padding / 64;
  int remainder = padding % 64;
  List<Long> paddedBitstring = new LinkedList<Long> ();
  for (int i=0; i<paddingCols; i++) paddedBitstring.add (0L);
  long remainingData = 0L;
  int startIdx = 0;
  if (remainder > 0) {
    long section = bitstring[0] >> remainder;
    remainingData = bitstring[0] << remainder;
    paddedBitstring.add (section);
    startIdx = 1;
  }
  for (int i=startIdx; i<bitstring.length; i++) {
    long section = bitstring[i];
    long newSection = (section >> remainder) | remainingData;
    if (remainder > 0) remainingData = section << remainder;
    paddedBitstring.add (newSection);
  }
  if (remainder > 0) {
    paddedBitstring.add (remainingData);
  }
  for (int i=0; i<paddingCols; i++) paddedBitstring.add (0L);
  Long[] r = new Long[paddedBitstring.size()];
  r = paddedBitstring.toArray (r);
  return r;
}

Long[] StripBitstring (Long[] bitstring, int amount) {
  int stripped = 0;
  int toStrip = amount;
  int bitsToKeep = bitstring.length * 64 - amount * 2;
  int keptSoFar = 0;
  List<Long> strippedBitstring = new LinkedList<Long> ();
  
  int idx = 0;
  for (toStrip=amount; toStrip>=64; toStrip-=64)
    idx += 1;
  for (int i=idx; i<bitstring.length && keptSoFar < bitsToKeep; i++) { 
    long section = bitstring[i];
    if (toStrip == 0) {
      strippedBitstring.add (section);
      keptSoFar += 64;
      if (keptSoFar > bitsToKeep) print ("kept too many bits!");
      continue;
    }
    long newSection = section << toStrip;
    long nextChunk = bitstring[i+1];
    newSection = newSection | (nextChunk >>> toStrip);
    strippedBitstring.add (newSection);
    keptSoFar += 64;
  }
  Long[] r = new Long[strippedBitstring.size()];
  r = strippedBitstring.toArray (r);
  return r;
}

void oldsetup () {
  Long[] bstr = new Long[2];
  Long[] padstr, padstr2, strpstr;
  bstr[0] = 1L;//(1L << 63);
  bstr[1] = 0L;
  padstr = PadBitstring(bstr,32);
  padstr2 = PadBitstring(padstr,96);
  PrintLine (bstr);
  PrintLine (padstr);
  strpstr = StripBitstring (padstr,32);
  
  //PrintLine (padstr2);
  PrintLine (strpstr);
}

void keyPressed () {
  if (keyCode == RIGHT) {
    RULE += 1;
    if (RULE > 255) RULE = 1;
  } else if (keyCode == LEFT) {
    RULE -= 1;
    if (RULE < 1) RULE = 255;
  } else if (keyCode == UP) {
    RULE += 10;
    if (RULE > 255) RULE = RULE - 255;
  } else if (keyCode == DOWN) {
    RULE -= 10;
    if (RULE < 1) RULE = 255 + RULE;
  }
}

void mousePressed () {
  if (mouseButton == LEFT) {
    //oldsetup (); print ("\n");
    Long[] firstLine = bitLines.get(0);
    int oldLength = bitLines.size ();
    DRAW_METHOD += 1;
    if (DRAW_METHOD > 2) DRAW_METHOD = 0;
    Long[] newInput = null;
    switch (DRAW_METHOD) {
      case DRAW_BITS:  PIXELS_PER_COL = 64;
                       newInput = StripBitstring (firstLine, MAJOR_COLS*64*3/4/2);
                       break;
      case DRAW_WORDS: PIXELS_PER_COL = 32;
                       newInput = PadBitstring (firstLine, MAJOR_COLS*64/2);
                       break;
      case DRAW_BYTES: PIXELS_PER_COL = 16;
                       newInput = PadBitstring (firstLine, MAJOR_COLS*64/2);
                       break;
    }
    Reset ();
    bitLines.clear ();
    input = newInput;
    pBuf.beginDraw ();
    bitLines.add (input);
    DrawLine (input, 0);
    for (int i=0;i<oldLength-1;i++) {
      input = ComputeLine (input, RULE);
      bitLines.add (input);
      DrawLine (input, bitLines.size()-1);
    }
    pBuf.endDraw ();
  } else if (mouseButton == RIGHT) {
    Reset ();
  }
}

void mouseWheel (int delta) {
  LINES_PER_FRAME += delta;
  if (LINES_PER_FRAME < 0) LINES_PER_FRAME = 0;
}

