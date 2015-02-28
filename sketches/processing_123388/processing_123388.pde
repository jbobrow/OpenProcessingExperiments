
/* Minesweeper
 * By Charles Carr
 *
 * Version 1.0
 *
 * This version of Minesweeper includes the following features.
 *  - A 10 by 10 board to play on.
 *  - Color coded numbers for visual players.
 *  - Different difficulties. Press '1', '2', '3', '4', and '5' to change difficulty.
 *    The higher the number, the more difficult. It will also change the title so that
 *    you know exactly what difficulty you're on.
 *    - '1' = Beginner Mode (12 mines)
 *    - '2' = Intermediate Mode (16 mines)
 *    - '3' = Expert Mode (20 mines)
 *    - '4' = Master Mode (24 mines)
 *    - '5' = Impossible Mode (30 mines)
 *  - The ability to know when you hit a multitude of zeroes and auto click where it
 *    is obvious because nothing can be adjacent sideways nor diagonally to a zero.
 *  - The ability to restart the game at any time by pressing ENTER.
 */

// Width and Height of the window
int WIDTH = 500;
int HEIGHT = 500;

// Hold all of the places of the board in memory
// [x-location][y-location][visible/underneath]
// If the third cell is 0, that refers to the true value of the cell.
// If the third cell is 1, that refers to the visible value of the cell.
int[][][] board = new int[10][10][3];

// Know when the game is over
boolean gameover = false;

// Remember the mouse X and Y after re-executing the setup.
// After re-executing the setup(), mouseX and mouseY are reset to 0.
// With these variables, we can say 'MAU_X = mouseX' at the end of
//   before the setup, and 'mouseX = MAU_X' after setup to retain the
//   mouses value. I do this because when the game is restarted because
//   of a difficulty change or simply restarting, I don't want the mouseX
//   and momuseY to be reset. If they do, and you keep your mouse in the
//   same position before and after the setup(), when you click, it will
//   always interpret the click as if you clicked at (0,0), which
//   probably isn't where you had left your mouse.
int MAU_X = 1;
int MAU_Y = 1;

// 'difficulty' is the current difficulty.
// The 'final ints' are constants that determine the amount of mines
//   that will be placed in that difficulty.
int difficulty = 12;
final int D_BEGINNER = 12;
final int D_INTERMEDIATE = 16;
final int D_EXPERT = 20;
final int D_MASTER = 24;
final int D_IMPOSSIBLE = 30;

// The setup()
void setup()
{
    // Set the size to WIDTH and HEIGHT.
    size(500,500);
    
    // Set the stroke to a dark gray... almost black.
    stroke(50);
    
    // Change the title depending on what difficulty you're in.
    if (difficulty == D_BEGINNER)
    {
        frame.setTitle("Minesweeper - Beginner Mode");
    }
    if (difficulty == D_INTERMEDIATE)
    {
        frame.setTitle("Minesweeper - Intermediate Mode");
    }
    if (difficulty == D_EXPERT)
    {
        frame.setTitle("Minesweeper - Expert Mode");
    }
    if (difficulty == D_MASTER)
    {
        frame.setTitle("Minesweeper - Master Mode");
    }
    if (difficulty == D_IMPOSSIBLE)
    {
        frame.setTitle("Minesweeper - Impossible Mode");
    }
    
    // Initiate the board where all unshown cells (ie: board[][][0])
    //   are 0, which means that they aren't close to any mines.
    //   This is because the the mines haven't been placed yet.
    // Initiate the board where all visible cells (ie: board[][][1])
    //   are -1, which (in terms of visible cells) means DONT SHOW
    //   ANYTHING! Basically, if a visible cell is equal to -1, then
    //   it is as if you haven't clicked on it yet.
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            board[i][j][0] = 0;
            board[i][j][1] = -1;
        }
    }
    
    // Depending on the difficulty, put mines into the board randomly.
    // The higher the difficulty, the more mines will be placed.
    for (int count = 0; count < difficulty; count++)
    {
        // 'a' and 'b' are effectively x and y coordinates for the cells.
        int a = floor(random(10));
        int b = floor(random(10));
        
        // If the cell isn't already a mine,
        if (board[a][b][0] != -1)
        {
            // Make it a mine. (-1 on an unshown value means it's a mine)
            board[a][b][0] = -1;
        }
        else // Else if the cell has already be selected and a mine is already there,
        {
            // Lower the count by one so that this iteration can happen again.
            //   By allowing the iteration to happen again, a new mine can be
            //   placed in replacement of this duplicate mine.
            count--;
        }
    }
    
    // This double-for-loop basically assigns all the cells that aren't a mine
    //   to a value that is equal to the amount of mines near it. If a cell is
    //   near 3 mines, it will set the cell to a value of 3.
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            // If the currently-being-looked-at cell isn't a mine.
            if (board[i][j][0] != -1)
            {
                // Begin n as 0. This is the count of mines near this cell.
                int n = 0;
                
                // The following if-statements have been condenced for easier
                //   scrolling, because otherwise this would 3 times the amount
                //   of lines, and I'm too lazy to scroll through that.
                // Check the cell Northwest to this one.
                if (i != 0 && j!= 0) {if (board[i-1][j-1][0] == -1) {n++;}}
                
                // Check the cell North of this one.
                if (j != 0) {if (board[i][j-1][0] == -1) {n++;}}
                
                // Check the cell Northeast of this one.
                if (i != 9 && j != 0) {if (board[i+1][j-1][0] == -1) {n++;}}
                
                // Check the cell East of this one.
                if (i != 9) {if (board[i+1][j][0] == -1) {n++;}}
                
                // Check the cell Southeast of this one.
                if (i != 9 && j != 9) {if (board[i+1][j+1][0] == -1) {n++;}}
                
                // Check the cell South of this one.
                if (j != 9) {if (board[i][j+1][0] == -1) {n++;}}
                
                // Check the cell Southwest of this one.
                if (i != 0 && j != 9) {if (board[i-1][j+1][0] == -1) {n++;}}
                
                // Check the cell West of this one.
                if (i != 0) {if (board[i-1][j][0] == -1) {n++;}}
                
                // Assign this cell the number of bordering mines.
                board[i][j][0] = n;
            }
        }
    }
    
    // Make sure the mouse remembers its previous position if the setup()
    //   happens more than once.
    mouseX = MAU_X;
    mouseY = MAU_X;
}

