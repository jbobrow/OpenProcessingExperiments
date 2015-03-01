
import java.util.*;

/** Daniel Wyllie / 2013 <BR>
Audio Loop by http://www.looperman.com/loops/detail/50655 <BR>
Sound effects by http://www.freesfx.co.uk/soundeffects <BR>
*/

// ----------------------------
// Chocolate Shuffle - Final Project 
// by Daniel Wyllie
// Javascript Mode
// ----------------------------

PImage img;
Board board;
int tick;

final int N = 4;
final int side_length = 60;
int       squares_number = 0;
int       wins     = 0;
int       loses    = 0;
int       quiets   = 0;
int       outcome  = 3;
String[]  results = {"Now click the tiles that appeared.",
                     "Correct! Let's try with more tiles.",
                     "Sorry, that wasn't right.",
                     "Click anywhere on the screen."};

boolean play_mode;

final color   normal_square_color = color(102,57,17);
final color   sorted_square_color = color(240,210,156);
final color   stroke_color        = color(52,27,7);
final int     stroke_weight       = 3;

final int START             = 0;
final int RANDOMIZE_SQUARES = 1;
final int SPLIT_QUADS       = 2;
final int ROTATE_QUADS      = 3;
final int JOIN_QUADS        = 4;
final int FIND_SQUARES      = 5;
final int SHOW_RESULTS      = 6;

int STATE;

// -----------
// Class Board
// -----------
class Board 
{  
  // PImage img;
  private List<Square> available_squares = new ArrayList<Square>();
  private List<Square> sorted_squares    = new ArrayList<Square>();
  private List<Square> picked_squares    = new ArrayList<Square>();
  
  final private int CLOCKWISE             = 1;
  final private int COUNTER_CLOCKWISE     = 0;
  private int[] quads_rot           = {CLOCKWISE, 
                                       CLOCKWISE,
                                       CLOCKWISE,  
                                       CLOCKWISE};
  private float tick                =  0;
  private float angle               =  0;
  
  // ---------------------------------------
  // Variables related to the four Quadrants
  // ---------------------------------------
  private int dist_center   = N*side_length/4;
  private int[] start_pos_x = new int[4];
  private int[] start_pos_y = new int[4];
  private float pos_x = 0;
  private float pos_y = 0;
  
