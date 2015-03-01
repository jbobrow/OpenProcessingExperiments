
/*
THINGS TO FIX:
en passant
castling
pawn promotion
check/checkmate and moves that leave the king in check
*/


int board_width;
int board_height;
int boardX;
int boardY;
color white;
color blue;
color dark_square;
color light_square;
square[][] all_squares = new square[8][8];
square prev_square;
piece white_king;
piece black_king;
piece white_queen;
piece black_queen;
piece white_rook1;
piece white_rook2;
piece black_rook1;
piece black_rook2;
piece white_bishop1;
piece white_bishop2;
piece black_bishop1;
piece black_bishop2;
piece white_knight1;
piece white_knight2;
piece black_knight1;
piece black_knight2;
PImage wk_image;
PImage bk_image;
PImage wq_image;
PImage bq_image;
PImage wr_image;
PImage br_image;
PImage wb_image;
PImage bb_image;
PImage wp_image;
PImage bp_image;
PImage wn_image;
PImage bn_image;
piece[] all_pieces = new piece[32];
piece[] pawn_array = new piece[16];
String color_to_move;



void setup() {
  size(500, 600);
  background(200);

  //init
  board_width = width - 1;
  board_height = height - 100;
  boardX = 0;
  boardY = 100;
  white = color(255);
  blue = color(0, 0, 255, 60);
  dark_square = color(175, 0, 0);
  light_square = color(192);
  all_squares = init_squares();
  color_to_move = "white";

  //setup board
  init_pieces();
  reset_square_color();
  setup_pieces();
  deselect_all();
  update_legal_moves();
}

void draw() {
}

void mousePressed() {
 
  update_legal_moves();

  //if you click on a square, if a white piece is selected and it's a legal move, move the piece
  //else deselect all pieces
  if (a_piece_is_selected()) {
    if (is_square_legal(get_mouse_square(), get_selected_piece())) {
      move_piece(get_selected_piece(), get_mouse_square());
    } else {
      deselect_all();
    }
  }

  //If you click a piece of your own color, select the piece
  if (piece_in_square(get_mouse_square())) {
    if (get_piece_in_square(get_mouse_square()).col.equals(color_to_move)) {
      deselect_all();
      get_piece_in_square(get_mouse_square()).selected = true;
      get_mouse_square().col(blue);
      get_piece_in_square(get_mouse_square()).draw_piece(get_mouse_square());
    }
  }
}

class square {
  float x;
  float y;
  float wid;
  float hei;
  String name;
  color def_color;

  square(float x_, float y_, float wid_, float hei_, String name_, color def_color_) {
    x = x_;
    y = y_;
    wid = wid_;
    hei = hei_;
    name = name_;
    def_color = def_color_;
  }

  boolean mouse_in() {
    if ((mouseX >= x && mouseX <= x + wid) && (mouseY >= y && mouseY <= y + hei)) {
      return true;
    } else {
      return false;
    }
  }

  void col(color square_fill_color) {
    stroke(0);
    strokeWeight(3);
    fill(square_fill_color);
    rect(x, y, wid, hei);
  }
}

class piece {
  square def_square;
  square current_square;
  square prev_square;
  PImage image;
  String col;
  square[] legal_moves;
  String type;
  int x_index;
  int y_index;
  boolean selected;

  piece(square def_square1, square current_square1, square prev_square1, PImage image1, String col1, String type1, int x_index1, int y_index1, boolean selected_) {
    def_square = def_square1;
    current_square = current_square1;
    prev_square = prev_square1;
    image = image1;
    col = col1;
    type = type1;
    x_index = x_index1;
    y_index = y_index1;
    selected = selected_;
  }
  
  void draw_piece(square sq) {
    image(image, sq.x + 5, sq.y + 5, sq.wid - 10, sq.hei - 10);
  }
}

String[] generate_square_list() {
  String[] square_list = new String[64];
  String letters = "abcdefgh";
  String numbers = "12345678";
  int index = 0;
  for (int n = 0; n < 8; n++) {
    for (int l = 0; l < 8; l++) {
      square_list[index] = (str(letters.charAt(l)) + str(numbers.charAt(n)));
      index += 1;
    }
  }
  return square_list;
}

