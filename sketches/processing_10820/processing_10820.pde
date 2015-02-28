
/*
 * Daniel "weseven" Simionato, 2010.
 * weseven@gmail.com
 *
 */
 

static final int sqdim = 40;
static final int winwidth = 400;
static final int winheight = 400;
static final int numsqrow = (winwidth/sqdim);
static final int numsqcol = (winheight/sqdim);
static final int sqpadding = 5;
static final int fadevel = 10; //fading velocity
static final int randomness = 255;
static final int randbase = 16; //base value, to avoid "flashing" squares (squares that change colour too fast)

static boolean looping = false;


class MySquare{
  final int xpos;
  final int ypos;

  float randseed;
  float updated = 0;

  float sred = 0;
  float sgreen = 0;
  float sblue = 0;
  float salpha = 255;

  MySquare(int x, int y, float rand){
    xpos = x;
    ypos = y;
    randseed = rand;
  }

  MySquare(){
    xpos = 0;
    ypos = 0;
    randseed = 0;
  }

  final void display(){
    if(updated-randseed > 0){
      sred = random(256) ;
      sgreen = random(256);
      sblue = random(256);
      salpha = random(256);
      fill(sred, sgreen, sblue, salpha);
      rect(xpos, ypos, sqdim-sqpadding, sqdim-sqpadding);
      updated = 0;
    }
    else{
      fill(sred, sgreen, sblue, salpha - (updated+fadevel));
      rect(xpos, ypos, sqdim-sqpadding, sqdim-sqpadding);
      updated++;
    }
  }  

}

MySquare[][] squares = new MySquare[numsqrow][numsqcol];

void setup(){
  size(winwidth, winheight, P2D);
  noSmooth();
  background(0.0f, 0.0f, 0.0f);
  
  PFont font;

  font = loadFont("DroidSansMono-20.vlw");
  textFont(font);
  textMode(SCREEN);
  fill(128.0f, 128.0f, 128.0f, 256);
  String str = "C L I C K   T O \nS T A R T / P A U S E" ;
  text(str, winwidth/8, winheight/2);

  noStroke();

  for(int i=0; i<numsqrow; i++){
    for(int j=0; j<numsqcol; j++){
      squares[i][j] = new MySquare(i*sqdim, j*sqdim, random(randomness)+randbase); 
    }
  }
  
  noLoop();
}

void draw(){
  if(looping){
    background(0.0f, 0.0f, 0.0f);
    for(int i=0; i<numsqrow; i++){
      for(int j=0; j<numsqcol; j++){
        squares[i][j].display();
      }
    }
  }
}

void mousePressed(){
  if(!looping){
    loop();
    looping = true;
  }
  else{
    noLoop();
    looping = false;
  }      
}