// The draw()
void draw()
{
    // Set the background color to black.
    background(80);
    
    // Display the 10 by 10 grid.
    displayGrid();
    
    // Make the size of text be of size '20'
    textSize(20);
    
    calculateChances(tmx(),tmy());
    
    // For all cells...
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            // If the visible value for the cell is 0 or more, then it
            //   must have been clicked on, and therefore should display
            //   a number in that space on the grid between 0 and 8.
            if (board[i][j][1] >= 0)
            {
                // Each possible value between 0 and 8 has a different
                //   color associated with it. There's no rhyme or reason
                //   to why I chose these specific colors.
                switch(board[i][j][1])
                {
                    case 0: fill(0,180,0); break;
                    case 1: fill(0,0,150); break;
                    case 2: fill(120,150,0); break;
                    case 3: fill(200,0,0); break;
                    case 4: fill(0,190,100); break;
                    case 5: fill(200,200,200); break;
                    case 6: fill(100,150,200); break;
                    case 7: fill(200,150,100); break;
                    case 8: fill(100,0,0); break;
                }
                
                // After setting the color, display the number in the
                //   center of the box.
                text(board[i][j][1],i*50+20,j*50+32);
            }
            
            // If the cell contains a mine,
            if (board[i][j][0] == -1)
            {
                // and the game is over,
                if (gameover == true)
                {
                    // Show a red circle in the cell to indicate that this
                    //   cell contained a mine. In the end, if you lose,
                    //   all of the mines should appear on the screen in
                    //   this fashion.
                    fill(180,0,0);
                    ellipse(i*50+25,j*50+25,20,20);
                }
            }
            
            // If you have right clicked the cell, then give it a question
            //   mark. This is just like the original minesweeper.
            if (board[i][j][1] == -2)
            {
                fill(0,0,0);
                text("?",i*50+20,j*50+32);
            }
            
            if (board[i][j][2] >= 0 && board[i][j][1] != -2)
            {
                fill(board[i][j][2] * 2,255 - (board[i][j][2] * 2),0);
                textAlign(CENTER,CENTER);
                text(board[i][j][2] + "%",i*50+30,j*50+25);
                textAlign(BOTTOM,LEFT);
            }
        }
    }
    
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            board[i][j][2] = -1;
        }
    }
    
    // Initate a new variable 'done' to true.
    boolean done = true;
    
    // This loop checks all cells and is basically looking for the winning
    //   position. If you have not won, based off of checking your status on
    //   all of the cells, then done will be changed from true to false.
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            // If the currently-being-looked-at cell contains a mine,
            if (board[i][j][0] == -1)
            {
                // If you have a question mark on this mine,
                if (board[i][j][1] == -2)
                {
                    // Good job. You're doing something right.
                }
                else // Else if you don't have a question mark on the mine,
                {
                    // You can't possibly be done yet.
                    done = false;
                }
            }
            else // Else if it's not a mine
            {
                // and you have a question mark on it as if you think is
                //   is a mine,
                if (board[i][j][1] == -2)
                {
                    // Then you're wrong. It's not a mine, and therefore
                    //   you are not done yet.
                    done = false;
                }
            }
        }
    }
    
    // If you're truly done,
    if (done == true)
    {
        // Display the 'You Win' screen.
        fill(40,40,40,70);
        rect(0,0,WIDTH,HEIGHT);
        fill(0,180,0);
        textSize(100); textAlign(CENTER,CENTER);
        text("You Win!",WIDTH/2,HEIGHT/2);
        textSize(20);
        text("Press ENTER to Replay.",WIDTH/2,4*(HEIGHT/5));
        textAlign(BOTTOM,LEFT);
    }
    
    // If you clicked on a mine,
    if (gameover == true)
    {
        // Display the 'You Lose' screen.
        fill(40,40,40,70);
        rect(0,0,WIDTH,HEIGHT);
        fill(0,180,0);
        textAlign(CENTER,CENTER);
        text("You Lose. Press ENTER to Replay.",WIDTH/2,HEIGHT/2);
        textAlign(BOTTOM,LEFT);
    }
}

