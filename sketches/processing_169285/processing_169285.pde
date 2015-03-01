
int cell_rows = 8,
    cell_cols = 8,
    cell_size = 5,
    gutter = 9;
float v_invaders = 0,
      h_invaders = 0;
      
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
  v_invaders = floor(height/((cell_rows * cell_size) + gutter));
  h_invaders = floor(width/((cell_cols * cell_size) + gutter));
  
  colorMode(HSB);
  draw_invaders();
}

void draw() {}

void mousePressed() {
  background(255);
  draw_invaders();
}

void draw_invaders() {
  int x = 0, y = 0;
  for (int i = 0; i < v_invaders; i++) {
    y = gutter + (i * cell_rows * cell_size) + (gutter * i);
    for (int j = 0; j < h_invaders; j++) {
      x = gutter + (j * cell_cols * cell_size) + (gutter * j);
      fill(random(255), 150 + random(105), 155 + random(100));
      draw_invader(x, y);
    }
  }
}

void draw_invader(int x, int y) {
  boolean[][] invader = horizontally_mirrored(generate_invader_half());
  draw_cells(invader, x, y);
}

boolean[][] generate_invader_half() {
  int cols = floor(cell_cols/2);
  boolean[][] invader_half = new boolean[cell_rows][cols];
  for(int i = 0; i < cell_rows; i++) {
    invader_half[i] = new boolean[cols];
    for (int j = 0; j < cols; j++) {
      invader_half[i][j] = round(random(1)) == 1;
    }
  }
  return invader_half;
}

boolean[][] horizontally_mirrored(boolean[][] lst) {
  boolean[][] mirrored = new boolean[lst.length][];
  for (int i = 0; i < lst.length; i++) {
    mirrored[i] = new boolean[lst[i].length * 2];
    int y = 0;
    for (int j = 0; j < lst[i].length; j++) {
      mirrored[i][y++] = lst[i][j];
    }
    for (int j = lst[i].length - 1; j >= 0; j--) {
      mirrored[i][y++] = lst[i][j];
    }
  }
  
  return mirrored;
}

void draw_cells(boolean[][] cells, int x, int y) {
  //print_array(cells);
  pushMatrix();
  translate(x, y);
  
  y = 0;
  for (int i = 0; i < cells.length; i++) {
    x = 0;
    for (int j = 0; j < cells[i].length; j++) {
      if (cells[i][j]) {
        rect(j * cell_size, i * cell_size, cell_size, cell_size);
      }
    }
  }
  
  popMatrix();
}

//void print_array(boolean[][] array) {
//  println("[");
//  for(int i = 0; i < array.length; i++) {
//    print("[");
//    for (int j = 0; j < array[i].length; j++) {
//      print(array[i][j] + (j == array[i].length - 1 ? "" : ","));
//    }
//    println("]");
//  }
//  println("]");
//  println();
//}