  // ----------------
  // Method Description
  // ----------------
  public Board()
  {
    start_pos_x[0] = -dist_center;
    start_pos_y[0] = -dist_center;
    start_pos_x[1] =  dist_center;
    start_pos_y[1] = -dist_center;
    start_pos_x[2] = -dist_center;
    start_pos_y[2] =  dist_center;
    start_pos_x[3] =  dist_center;
    start_pos_y[3] =  dist_center;
    restart();
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void restart()
  {
    available_squares.clear();
    for (int row=0; row<N; row++)
    {
      for (int col=0; col<N; col++)
      {
        available_squares.add(new Square(row, col));   
      }
    }
    draw_static_board();
    STATE = RANDOMIZE_SQUARES;
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void sort_squares()
  {
    picked_squares.clear();
    sorted_squares.clear();

    if ((outcome == 0) || (outcome == 1))
    {
      squares_number++;
    }
    if (squares_number > 6)
    {
       squares_number = 1; 
    }
    for (int x=0; x<squares_number; x++)
    {   
      int index = (int)random(0, available_squares.size());  
      sorted_squares.add(available_squares.get(index));         
      available_squares.remove(index);
    }
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void draw_static_board()
  {
    image(img, 0, 0);
    for (int x=0; x<4; x++)
    {    
      pos_x = start_pos_x[x];
      pos_y = start_pos_y[x];
      draw_quads();
    }
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void animate_sorted_squares()
  {
    for (int x=0; x<sorted_squares.size(); x++)
    {
        sorted_squares.get(x).spin();
    }
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void show_picked_squares()
  {
    for (int x=0; x<picked_squares.size(); x++)
    {
      picked_squares.get(x).show();
    }
  }
   
  // ----------------
  // Method Description
  // ----------------
  private void translate_quads(boolean go)
  {
    for (int x=0; x<4; x++)
    {
      float end_pos_x = 1.5 * start_pos_x[x];
      float end_pos_y = 1.5 * start_pos_y[x];
      if (go)
      {
        pos_x = lerp(start_pos_x[x], end_pos_x, tick);
        pos_y = lerp(start_pos_y[x], end_pos_y, tick);
      }
      else
      {
        pos_x = lerp(end_pos_x, start_pos_x[x], tick);
        pos_y = lerp(end_pos_y, start_pos_y[x], tick);
      }
      draw_quads();
    }
    if (tick >= 1)
    {
      tick = 0;
      if (go)
      {
        random_rotation();
        update_squares();
        // inspect(sorted_squares);
        STATE = ROTATE_QUADS;
      }
      else
      {
        STATE = FIND_SQUARES;
        play_mode = true;
      }
    }
    tick += 0.05;
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void random_rotation()
  {
    for (int x=0; x<4; x++)
    {
      if ((int)random(0, 2) == 1) 
        quads_rot[x]  = CLOCKWISE;
      else 
        quads_rot[x]  = COUNTER_CLOCKWISE;
    }
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void draw_quads()
  {
    pushMatrix();
    translate(width/2, (height + 50)/2);
    translate(pos_x, pos_y);
    rotate(angle);
    
    for (int row=0; row<N/2; row++)
    {
      for (int col=0; col<N/2; col++)
      {
        stroke(stroke_color);
        fill(normal_square_color);
        rect(row*side_length -(N*side_length/4), 
             col*side_length -(N*side_length/4), 
             side_length, 
             side_length,5);
      }
    }
    popMatrix();
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void rotate_quads()
  {
    tick++;
    for (int x=0; x<4; x++)
    {    
      if (quads_rot[x] == CLOCKWISE)
      {
        angle = tick*PI/140;
      }
      else
      {
        angle = PI/2 - tick*PI/140;
      }
      pos_x = 1.5*start_pos_x[x];
      pos_y = 1.5*start_pos_y[x];
      draw_quads();
    }
    if (tick >= 70)
    {
      tick = 0;
      STATE = JOIN_QUADS;
    }
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void update_squares()
  {
    int rotation_direction = 0;
    // ----------------
    // N = 4
    // ---------------- 
    int row, new_row;
    int col, new_col;
    int[][][] board_counter_clockwise = { { { 1, 0 }, { 0, 0 }, { 1, 2 }, { 0, 2 } }, 
                                          { { 1, 1 }, { 0, 1 }, { 1, 3 }, { 0, 3 } }, 
                                          { { 3, 0 }, { 2, 0 }, { 3, 2 }, { 2, 2 } }, 
                                          { { 3, 1 }, { 2, 1 }, { 3, 3 }, { 2, 3 } } };

    int[][][] board_clockwise         = { { { 0, 1 }, { 1, 1 }, { 0, 3 }, { 1, 3 } }, 
                                          { { 0, 0 }, { 1, 0 }, { 0, 2 }, { 1, 2 } }, 
                                          { { 2, 1 }, { 3, 1 }, { 2, 3 }, { 3, 3 } }, 
                                          { { 2, 0 }, { 3, 0 }, { 2, 2 }, { 3, 2 } } };
   
    for (int x=0; x< sorted_squares.size() ; x++)
    {
      row = sorted_squares.get(x).get_row();
      col = sorted_squares.get(x).get_col();

      if ((row<N/2) && (col<N/2))
        rotation_direction = quads_rot[0];
      if ((row<N/2) && (col>=N/2))
        rotation_direction = quads_rot[1];
      if ((row>=N/2) && (col<N/2))
        rotation_direction = quads_rot[2];
      if ((row>=N/2) && (col>=N/2))
        rotation_direction = quads_rot[3];
        
      if (rotation_direction == CLOCKWISE)
      {
        new_row = board_clockwise[row][col][0];
        new_col = board_clockwise[row][col][1];
      }
      else
      {
        new_row = board_counter_clockwise[row][col][0];
        new_col = board_counter_clockwise[row][col][1];
      }
      sorted_squares.set(x, new Square(new_row, new_col));
    }
}
 
  // ----------------
  // Method Description
  // ----------------
  private void inspect(List<Square> array)
  { 
    for (int x=0; x<array.size(); x++)
    {
        int row = array.get(x).get_row();
        int col = array.get(x).get_col();
        print("["+ row + "," + col + "]");
    }
    println("----------------------");
  }
}  
  

// -----------
// Class Square
// -----------
class Square 
{
  private int    row;
  private int    col;
  private float  spin_tick  = 0;
  
  final private int START       = 0;
  final private int HIDE_NORMAL = 1;
  final private int SHOW_SORTED = 2;
  final private int KEEP_SORTED = 3;
  final private int HIDE_SORTED = 4;
  final private int END         = 5;
  final private int KEEP_QUIET  = 6;
  
  private int SPIN_STEP = START;
  
  // ----------------
  // Method Description
  // ----------------
  public Square(int row, int col)
  {
    this.row = row;
    this.col = col;
  }
  
  // ----------------
  // Method Description
  // ----------------
  private int get_row()
  {
    return this.row;
  }
  
  // ----------------
  // Method Description
  // ----------------
  private int get_col()
  {
    return this.col;
  }
  
  // ----------------
  // Method Description
  // ----------------
  private int get_pos_x()
  {
    return (col*side_length - N*side_length/2);   
  }
  
  // ----------------
  // Method Description
  // ----------------
  private int get_pos_y()
  {
    return row*side_length - N*side_length/2;
  }
            
  // ----------------
  // Method Description
  // ----------------
  private void basic_draw(color selected_color)
  {
    fill(selected_color);
    stroke(stroke_color);
    pushMatrix();
    translate(width/2, (height + 50)/2);
    rect(get_pos_x(), get_pos_y(), side_length, side_length,5);
    popMatrix();
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void show()
  {
    pushMatrix();
    translate(get_pos_x() + width/2, 
              get_pos_y() + (height + 50)/2);
    fill(52,27,7);
    rect(0, 0, side_length, side_length,5);
    switch(SPIN_STEP)
    {
      case KEEP_QUIET:
        fill(sorted_square_color);
        rect(0, 0, side_length, side_length,5);
        break;
      case START:
        fill(normal_square_color);
        rect(spin_tick/2, 0, side_length-spin_tick, side_length,5);
        break;
      case HIDE_NORMAL:
        fill(sorted_square_color);
        rect(side_length/2-spin_tick/2, 0, spin_tick, side_length,5);
        break;
      case SHOW_SORTED:
        fill(sorted_square_color);
        rect(0, 0, side_length, side_length,5);
        break;
      case KEEP_SORTED:
        fill(sorted_square_color);
        rect(0, 0, side_length, side_length,5);
        break;
      case END:
        fill(sorted_square_color);
        rect(0, 0, side_length, side_length,5);
        if ((board.sorted_squares.size() == 0) && (quiets == squares_number-1))
        {
          play_mode = false;
          outcome = 1; 
          quiets = 0;       
          wins++;
          SPIN_STEP = KEEP_QUIET;
          STATE = SHOW_RESULTS;
        }
        else
        {
          SPIN_STEP = KEEP_QUIET;
          quiets ++;
        }
        break;
    }   
    popMatrix();
    if ((SPIN_STEP != END) && (SPIN_STEP != KEEP_QUIET))
    {
      spin_tick += 12;
    }

    if ((spin_tick >= side_length) && (SPIN_STEP != KEEP_SORTED))
    {
      spin_tick = 0;
      SPIN_STEP ++;
    }
    
    if ((SPIN_STEP == KEEP_SORTED) && (spin_tick == side_length))
    {
      spin_tick = 0;
      SPIN_STEP = END;
    }
    
  }
  
  // ----------------
  // Method Description
  // ----------------
  private void spin()
  {
    pushMatrix();
    translate(get_pos_x() + width/2, 
              get_pos_y() + (height + 50)/2);
    fill(52,27,7);
    rect(0, 0, side_length, side_length,5);
    switch(SPIN_STEP)
    {
      case START:
        fill(normal_square_color);
        rect(spin_tick/2, 0, side_length-spin_tick, side_length,5);
        break;
      case HIDE_NORMAL:
        fill(sorted_square_color);
        rect(side_length/2-spin_tick/2, 0, spin_tick, side_length,5);
        break;
      case SHOW_SORTED:
        fill(sorted_square_color);
        rect(0, 0, side_length, side_length,5);
        break;
      case KEEP_SORTED:
        fill(sorted_square_color);
        rect(spin_tick/2, 0, side_length-spin_tick, side_length,5);
        break;
      case HIDE_SORTED:
        fill(normal_square_color);
        rect(side_length/2-spin_tick/2, 0, spin_tick, side_length,5);
        break;
      case END:
        fill(normal_square_color);
        rect(0, 0, side_length, side_length,5);
        spin_tick = 0;
        if (STATE == RANDOMIZE_SQUARES)
        {
          STATE = SPLIT_QUADS;
        }
        break;
    }   
    popMatrix();
   
    if ((spin_tick >= side_length) && (SPIN_STEP != SHOW_SORTED))
    {
      spin_tick = 0;
      SPIN_STEP ++;
    }
    else
    {
      spin_tick += 4;
    }

    if ((SPIN_STEP == SHOW_SORTED) && (spin_tick > 5*side_length))
    {
      spin_tick = 0;
      SPIN_STEP = KEEP_SORTED;
    }
  }
}

int hit_index = 0;

// ----------------
// Method Description
// ----------------
void setup()
{ 
  img = loadImage("choc.jpg");
  board = new Board();
  STATE = START;
  frameRate(60);
  size(480, 618);
  background(0,0,0);
  stroke(stroke_color);
  strokeWeight(stroke_weight);
  PFont f;
  f = createFont("Georgia", 24);
  textFont(f);
  textAlign(CENTER, CENTER);
  tick = 0;
  play_mode = true;
}

// ----------------
// Method Description
// ----------------
void draw()
{   
  switch(STATE)
  {
      case START:
        board.draw_static_board();
        waiting_message();
        break;
      case RANDOMIZE_SQUARES:
        board.animate_sorted_squares();
        break;
      case SPLIT_QUADS:
        image(img, 0, 0);
        board.translate_quads(true);
        break;
      case ROTATE_QUADS:
        image(img, 0, 0);
        board.rotate_quads();
        break;
      case JOIN_QUADS:
        image(img, 0, 0);
        board.translate_quads(false);
        break;
      case FIND_SQUARES:
        waiting_message();
        board.show_picked_squares();
        break;
      case SHOW_RESULTS:
        show_results();
        break;
   }
   
   fill(52, 27, 7);
   rect(440, 20, 100, 80);
   textSize(20);
   fill(210, 174, 126);
   text(wins, 456, 42); 
   text(loses, 456, 75); 
   fill(normal_square_color);

}

// ----------------
// Method Description
// ----------------  
void waiting_message()
{ 
  fill(sorted_square_color);
  rect(width/2-200,height/2+200,400,40,10);
  fill(stroke_color);
  text(results[outcome], width/2-24, height/2+220);
}

// ----------------
// Method Description
// ----------------  
void show_results()
{ 
  if (tick == 1)
  {
    fill(sorted_square_color);
    rect(width/2-200,height/2+200,400,40,10);
    fill(stroke_color);
    switch (outcome)
    {
      case 1:
        text(results[outcome], width/2-24, height/2+220);
      break;
      case 2:
        text(results[outcome], width/2-20, height/2+220);
      break;
    }
  }
  if (tick > 120)
  {
    tick = 0;
    board.restart();
    board.sort_squares();
    outcome = 0;
  }
  tick++; 
}

// ----------------
// Method Description
// ----------------
void mouseClicked()
{   
  // ----------------
  if (play_mode && (STATE == START || STATE == SHOW_RESULTS))
  {
    outcome = 0;
    board.restart();
    board.sort_squares();
  }

  // ----------------
  if (play_mode && (STATE == FIND_SQUARES))
  { 
    if (get_mouse_row_col()[2] == 1)
    {
      boolean guess        = false;
      boolean not_repeated = true;
      int row;
      int col;
      int[] actual_row_col = get_mouse_row_col();
      int row_guess = actual_row_col[0];
      int col_guess = actual_row_col[1];
      int index = 0;
      
      // Verifica se esta na lista de pickeds
      for (int x=0; x<board.picked_squares.size(); x++)
      {
        row = board.picked_squares.get(x).get_row();
        col = board.picked_squares.get(x).get_col();
        if ((row == row_guess) && (col == col_guess))
        {
          not_repeated = false;
        }
       }
      
      // Verifica se esta na lista de sorteados
      for (int x=0; x<board.sorted_squares.size(); x++)
      {
        row = board.sorted_squares.get(x).get_row();
        col = board.sorted_squares.get(x).get_col();
        if ((row == row_guess) && (col == col_guess))
        {
          board.picked_squares.add(new Square(row, col));
          guess = true;
          index = x;
        }
      }
       
       if (guess && not_repeated)
       {
          board.sorted_squares.remove(index);
       }
       
       if (!guess && not_repeated)
       {
         quiets = 0;
         fill(52,27,7);
         rect(col_guess*side_length +(width/2  -N*side_length/2), 
              row_guess*side_length +((height + 50)/2 -N*side_length/2), 
              side_length, 
              side_length,5);
         for (int x=0; x<board.sorted_squares.size(); x++)
         {
           board.sorted_squares.get(x).basic_draw(sorted_square_color);
         }    
         for (int x=0; x<board.picked_squares.size(); x++)
         {
           board.picked_squares.get(x).basic_draw(sorted_square_color);
         }       
         outcome = 2;
         play_mode = false;
         loses++;
         STATE = SHOW_RESULTS;
       }
    }
  }
}

// ----------------
// Method Description
// ----------------
int[] get_mouse_row_col()
{
   int[]   actual_row_col    = new int [3];
   actual_row_col[2] = 0;    // if 0 then guess is invalid
                             // if 1 then guess is valid
   for (int x=0; x<N; x++)
   {
    for (int y=0; y<N; y++)
    {
      if ((mouseX >= y*side_length    +(width/2  -N*side_length/2)) &&
          (mouseX < (y+1)*side_length +(width/2  -N*side_length/2)) &&
          (mouseY >= x*side_length    +((height + 50)/2 -N*side_length/2)) &&
          (mouseY < (x+1)*side_length +((height + 50)/2 -N*side_length/2)))
      {
        actual_row_col[0] = x;
        actual_row_col[1] = y;
        actual_row_col[2] = 1;
      }
    }
  } 
  return actual_row_col;
}