// Quickly calculate the x-value of the cell your mouse is pointing at.
int tmx()
{
    return mouseX/50;
}

// Quickly calculate the y-value of the cell your mouse is pointing at.
int tmy()
{
    return mouseY/50;
}

// If you clicked the mouse,
void mousePressed()
{
    // And the button you clicked was the LEFT one,
    if (mouseButton == LEFT)
    {
        // If the cell you clicked isn't a mine,
        if (board[tmx()][tmy()][0] >= 0)
        {
            // Then assign the visible value of that cell to the unshown
            //   value of the cell.
            board[tmx()][tmy()][1] = board[tmx()][tmy()][0];
        }
        
        // If the cell you clicked is specifically a zero,
        if (board[tmx()][tmy()][0] == 0)
        {
            // Set the visible value to 0.
            board[tmx()][tmy()][1] = 0;
            
            // Then we need to check and see if bordering cell are also
            //   a zero or a non-mine.
            checkOtherZeros(tmx(),tmy());
        }
        else if (board[tmx()][tmy()][0] == -1) // Else if it's a mine,
        {
            // What can I say, you suck.
            gameover = true;
        }
    }
    
    // If you press the RIGHT mouse button,
    if (mouseButton == RIGHT)
    {
        // If there is no visible value of the cell,
        if (board[tmx()][tmy()][1] == -1)
        {
            // then apply the question mark to the cell. The reason I only
            //   do this to cells that have no visible value is becuase if
            //   a cell has a visible value, then it cannot possibly have
            //   a mine, and you probably misclicked.
            board[tmx()][tmy()][1] = -2;
        }
    }
}

// If you pressed a key on the keyboard.
void keyPressed()
{
    // If you press ENTER,
    if (keyCode == ENTER)
    {
        // Set gameover to false, because the game is restarting.
        gameover = false;
        
        // Remember where the mouse is at this moment.
        MAU_X = mouseX;
        MAU_Y = mouseY;
        
        // Rerun the setup() to re-distribute the mines.
        setup();
    }
    
    // If you press a number between '1' and '5', it will change the
    //   difficulty of the game and restart.
    if (key == '1')
    {
        difficulty = D_BEGINNER;
        gameover = false;
        MAU_X = mouseX;
        MAU_Y = mouseY;
        setup();
    }
    if (key == '2')
    {
        difficulty = D_INTERMEDIATE;
        gameover = false;
        MAU_X = mouseX;
        MAU_Y = mouseY;
        setup();
    }
    if (key == '3')
    {
        difficulty = D_EXPERT;
        gameover = false;
        MAU_X = mouseX;
        MAU_Y = mouseY;
        setup();
    }
    if (key == '4')
    {
        difficulty = D_MASTER;
        gameover = false;
        MAU_X = mouseX;
        MAU_Y = mouseY;
        setup();
    }
    if (key == '5')
    {
        difficulty = D_IMPOSSIBLE;
        gameover = false;
        MAU_X = mouseX;
        MAU_Y = mouseY;
        setup();
    }
}