square[][] init_squares() {
  String[] square_list = generate_square_list();
  int index = 0;  //to iterate through list of square names
  color col;
  for (int y = 0; y < 8; y++) {
    for (int x = 0; x < 8; x++) {
      //check if dark square or light square
      if ((is_even(x) && is_even(y)) || (is_odd(x) && is_odd(y))) {
        col = dark_square;
      } else {
        col = light_square;
      }

      all_squares[x][y] = new square(boardX + board_width / 8.0 * x, (height-2) - board_height / 8.0 * (y + 1), board_width/8.0, board_height / 8.0, square_list[index], col);
      index += 1;
    }
  }
  return all_squares;
}


boolean is_even(int x) {
  if (x % 2 == 0 || x == 0) {
    return true;
  } else {
    return false;
  }
}

boolean is_odd(int x) {
  if (x % 2 == 0 || x == 0) {
    return false;
  } else {
    return true;
  }
}

void reset_square_color() {
  for (int y = 0; y < 8; y++) {
    for (int x = 0; x < 8; x++) {
      all_squares[x][y].col(all_squares[x][y].def_color);
    }
  }
}

square get_mouse_square() {
  for (int y = 0; y < 8; y++) {
    for (int x = 0; x < 8; x++) {
      if (all_squares[x][y].mouse_in()) {
        return all_squares[x][y];
      }
    }
  }
  return null;
}




void setup_pieces() {
  for (int i = 0; i < 32; i++) {
    if (all_pieces[i] != null) {
      all_pieces[i].draw_piece(all_pieces[i].def_square);
    }
  }
}




boolean piece_in_square(square sq) {
  for (int i = 0; i < 32; i++) {
    if (all_pieces[i] != null) {
      if (all_pieces[i].current_square == sq) {
        return true;
      }
    }
  }
  return false;
}


piece get_piece_in_square(square sq) {
  for (int i = 0; i < all_pieces.length; i++) {
    if (all_pieces[i] != null) {
      if (all_pieces[i].current_square == sq) {
        return all_pieces[i];
      }
    }
  }
  return null;
}

void deselect_all() {
  reset_square_color();
  for (int i = 0; i < all_pieces.length; i++) {
    if (all_pieces[i] != null) {
      all_pieces[i].selected = false;
      all_pieces[i].draw_piece(all_pieces[i].current_square);
    }
  }
}


boolean is_square_legal(square sq, piece piec) {
  square[] legal_moves = get_legal_moves(piec);
  for (int i = 0; i < legal_moves.length; i ++) {
    if (legal_moves[i] != null) {
      if (legal_moves[i] == sq) {
        return true;
      }
    }
  }
  return false;
}

boolean a_piece_is_selected() {
  for (int i = 0; i < all_pieces.length; i++) {
    if (all_pieces[i] != null) {
      if (all_pieces[i].selected == true) {
        return true;
      }
    }
  }
  return false;
}

piece get_selected_piece() {
  for (int i = 0; i < all_pieces.length; i++) {
    if (all_pieces[i] != null) {
      if (all_pieces[i].selected == true) {
        return all_pieces[i];
      }
    }
  }
  return null;
}


void move_piece(piece piec, square sq) {
  if (piece_in_square(sq)) {
    if (!(get_piece_in_square(sq).col.equals(piec.col))) {
      piece del_piece = get_piece_in_square(sq);
      for (int i = 0; i < all_pieces.length; i++) {
        if (all_pieces[i] != null) {
          if (all_pieces[i] == del_piece) {
            all_pieces[i] = null;
          }
        }
      }
    }
  }
  piec.prev_square = piec.current_square;
  piec.current_square = sq;
  deselect_all(); 
  piec.prev_square.col(blue);
  piec.current_square.col(blue);
  if (color_to_move.equals("white")) {
    color_to_move = "black";
  } else {
    color_to_move = "white";
  }
}


