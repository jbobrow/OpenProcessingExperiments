
// Daniel Shiffman, Nature of Code
// <http://www.shiffman.net>

/*"SWARM"
 by Robert Miller
 
 original image used can be found at
 http://images.kaneva.com/filestore9/4871600/6500131/artgalleryUpsion005UabstractUdigitalUartUfractalUPsytrip_ad.jpg
 */


PImage gr;//image renamed from original format to simplified title
float thresh =85; //threshold (0-255) -- whatever is brighter than this will be shown-added line a higher number will fill in the outline (try 200), 85 will llow it to start at the center and work outwards
int cellsize = 1;//cellsize set to 3 focuses on a moment..size 1 provides a more overall composition idea
int COLS, ROWS;//x and y coordinate system
// Game of life board
int[][] old_board, new_board;//arrays defined that will be interacting with each other

void setup()
{

  gr = loadImage ("art.jpg");//renames inserted file
  gr.loadPixels();
  //declaration to draw color information from pixels of image loaded
  size(500, 500);
  //image size
  smooth();
  //soften edges of ellipses
  
  // Initialize rows, columns and set-up arrays
  COLS = width/cellsize;//x coodinates
  ROWS = height/cellsize;//y coordinates
  old_board = new int[COLS][ROWS];//array one
  new_board = new int[COLS][ROWS];//array two
  // Call function to fill array with random values 0 or 1 dark and light
  initBoard();
  frameRate(5);//speed rate
}

void draw() {
  background(255);

  // Loop through every spot in our 2D array and check spots neighbors
  for (int i = 0; i < COLS;i++) {
    for (int j = 0; j < ROWS;j++) {
      int loc = i+j*width;//location
      color c =gr.pixels[loc];//loads pixels from image as color
      int nb = 0;
      // Note the use of mod ("%") below to ensure that cells on the edges have "wrap-around" neighbors
      // above row
      
      if (old_board[(i+COLS-1) % COLS ][(j+ROWS-1) % ROWS ] == 1) { 
        nb++;
      }//array rules i+ columns (y) -1 divided (%) by number of columns j +(x) rows minus 1 divided by rows. total equals 1 ( affects rate of color revelation)
      
      if (old_board[ i                ][(j+ROWS-1) % ROWS ] == 1) { 
        nb++;
      }
      if (old_board[(i+1)      % COLS ][(j+ROWS-1) % ROWS ] == 1) { 
        nb++;
      }
      // middle row
      if (old_board[(i+COLS-1) % COLS ][ j                ] == 1) { 
        nb++;
      }
      if (old_board[(i+1)      % COLS ][ j                ] == 1) { 
        nb++;
      }
      // bottom row
      if (old_board[(i+COLS-1) % COLS ][(j+1)      % ROWS ] == 1) { 
        nb++;
      }
      if (old_board[ i                ][(j+1)      % ROWS ] == 1) { 
        nb++;
      }
      if (old_board[(i+1)      % COLS ][(j+1)      % ROWS ] == 1) { 
        nb++;
      }

      // RULES OF "LIFE" HERE
      if      ((old_board[i][j] == 1.012) && (nb <  2.012)) { 
        new_board[i][j] = 0;
      }     
      /*loneliness-if set to 3 and all die, 2 sets controlled environment,
       4 creates a sped-up rate..idea is that to live a cell needs at least two neighbors if not it dies from underpopulation*/

      else if ((old_board[i][j] == 1) && (nb >  3)) { 
        new_board[i][j] = 0;
      }     
      /*overpopulation- needs to stay at one if not anything more will fill the screen with the image
       ...idea is that any cell that has more than three neighbors dies from overpopulation*/

      else if ((old_board[i][j] == 0) && (nb == 3)) { 
        new_board[i][j] = 1;
      }      
      /*reproduction- higher numbers will diminish output as well as low numbers. For best output one must stay at 3.
       idea is that any cell with two or three live neighbors continues to live to the the next generation*/

      else { 
        new_board[i][j] = old_board[i][j];
      } 
      // resurrection- any dead cell with three neighbors comes back to life.
    }
  }

  // RENDER game of life based on "new_board" values
  for ( int i = 0; i < COLS;i++) {
    for ( int j = 0; j < ROWS;j++) {
      if ((new_board[i][j] == 1)) {
        int loc = i+j*width;//canvas size defined
        color c =gr.pixels[loc];//selects pixel color of unlayed image

        stroke(c);//stroke must be used for color

        ellipse(i*cellsize, j*cellsize, cellsize, cellsize);//shapes to be used
      }
    }
  }

  // Swap old and new game of life boards
  int[][] tmp = old_board;
  old_board = new_board;
  new_board = tmp;
}

// Init board with random "alive" squares
void initBoard() {
  background(255);//set to white
  stroke(255);
  for (int i =0;i < COLS;i++) {
    for (int j =0;j < ROWS;j++) {
      if (brightness(gr.pixels[i + (j * ROWS)])>thresh) {
        /*rows=width--color is to start in the bright areas 
         while avoiding the dark areas..this starts the composition in time it will engulf dark areas too to reveal image*/

        old_board[i][j] = 1;
      } 
      else {
        old_board[i][j] = 0;
      }
    }
  }
}

// reset board when mouse is pressed
void mousePressed() {//resets composition by clicking on screen
  initBoard();
}