// This is the magical function that checks bordering cells to
//   a cell with value 0 to see if it's OK to auto-click the cell.
// It would be OK to auto-click all cells bordering a cell that
//   is 0 because it cannot logically have a mine bordering it.
// It is also OK to auto-click all cells that are 0 and bordering
//   a non-zero/non-mine cell (ie: a cell with value 1). This
//   is because this algorithm spreads outward from the clicked
//   position and sometimes hits a non-mine/non-zero cell before
//   it reaches a 0 that should also be auto-clicked.
void checkOtherZeros(int x, int y)
{
    // These arrays are set in place to recheck other cells around
    //   the currently-being-looked-at cell if necessary.
    int[] a = new int[8];
    int[] b = new int[8];
    
    // Initiate the cells in both above arrays to zero.
    for (int i = 0; i < 8; i++)
    {
        a[i] = 0;
        b[i] = 0;
    }
    
    // Keep track of how many rechecks need to be calculated during
    //   this iteration of the recursion.
    int rechecks = 0;
    
    // Check the cell to the West of this one.
    if (x > 0)
    {
        // If that cell isn't a mine and is currently not showing a number,
        if (board[x-1][y][0] != -1 && board[x-1][y][1] == -1)
        {
            // Then set the visible cell value to the underlying value.
            board[x-1][y][1] = board[x-1][y][0];
            
            // If this new cell turned out to be another 0,
            if (board[x-1][y][0] == 0)
            {
                // Then this zero needs to have all of its bordering cells
                //   to be checked as well as the one we're currently looking
                //   at.
                // 'a[]' and 'b[]' keep track of the x and y location of the cell
                //   while 'rechecks' keeps track of the amount of cells that
                //   need to be rechecked at the end of this function.
                a[rechecks] = x-1;
                b[rechecks] = y;
                rechecks++;
            }
        }
    }
    
    // The rest of these do the same as the above one, except with different
    //   bordering cells, such as this next one being the Southwest bordering
    //   cell.
    if (x > 0 && y > 0)
    {
        if (board[x-1][y-1][0] != -1 && board[x-1][y-1][1] == -1)
        {
            board[x-1][y-1][1] = board[x-1][y-1][0];
            if (board[x-1][y-1][0] == 0)
            {
                a[rechecks] = x-1;
                b[rechecks] = y-1;
                rechecks++;
            }
        }
    }
    
    // The South bordering cell
    if (y > 0)
    {
        if (board[x][y-1][0] != -1 && board[x][y-1][1] == -1)
        {
            board[x][y-1][1] = board[x][y-1][0];
            if (board[x][y-1][0] == 0)
            {
                a[rechecks] = x;
                b[rechecks] = y-1;
                rechecks++;
            }
        }
    }
    
    // The Southeast bordering cell
    if (x < 9 && y > 0)
    {
        if (board[x+1][y-1][0] != -1 && board[x+1][y-1][1] == -1)
        {
            board[x+1][y-1][1] = board[x+1][y-1][0];
            if (board[x+1][y-1][0] == 0)
            {
                a[rechecks] = x+1;
                b[rechecks] = y-1;
                rechecks++;
            }
        }
    }
    
    // The East bordering cell
    if (x < 9)
    {
        if (board[x+1][y][0] != -1 && board[x+1][y][1] == -1)
        {
            board[x+1][y][1] = board[x+1][y][0];
            if (board[x+1][y][0] == 0)
            {
                a[rechecks] = x+1;
                b[rechecks] = y;
                rechecks++;
            }
        }
    }
    
    // The Northeast bordering cell
    if (x < 9 && y < 9)
    {
        if (board[x+1][y+1][0] != -1 && board[x+1][y+1][1] == -1)
        {
            board[x+1][y+1][1] = board[x+1][y+1][0];
            if (board[x+1][y+1][0] == 0)
            {
                a[rechecks] = x+1;
                b[rechecks] = y+1;
                rechecks++;
            }
        }
    }
    
    // The North bordering cell
    if (y < 9)
    {
        if (board[x][y+1][0] != -1 && board[x][y+1][1] == -1)
        {
            board[x][y+1][1] = board[x][y+1][0];
            if (board[x][y+1][0] == 0)
            {
                a[rechecks] = x;
                b[rechecks] = y+1;
                rechecks++;
            }
        }
    }
    
    // The Northwest bordering cell
    if (x > 0 && y < 9)
    {
        if (board[x-1][y+1][0] != -1 && board[x-1][y+1][1] == -1)
        {
            board[x-1][y+1][1] = board[x-1][y+1][0];
            if (board[x-1][y+1][0] == 0)
            {
                a[rechecks] = x-1;
                b[rechecks] = y+1;
                rechecks++;
            }
        }
    }
    
    // For as many rechecks that need to happen,
    for (int i = 0; i < rechecks; i++)
    {
        // Recall the function using the new coordinates.
        // This creates the recursion.
        checkOtherZeros(a[i],b[i]);
    }
}