void update_legal_moves() {
  update_indices();
  for (int i = 0; i < all_pieces.length; i++) {
    if (all_pieces[i] != null) {
      all_pieces[i].legal_moves = get_legal_moves(all_pieces[i]);
    }
  }
}


void update_indices() {
  for (int i = 0; i < all_pieces.length; i++) {
    if (all_pieces[i] != null) {
      for (int y = 0; y < 8; y++) {
        for (int x = 0; x < 8; x++) {
          if (all_pieces[i].current_square == all_squares[x][y]) {
            all_pieces[i].x_index = x;
            all_pieces[i].y_index = y;
          }
        }
      }
    }
  }
}

square[] get_legal_moves(piece piec) {
  //king
  if (piec.type.equals("king")) {
    square[] king_moves = new square[8];

    //upper left
    if (piec.x_index - 1 < 0 || piec.y_index + 1 > 7) {
      king_moves[0] = null;
    } else {
      king_moves[0] = all_squares[piec.x_index - 1][piec.y_index + 1];
    }

    //upper middle
    if (piec.y_index + 1 > 7) {
      king_moves[1] = null;
    } else {
      king_moves[1] = all_squares[piec.x_index][piec.y_index + 1];
    }

    //upper right
    if (piec.x_index + 1 > 7 || piec.y_index + 1 > 7) {
      king_moves[2] = null;
    } else {
      king_moves[2] = all_squares[piec.x_index + 1][piec.y_index + 1];
    }

    //middle right
    if (piec.x_index + 1 > 7) {
      king_moves[3] = null;
    } else {
      king_moves[3] = all_squares[piec.x_index + 1][piec.y_index];
    }

    //lower right
    if (piec.x_index + 1 > 7 || piec.y_index - 1 < 0) {
      king_moves[4] = null;
    } else {
      king_moves[4] = all_squares[piec.x_index + 1][piec.y_index - 1];
    }

    //lower middle
    if (piec.y_index - 1 < 0) {
      king_moves[5] = null;
    } else {
      king_moves[5] = all_squares[piec.x_index][piec.y_index - 1];
    }

    //lower left
    if (piec.x_index - 1 < 0 || piec.y_index - 1 < 0) {
      king_moves[6] = null;
    } else {
      king_moves[6] = all_squares[piec.x_index - 1][piec.y_index - 1];
    }

    //middle left
    if (piec.x_index - 1 < 0) {
      king_moves[7] = null;
    } else {
      king_moves[7] = all_squares[piec.x_index - 1][piec.y_index];
    }
    for (int i = 0; i < king_moves.length; i ++) {
      if (piece_in_square(king_moves[i]) && get_piece_in_square(king_moves[i]).col.equals(piec.col)) {
        king_moves[i] = null;
      }
    }
    //can't move into check
    /* 
     for (int x = 0; x < all_pieces.length; x++) {
     if (all_pieces[x] != null) {
     if (all_pieces[x].col != piec.col) {
     for (int y = 0; y < king_moves.length; y++) {
     for (int z = 0; z < all_pieces[x].legal_moves.length; z++) {
     if (all_pieces[x].legal_moves[z] != null) {
     if (king_moves[y] == all_pieces[x].legal_moves[z]) {
     king_moves[y] = null;
     }
     }
     }
     }
     }
     }
     }
     */
    return king_moves;
  }

  //Queen
  if (piec.type.equals("queen")) {
    square[] queen_moves = new square[27];
    for (int i = 0; i < queen_moves.length; i++) {
      queen_moves[i] = null;
    }
    int index_counter = 0;
    int i = 0;



    //Up
    i = 0;
    while (piec.y_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index][piec.y_index + (i + 1)])) {
        if (! (get_piece_in_square(all_squares[piec.x_index][piec.y_index + (i + 1)]).col.equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index][piec.y_index + (i + 1)];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index][piec.y_index + (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Down
    i = 0;
    while (piec.y_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index][piec.y_index - (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index][piec.y_index - (i + 1)]).col).equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index][piec.y_index - (i + 1)];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index][piec.y_index - (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Left
    i = 0;
    while (piec.x_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index]).col).equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index];
      index_counter += 1;
      i += 1;
    }

    //Right
    i = 0;
    while (piec.x_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index]).col).equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index];
      index_counter += 1;
      i += 1;
    }

    //Up-sloping diagonal: Above
    i = 0;
    while (piec.x_index + (i + 1) <= 7 && piec.y_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)]).col).equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Up-sloping diagonal: Below
    i = 0;
    while (piec.x_index - (i + 1) >= 0 && piec.y_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)]).col).equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Down-sloping diagonal: Above
    i = 0;
    while (piec.x_index - (i + 1) >= 0 && piec.y_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)]).col).equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Down-sloping diagonal: Below
    i = 0;
    while (piec.x_index + (i + 1) <= 7 && piec.y_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)]).col).equals(piec.col))) {
          queen_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)];
          index_counter += 1;
        }
        break;
      }
      queen_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)];
      index_counter += 1;
      i += 1;
    }
    return queen_moves;
  }

  //Rook
  if (piec.type.equals("rook")) {
    square[] rook_moves = new square[14];
    for (int i = 0; i < rook_moves.length; i++) {
      rook_moves[i] = null;
    }
    int index_counter = 0;
    int i = 0;



    //Up
    i = 0;
    while (piec.y_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index][piec.y_index + (i + 1)])) {
        if (! (get_piece_in_square(all_squares[piec.x_index][piec.y_index + (i + 1)]).col.equals(piec.col))) {
          rook_moves[index_counter] = all_squares[piec.x_index][piec.y_index + (i + 1)];
          index_counter += 1;
        }
        break;
      }
      rook_moves[index_counter] = all_squares[piec.x_index][piec.y_index + (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Down
    i = 0;
    while (piec.y_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index][piec.y_index - (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index][piec.y_index - (i + 1)]).col).equals(piec.col))) {
          rook_moves[index_counter] = all_squares[piec.x_index][piec.y_index - (i + 1)];
          index_counter += 1;
        }
        break;
      }
      rook_moves[index_counter] = all_squares[piec.x_index][piec.y_index - (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Left
    i = 0;
    while (piec.x_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index]).col).equals(piec.col))) {
          rook_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index];
          index_counter += 1;
        }
        break;
      }
      rook_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index];
      index_counter += 1;
      i += 1;
    }

    //Right
    i = 0;
    while (piec.x_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index]).col).equals(piec.col))) {
          rook_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index];
          index_counter += 1;
        }
        break;
      }
      rook_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index];
      index_counter += 1;
      i += 1;
    }
    return rook_moves;
  }

  //Bishop
  if (piec.type.equals("bishop")) {
    square[] bishop_moves = new square[14];
    for (int i = 0; i < bishop_moves.length; i++) {
      bishop_moves[i] = null;
    }
    int index_counter = 0;
    int i = 0;
    //Up-sloping diagonal: Above
    i = 0;
    while (piec.x_index + (i + 1) <= 7 && piec.y_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)]).col).equals(piec.col))) {
          bishop_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)];
          index_counter += 1;
        }
        break;
      }
      bishop_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index + (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Up-sloping diagonal: Below
    i = 0;
    while (piec.x_index - (i + 1) >= 0 && piec.y_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)]).col).equals(piec.col))) {
          bishop_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)];
          index_counter += 1;
        }
        break;
      }
      bishop_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index - (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Down-sloping diagonal: Above
    i = 0;
    while (piec.x_index - (i + 1) >= 0 && piec.y_index + (i + 1) <= 7) {
      if (piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)]).col).equals(piec.col))) {
          bishop_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)];
          index_counter += 1;
        }
        break;
      }
      bishop_moves[index_counter] = all_squares[piec.x_index - (i + 1)][piec.y_index + (i + 1)];
      index_counter += 1;
      i += 1;
    }

    //Down-sloping diagonal: Below
    i = 0;
    while (piec.x_index + (i + 1) <= 7 && piec.y_index - (i + 1) >= 0) {
      if (piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)])) {
        if (! ((get_piece_in_square(all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)]).col).equals(piec.col))) {
          bishop_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)];
          index_counter += 1;
        }
        break;
      }
      bishop_moves[index_counter] = all_squares[piec.x_index + (i + 1)][piec.y_index - (i + 1)];
      index_counter += 1;
      i += 1;
    }
    return bishop_moves;
  }

  //Pawn
  //Add en passant and promotion later
  if (piec.type.equals("pawn")) {
    square[] pawn_moves = new square[5];
    for (int i = 0; i < pawn_moves.length; i++) {
      pawn_moves[i] = null;
    }
    int index_counter = 0;
    //One square ahead for white
    if (piec.y_index + 1 <= 7) {
      if (piec.col.equals("white") && piece_in_square(all_squares[piec.x_index][piec.y_index + 1]) == false) {
        pawn_moves[index_counter] = all_squares[piec.x_index][piec.y_index + 1];
        index_counter += 1;
      }
    }
    //One square ahead for black
    if (piec.y_index - 1 >= 0) {
      if (piec.col.equals("black") && piece_in_square(all_squares[piec.x_index][piec.y_index - 1]) == false) {
        pawn_moves[index_counter] = all_squares[piec.x_index][piec.y_index - 1];
        index_counter += 1;
      }
    }
    //Two squares for white
    if (piec.y_index == 1) {
      if (!(piece_in_square(all_squares[piec.x_index][piec.y_index + 2])) && (!piece_in_square(all_squares[piec.x_index][piec.y_index + 1]))) {
        if (piec.col.equals("white")) {
          pawn_moves[index_counter] = all_squares[piec.x_index][piec.y_index + 2];
          index_counter += 1;
        }
      }
    }
    //Two squares for black
    if (piec.y_index == 6) {
      if (piec.col.equals("black") && !piece_in_square(all_squares[piec.x_index][piec.y_index - 2]) && !piece_in_square(all_squares[piec.x_index][piec.y_index - 1])) {
        pawn_moves[index_counter] = all_squares[piec.x_index][piec.y_index - 2];
        index_counter += 1;
      }
    }
    //White capture left
    if (piec.x_index - 1 >= 0 && piec.y_index + 1 <= 7) {
      if (piec.col.equals("white") && piece_in_square(all_squares[piec.x_index - 1][piec.y_index + 1])) {
        if (get_piece_in_square(all_squares[piec.x_index - 1][piec.y_index + 1]).col.equals("black")) {
          pawn_moves[index_counter] = all_squares[piec.x_index - 1][piec.y_index + 1];
          index_counter += 1;
        }
      }
    }
    //White capture right
    if (piec.x_index + 1 <= 7 && piec.y_index + 1 >= 0) {
      if (piec.col.equals("white") && piece_in_square(all_squares[piec.x_index + 1][piec.y_index + 1])) {
        if (get_piece_in_square(all_squares[piec.x_index + 1][piec.y_index + 1]).col.equals("black")) {
          pawn_moves[index_counter] = all_squares[piec.x_index + 1][piec.y_index + 1];
          index_counter += 1;
        }
      }
    }
    //Black capture to his left
    if (piec.x_index + 1 <= 7 && piec.y_index - 1 >= 0) {
      if (piec.col.equals("black") && piece_in_square(all_squares[piec.x_index + 1][piec.y_index - 1])) {
        if (get_piece_in_square(all_squares[piec.x_index + 1][piec.y_index - 1]).col.equals("white")) {
          pawn_moves[index_counter] = all_squares[piec.x_index + 1][piec.y_index - 1];
          index_counter += 1;
        }
      }
    }
    //Black capture to his right
    if (piec.x_index - 1 >= 0 && piec.y_index - 1 >= 0) {
      if (piec.col.equals("black") && piece_in_square(all_squares[piec.x_index - 1][piec.y_index - 1])) {
        if (get_piece_in_square(all_squares[piec.x_index - 1][piec.y_index - 1]).col.equals("white")) {
          pawn_moves[index_counter] = all_squares[piec.x_index - 1][piec.y_index - 1];
          index_counter += 1;
        }
      }
    }
    return pawn_moves;
  }

  //Knight
  if (piec.type.equals("knight")) {
    square[] knight_moves = new square[8];
    for (int i = 0; i < knight_moves.length; i++) {
      knight_moves[i] = null;
    }
    int index_counter = 0;
    if (piec.x_index - 1 >= 0 && piec.y_index + 2 <= 7) {
      knight_moves[index_counter] = all_squares[piec.x_index - 1][piec.y_index + 2];
      index_counter += 1;
    }
    if (piec.x_index + 1 >= 0 && piec.y_index + 2 <= 7) {
      knight_moves[index_counter] = all_squares[piec.x_index + 1][piec.y_index + 2];
      index_counter += 1;
    }
    if (piec.x_index - 1 >= 0 && piec.y_index - 2 >= 0) {
      knight_moves[index_counter] = all_squares[piec.x_index - 1][piec.y_index - 2];
      index_counter += 1;
    }
    if (piec.x_index + 1 <= 7 && piec.y_index - 2 >= 0) {
      knight_moves[index_counter] = all_squares[piec.x_index + 1][piec.y_index - 2];
      index_counter += 1;
    }
    if (piec.x_index - 2 >= 0 && piec.y_index + 1 <= 7) {
      knight_moves[index_counter] = all_squares[piec.x_index - 2][piec.y_index + 1];
      index_counter += 1;
    }
    if (piec.x_index + 2 <= 7 && piec.y_index + 1 <= 7) {
      knight_moves[index_counter] = all_squares[piec.x_index + 2][piec.y_index + 1];
      index_counter += 1;
    }
    if (piec.x_index - 2 >= 0 && piec.y_index - 1 >= 0) {
      knight_moves[index_counter] = all_squares[piec.x_index - 2][piec.y_index - 1];
      index_counter += 1;
    }
    if (piec.x_index + 2 <= 7 && piec.y_index - 1 >= 0) {
      knight_moves[index_counter] = all_squares[piec.x_index + 2][piec.y_index - 1];
      index_counter += 1;
    }
    
    for (int move = 0; move < knight_moves.length; move++) {
      if (piece_in_square(knight_moves[move]) && piec.col.equals(color_to_move)) {
        knight_moves[move] = null;
      }
    }

    return knight_moves;
  }
  return null;
}

