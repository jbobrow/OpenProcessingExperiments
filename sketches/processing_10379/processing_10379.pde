
// zx spectrum Screenshot viewer
// steven kay, june 2010
//
// I thought it would be interesting to mimic the loading screen
// of a ZX Spectrum game. Minus the border flashes, and mosquito-in-the-ear audio.
//
// you can find many other .scr files on worldofspectrum.org
// find the game you like in the archives, then download the .scr (raw screen dump file)

byte[] ram;    
// screen RAM image as byte array
// first 6144 bytes are screen data
// next 768 bytes are the 'attributes', the colours.

int[] px;      // bits for each pixel (0 or 1)
int[] pxaddr;  // corresponding RAM address for each pixel (used to draw progressively)
int[] paper;   // paper color, per pixel
int[] ink;     // ink color, per pixel

int OFFSET=0;
int SCALE=2; //scaling

// speccy color palette
// been really lazy and not impremented BRIGHT or FLASH ;-)
// 1-bit-per-channel color. Kids these days don't know they're born :-D

color[] palette = new color[] {
  color(0,0,0),
  color(0,0,255),
  color(255,0,0),
  color(255,0,255),
  color(0,255,0),
  color(0,255,255),
  color(255,255,0),
  color(255)
};

void setup() {
  
  //size(256*SCALE,192*SCALE);
  size(512,384);
  background(255);

  ram=loadBytes("Dizzy.scr");

  px=new int[256*192]; // done in scanline order (256 in row 0, then 256 in row 2 etc.)
  pxaddr=new int[256*192];
  
  // attributes only apply to 8x8 pixel blocks
  
  ink=new int[32*24];
  paper=new int[32*24];
  
  // read colour data (attributes)
  
  for (int row=0;row<24;row++) {
    for (int col=0;col<32;col++) {
      int offset=6144+(row*32)+col;
      byte val=ram[offset];
      byte _ink=byte(val&0x7);
      byte _paper=byte((val&0x38)>>3);
      ink[row*32+col]=_ink;
      paper[row*32+col]=_paper;
    }
  }
  
  // read video data
  
  for (int y=0;y<192;y++) {
    // display address 010[L4][L3][R2][R1][R0][L2][L1][L0][C4][C3][C2][C1][C0]
    // where C is column number (5 bits)
    // where L is line number (0..23, 5 bits)
    // where R is pixel row in line (0..8, 3 bits)
    int L=y/8;
    int R=y%8;
    int LPATT=((L&0x18)<<8)|((L&0x7)<<5);
    int RPATT=(R&0x7)<<8;
    for (int x=0;x<256;x++) {
      int C=x/8;
      int CPATT=C&0x1F;
      int BIT=7-(x%8);
      int ADDR=(((0x4000|LPATT)|RPATT)|CPATT)-16384;
      px[y*256+x]=((ram[ADDR]&(0x1<<BIT))>>BIT);
      pxaddr[y*256+x]=ADDR;
    }
  }  
}

void renderRAM() {
  // the first 6144 bytes are in black and white as the colour hasn't loaded yet
  for (int y=0;y<192;y++) {
    for (int x=0;x<256;x++) {
      int address=0,pix=0,pix_paper=0,pix_ink=0;
      int attrrows=0, attrcols=0;
      address=pxaddr[y*256+x];
      pix=px[y*256+x];
      if(pix==0) fill(255);
      if(pix==1 & address<OFFSET) fill(0);
      rect(x*SCALE,y*SCALE,SCALE,SCALE);
    }
  }
}

void renderRAMwithATTRS(int offset) {
  // mimic loading of attributes (colour bytes)
  // now we're loading colour data..
  int rowsloaded=(offset-6144)/32;
  int colsloaded=(offset-6144)%32;
  int ymax=rowsloaded*8;
  int xmax=colsloaded*8;
  for (int y=0;y<192;y++) {
    for (int x=0;x<256;x++) {
      int address=0,pix=0,pix_paper=0,pix_ink=0;
      int attrrows=0, attrcols=0;
      
      address=pxaddr[y*256+x];
      pix=px[y*256+x];
      
      // loaded colours
      pix_paper=paper[((y/8)*32)+(x/8)];
      pix_ink=ink[((y/8)*32)+(x/8)];
      
      // mimic the scan line of colour bytes being loaded
      // each byte affects an 8x8 pixel block
      
      if (y<ymax-8) {
        // loaded colour for whole row
        if(pix==0) fill(palette[pix_paper]);
        if(pix==1) fill(palette[pix_ink]);
      } else {
        if (y<ymax & x<xmax) {
          // loaded colour for part of a row
          if(pix==0) fill(palette[pix_paper]);
          if(pix==1) fill(palette[pix_ink]);
        } else {
          // not yet loaded colour
          if(pix==0) fill(255);
          if(pix==1 & address<OFFSET) fill(0);
        }
      }
      rect(x*SCALE,y*SCALE,SCALE,SCALE);
    }
  }
}

void draw() {
  // tweak this to define number of bytes read from 'tape' per frame
  // Increase if you're impatient. I find 15 gives a similar speed to the original speccy.
  OFFSET+=15; 
  
  noStroke();
  if (OFFSET<=6144) {
    // monochrome bit, first 6144 bytes
    renderRAM();
  } else {
    // started loading attrs (color data)
    renderRAMwithATTRS(OFFSET);
  }
}