void calculateChances(int x, int y)
{
    if (board[x][y][1] != -1)
    {
        int n = 0;
        int m = 0;
        
        int[] a = new int[8];
        int[] b = new int[8];
        
        if (x > 0)
        {
            if (board[x-1][y][1] <= -1)
            {
                a[n] = x-1;
                b[n] = y;
                n++;
                if (board[x-1][y][1] == -2)
                {
                    m++;
                }
            }
        }
        
        if (x > 0 && y > 0)
        {
            if (board[x-1][y-1][1] <= -1)
            {
                a[n] = x-1;
                b[n] = y-1;
                n++;
                if (board[x-1][y-1][1] == -2)
                {
                    m++;
                }
            }
        }
        
        if (y > 0)
        {
            if (board[x][y-1][1] <= -1)
            {
                a[n] = x;
                b[n] = y-1;
                n++;
                if (board[x][y-1][1] == -2)
                {
                    m++;
                }
            }
        }
        
        if (x < 9 && y > 0)
        {
            if (board[x+1][y-1][1] <= -1)
            {
                a[n] = x+1;
                b[n] = y-1;
                n++;
                if (board[x+1][y-1][1] == -2)
                {
                    m++;
                }
            }
        }
        
        if (x < 9)
        {
            if (board[x+1][y][1] <= -1)
            {
                a[n] = x+1;
                b[n] = y;
                n++;
                if (board[x+1][y][1] == -2)
                {
                    m++;
                }
            }
        }
        
        if (x < 9 && y < 9)
        {
            if (board[x+1][y+1][1] <= -1)
            {
                a[n] = x+1;
                b[n] = y+1;
                n++;
                if (board[x+1][y+1][1] == -2)
                {
                    m++;
                }
            }
        }
        
        if (y < 9)
        {
            if (board[x][y+1][1] <= -1)
            {
                a[n] = x;
                b[n] = y+1;
                n++;
                if (board[x][y+1][1] == -2)
                {
                    m++;
                }
            }
        }
        
        if (x > 0 && y < 9)
        {
            if (board[x-1][y+1][1] <= -1)
            {
                a[n] = x-1;
                b[n] = y+1;
                n++;
                if (board[x-1][y+1][1] == -2)
                {
                    m++;
                }
            }
        }
        
        for (int i = 0; i < n; i++)
        {
            board[a[i]][b[i]][2] = floor(100.0 * ((float)(board[x][y][1]-m) / (n-m)));
        }
    }
}

// This function just displays the grid in alternating colors.
// It also makes cells that have been clicked on brighten so
//   that you can track your progress more visually.
void displayGrid()
{
    // Keep track of whether the next cell should be dark or light.
    // This is so that we can alternate colors between cells.
    boolean darkorlight = true;
    
    // For all cells,
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 10; j++)
        {
            // If 'darkorlight' is true,
            if (darkorlight)
            {
                // If this cell has not been clicked on,
                if (board[i][j][1] == -1)
                {
                    // give it a dark color.
                    fill(60);
                }
                else // otherwise,
                {
                    // give it a slightly brighter color.
                    fill(100);
                }
            }
            else // Else if 'darkorlight' is false,
            {
                // If this cell has not been clicked on,
                if (board[i][j][1] == -1)
                {
                    // give it a dark color.
                    fill(70);
                }
                else // otherwise,
                {
                    // give it a slightly brighter color.
                    fill(110);
                }
            }
            
            // Set 'darkorlight' to its alternate value.
            // True becomes false, false becomes true.
            darkorlight = !darkorlight;
            
            // Draw the rectangulat grid piece.
            rect(i*50,j*50,50,50);
        }
        
        // Set 'darkorlight' to its alternate value.
        darkorlight = !darkorlight;
    }
}