void init_pieces() {
  wk_image = loadImage("chess_white_king.png");
  white_king = new piece(all_squares[4][0], all_squares[4][0], all_squares[4][0], wk_image, "white", "king", 4, 0, false); 
  white_king.legal_moves = get_legal_moves(white_king);

  bk_image = loadImage("chess_black_king.png");
  black_king = new piece(all_squares[4][7], all_squares[4][7], all_squares[4][7], bk_image, "black", "king", 4, 7, false); 
  black_king.legal_moves = get_legal_moves(black_king);

  wq_image = loadImage("chess_white_queen.png");
  white_queen = new piece(all_squares[3][0], all_squares[3][0], all_squares[3][0], wq_image, "white", "queen", 3, 0, false);
  white_queen.legal_moves = get_legal_moves(white_queen);

  bq_image = loadImage("chess_black_queen.png");
  black_queen = new piece(all_squares[3][7], all_squares[3][7], all_squares[3][7], bq_image, "black", "queen", 3, 7, false);
  black_queen.legal_moves = get_legal_moves(black_queen);

  wr_image = loadImage("chess_white_rook.png");
  white_rook1 = new piece(all_squares[0][0], all_squares[0][0], all_squares[0][0], wr_image, "white", "rook", 0, 0, false); 
  white_rook1.legal_moves = get_legal_moves(white_rook1);

  white_rook2 = new piece(all_squares[7][0], all_squares[7][0], all_squares[7][0], wr_image, "white", "rook", 7, 0, false); 
  white_rook2.legal_moves = get_legal_moves(white_rook2);

  br_image = loadImage("chess_black_rook.png");
  black_rook1 = new piece(all_squares[0][7], all_squares[0][7], all_squares[0][7], br_image, "black", "rook", 0, 7, false); 
  black_rook1.legal_moves = get_legal_moves(black_rook1);

  black_rook2 = new piece(all_squares[7][7], all_squares[7][7], all_squares[7][7], br_image, "black", "rook", 7, 7, false); 
  black_rook2.legal_moves = get_legal_moves(black_rook2);

  wb_image = loadImage("chess_white_bishop.png");
  white_bishop1 = new piece(all_squares[2][0], all_squares[2][0], all_squares[2][0], wb_image, "white", "bishop", 2, 0, false); 
  white_bishop1.legal_moves = get_legal_moves(white_bishop1);

  white_bishop2 = new piece(all_squares[5][0], all_squares[5][0], all_squares[5][0], wb_image, "white", "bishop", 5, 0, false); 
  white_bishop2.legal_moves = get_legal_moves(white_bishop2);

  bb_image = loadImage("chess_black_bishop.png");
  black_bishop1 = new piece(all_squares[2][7], all_squares[2][7], all_squares[2][7], bb_image, "black", "bishop", 2, 7, false); 
  black_bishop1.legal_moves = get_legal_moves(black_bishop1);

  black_bishop2 = new piece(all_squares[5][7], all_squares[5][7], all_squares[5][7], bb_image, "black", "bishop", 5, 7, false); 
  black_bishop2.legal_moves = get_legal_moves(black_bishop2);
  
  wn_image = loadImage("chess_white_knight.png");
  white_knight1 = new piece(all_squares[1][0], all_squares[1][0], all_squares[1][0], wn_image, "white", "knight", 1, 0, false); 
  white_knight1.legal_moves = get_legal_moves(white_knight1);
  
  white_knight2 = new piece(all_squares[6][0], all_squares[6][0], all_squares[6][0], wn_image, "white", "knight", 6, 0, false); 
  white_knight2.legal_moves = get_legal_moves(white_knight2);
  
  bn_image = loadImage("chess_black_knight.png");
  black_knight1 = new piece(all_squares[1][7], all_squares[1][7], all_squares[1][7], bn_image, "black", "knight", 1, 7, false); 
  black_knight1.legal_moves = get_legal_moves(black_knight1);
  
  black_knight2 = new piece(all_squares[6][7], all_squares[6][7], all_squares[6][7], bn_image, "black", "knight", 6, 7, false); 
  black_knight2.legal_moves = get_legal_moves(black_knight2);

  wp_image = loadImage("chess_white_pawn.png");
  bp_image = loadImage("chess_black_pawn.png");
  for (int i = 0; i < pawn_array.length/2; i++) {
    pawn_array[i] = new piece(all_squares[i][1], all_squares[i][1], all_squares[i][1], wp_image, "white", "pawn", i, 1, false);
    pawn_array[i].legal_moves = get_legal_moves(pawn_array[i]);
  }
  int counter = 0;
  for (int i = 8; i < pawn_array.length; i++) {
    pawn_array[i] = new piece(all_squares[counter][6], all_squares[counter][6], all_squares[counter][6], bp_image, "black", "pawn", counter, 6, false);
    pawn_array[i].legal_moves = get_legal_moves(pawn_array[i]);
    counter += 1;
  }

  //all_pieces
  all_pieces[0] = white_king;
  all_pieces[1] = black_king;
  all_pieces[2] = white_queen;
  all_pieces[3] = black_queen;
  all_pieces[4] = white_rook1;
  all_pieces[5] = white_rook2;
  all_pieces[6] = black_rook1;
  all_pieces[7] = black_rook2;
  all_pieces[8] = white_bishop1;
  all_pieces[9] = white_bishop2;
  all_pieces[10] = black_bishop1;
  all_pieces[11] = black_bishop2;
  all_pieces[12] = white_knight1;
  all_pieces[13] = white_knight2;
  all_pieces[14] = black_knight1;
  all_pieces[15] = black_knight2;
  for (int x = 0; x < pawn_array.length; x++) {
    all_pieces[x + 16] = pawn_array[x];
  }
}


