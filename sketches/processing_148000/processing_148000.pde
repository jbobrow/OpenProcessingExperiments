

int posx,posy;
int oldposx, oldposy;
int state;
int dir;
int[][] world;
int moves;
int wsize = 500;
int filled;
int last_filled;
int current_diff;
int current_col;
 
Rule[][] rules = new Rule[4][4];
 
class Rule {
  int next_col;
  int next_state;
  int direction;
  
  Rule(int a,int b,int c) {
    next_col = a;
    next_state = b;
    direction = c;
  }
  
  Rule() {
    next_col = (int)floor(random(3.9999));
    next_state = (int)floor(random(3.9999));
    direction =  (int)floor(random(7.9999));
  }

} 
 
void setup() { 
  size(wsize,wsize);
  colorMode(RGB,255);
  world = new int[wsize][wsize]; 
  reset();  
  noStroke();
  noSmooth();
} 
 
void draw() 
{   

  for(int i=0;i<200;i++) {
    move_turmite();
    switch( current_col ) {
      case 0: fill(192,100,0,100); rect(oldposx,oldposy,1,1); break;
      case 1: fill(50,50,192,100); rect(oldposx,oldposy,1,1); break;
      case 2: fill(50,192,100,100); rect(oldposx,oldposy,1,1); break;
      case 3: fill(255,100); rect(oldposx,oldposy,1,1); break;
    }
  }
  
  //few reset conditions
    if( (moves>1000) && (filled < 50) ) { reset();}
    if( (moves>5000) && (filled < 500) && (current_diff ==0) ) { reset();}
    if( (moves>20000) && (current_diff == 0) && (filled < 1000) ) {reset();}
  
  fill(0);
  rect(0,0,150,30);
  fill(200);
  text("Moves made = "+moves,10,10);
  text("Filled cells = " +filled,10,20);
}


void move_turmite() {
  moves ++;
  int col = world[posx][posy];
  Rule r = rules[col][state];
  
  if( (col > 0) && (r.next_col == 0) ) { filled--; }
  if( (col == 0) && (r.next_col > 0) ) { filled++; }
  
  //calculate growth rate
   if( (moves % 100) == 0 ) {
      current_diff = filled - last_filled;
      last_filled = filled;
    }
  
  oldposx = posx;
  oldposy = posy;
  current_col = r.next_col;
  world[posx][posy] = r.next_col;
  state = r.next_state;    

  dir = (dir + r.direction) % 8;

  switch(dir) {
    case 0: posy--; break;
    case 1: posy--; posx++; break;
    case 2: posx++; break;
    case 3: posx++; posy++; break;
    case 4: posy++; break;
    case 5: posy++; posx--; break;
    case 6: posx--; break;
    case 7: posx--; posy--; break;
  }

  if(posy<0) {posy=wsize-1;}
  if(posy>=wsize) {posy=0;}
  if(posx<0) {posx=wsize-1;}
  if(posx>=wsize) {posx=0;}
  
}

void mousePressed() {
  reset();
}

void reset() {
    background(0); 
    state = (int)floor(random(3.9999));;
    filled = 0;
    last_filled = 0;
    moves = 0;
    dir = 0;
    posx= wsize/2;
    posy= wsize/2;
 
    for(int i=0;i<4;i++)
        for(int j=0;j<4;j++)
          rules[i][j] = new Rule();

  // Set random cells to 'on' 
  for (int i = 0; i < wsize; i++) { 
    for (int j=0; j < wsize; j++) {
      world[i][j]=0;
    } 
  } 

  // init color
  world[posx][posy] = (int)floor(random(3.9999));
}
