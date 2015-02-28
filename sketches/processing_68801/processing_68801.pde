
void draw_a () {
  rLine( 0, 72, 26, 0 );
  rLine( 26, 0, 46, 72 );
  rLine( 46, 72, 13, 54 );
  translate(spacing, 0);
}

void draw_b () {
  rLine (0, 0, 0, 72); //1senkrechter strich
  rLine (40, 0, 0, 0); //strich decke
  rLine (0, 72, 40, 72); //strich boden
  rLine (40, 0, 40, 72); //2ter senkrechter Strich
  rLine (0, 36, 40, 36); //mittel Strich  
  translate(spacing, 0);
}

void draw_c () {
  rLine (0, 0, 0, 72); //1senkrechter strich
  rLine (40, 0, 0, 0); //strich decke
  rLine (0, 72, 40, 72); //strich boden

  translate(spacing, 0);
}

void draw_d () {
  rLine( 0, 0, 35, 0 );
  rLine( 35, 0, 53, 41 );
  rLine( 53, 41, 37, 72 );
  rLine( 37, 72, 0, 72 );
  rLine( 0, 72, 0, 0 );
  translate(spacing, 0);
}

void draw_e () {
  rLine( 35, 0, 0, 0 );
  rLine( 0, 0, 0, 72 );
  rLine( 0, 72, 41, 72 );
  rLine( 0, 36, 30, 36 );
  translate(spacing-10, 0);
}

void draw_f () {
  rLine( 0, 72, 0, 0 );
  rLine( 0, 0, 35, 0 );
  rLine( 32, 42, 0, 42 );
  translate(spacing, 0);
}

void draw_g () {
  /*rLine( 33, 41, 58, 41 );
  rLine( 58, 41, 58, 72 );
  rLine( 58, 72, 16, 72 );
  rLine( 16, 72, 0, 41 );
  rLine( 0, 41, 16, 0 );
  rLine( 16, 0, 52, 0 );
  rLine( 52, 0, 52, 10 );
  
  */
  
  rLine (0, 0, 0, 72); //1senkrechter strich
  rLine (40, 0, 0, 0); //strich decke
  rLine (0, 72, 40, 72); //strich boden
  rLine (40, 36, 40, 72);
  rLine (20, 36, 40, 36);
  
  
  translate(spacing+10, 0);
}

void draw_h () {
  rLine( 0, 37, 45, 37 );
  rLine( 0, 72, 0, 0 );
  rLine( 45, 0, 45, 72 );
  translate(spacing, 0);
}

void draw_i () {
  
  rLine( 10, 0, 10, 75 );
 
  translate(spacing-20, 0);
}

void draw_j () {
  rLine( 10, 88, 27, 74 );
  rLine( 27, 74, 27, 0 );
  rLine( 27, 0, 0, 0 );
  rLine( 0, 0, 0, 10 );
  translate(spacing, 0);
}

void draw_k () {
  rLine( 0, 72, 0, 0 );
  rLine( 31, 0, 0, 40 );
  rLine( 0, 40, 44, 72 );
  translate(spacing, 0);
}

void draw_l () {
  rLine( 39, 61, 39, 72 );
  rLine( 39, 72, 0, 72 );
  rLine( 0, 72, 0, 0 );
  translate(spacing-10, 0);
}

void draw_m () {
  rLine( 1, 74, 13, 2 );
  rLine( 13, 2, 36, 61 );
  rLine( 36, 61, 60, 2 );
  rLine( 60, 2, 72, 74 );
  translate(spacing, 0);
}

void draw_n () {
  rLine( 0, 72, 0, 2 );
  rLine( 0, 2, 46, 72 );
  rLine( 46, 72, 46, 2 );
  translate(spacing, 0);
}

void draw_o () {
  rLine (30, 0, 30, 72); //1senkrechter strich
  rLine (30, 0, 70, 0); //strich decke
  rLine (30, 72, 70, 72); //strich boden
  rLine (70, 0, 70, 72); //2ter senkrechter Strich
  
  translate(spacing+20, 0);
}

void draw_p () {
  rLine( 0, 72, 0, 0 );
  rLine( 0, 0, 35, 0 );
  rLine( 35, 0, 47, 18 );
  rLine( 47, 18, 37, 42 );
  rLine( 37, 42, 7, 42 );
  translate(spacing, 0);
}

void draw_q () {
  rLine( 51, 80, 34, 66 );
  rLine( 34, 66, 21, 72 );
  rLine( 21, 72, 0, 42 );
  rLine( 0, 42, 21, 0 );
  rLine( 21, 0, 48, 0 );
  rLine( 48, 0, 68, 42 );
  rLine( 68, 42, 48, 72 );
  translate(spacing, 0);
}

void draw_r () {
  rLine( 0, 72, 0, 0 );
  rLine( 0, 0, 34, 0 );
  rLine( 34, 0, 47, 18 );
  rLine( 47, 18, 36, 42 );
  rLine( 36, 42, 6, 42 );
  rLine( 6, 42, 51, 72 );
  translate(spacing, 0);
}

void draw_s () {
  rLine( 4, 72, 37, 72 );
  rLine( 37, 72, 43, 54 );
  rLine( 43, 54, 34, 35 );
  rLine( 34, 35, 9, 35 );
  rLine( 9, 35, 0, 18 );
  rLine( 0, 18, 12, 0 );
  rLine( 12, 0, 38, 0 );
  translate(spacing, 0);
}

void draw_t () {
  rLine( 0, 0, 63, 0 );
  rLine( 32, 72, 32, 0 );
  translate(spacing, 0);
}

void draw_u () {
  rLine( 0, 0, 0, 57 );
  rLine( 0, 57, 11, 72 );
  rLine( 11, 72, 47, 72 );
  rLine( 47, 72, 47, 0 );
  translate(spacing, 0);
}

void draw_v () {
  rLine( 0, 0, 26, 72 );
  rLine( 26, 72, 52, 0 );
  translate(spacing, 0);
}

void draw_w () {
  rLine( 0, 0, 26, 72 );
  rLine( 26, 72, 41, 30 );
  rLine( 30, 0, 57, 72 );
  rLine( 57, 72, 82, 0 );
  translate(spacing+30, 0);
}

void draw_x () {
  rLine( 0, 72, 43, 0 );
  rLine( 0, 0, 43, 72 );
  translate(spacing, 0);
}

void draw_y () {
  rLine( 22, 72, 22, 40 );
  rLine( 22, 40, 44, 0 );
  rLine( 0, 0, 22, 40 );
  translate(spacing, 0);
}

void draw_z () {
  rLine( 4, 0, 47, 0 );
  rLine( 47, 0, 0, 72 );
  rLine( 0, 72, 46, 72 );
  translate(spacing, 0);
}

void draw_0 () {
  rLine( 45, 72, 0, 72 );
  rLine( 0, 72, 0, 0 );
  rLine( 0, 0, 45, 0 );
  rLine( 45, 0, 45, 72 );
  translate(spacing, 0);
}

void draw_1 () {
  rLine( 19, 72, 49, 72 );
  rLine( 0, 13, 34, 0 );
  rLine( 34, 1, 34, 72 );
  translate(spacing, 0);
}

void draw_2 () {
  rLine( 3, 0, 29, 0 );
  rLine( 29, 0, 44, 20 );
  rLine( 44, 20, 0, 72 );
  rLine( 0, 72, 45, 72 );
  translate(spacing, 0);
}

void draw_3 () {
  rLine( 3, 0, 28, 0 );
  rLine( 28, 0, 40, 17 );
  rLine( 40, 17, 28, 34 );
  rLine( 28, 34, 45, 51 );
  rLine( 45, 51, 31, 72 );
  rLine( 31, 72, 0, 72 );
  translate(spacing, 0);
}

void draw_4 () {
  rLine( 50, 50, 0, 50 );
  rLine( 0, 50, 40, 0 );
  rLine( 40, 0, 40, 72 );
  translate(spacing, 0);
}

void draw_5 () {
  rLine( 0, 72, 26, 72 );
  rLine( 26, 72, 38, 51 );
  rLine( 38, 51, 24, 34 );
  rLine( 24, 34, 0, 34 );
  rLine( 0, 34, 0, 0 );
  rLine( 0, 0, 33, 0 );
  translate(spacing, 0);
}

void draw_6 () {
  rLine( 0, 33, 35, 37 );
  rLine( 35, 37, 35, 72 );
  rLine( 35, 72, 0, 72 );
  rLine( 0, 72, 0, 33 );
  rLine( 0, 33, 20, 0 );
  translate(spacing, 0);
}

void draw_7 () {
  rLine( 0, 0, 41, 0 );
  rLine( 41, 0, 15, 72 );
  translate(spacing, 0);
}

void draw_8 () {
  rLine( 2, 33, 2, 0 );
  rLine( 2, 0, 35, 0 );
  rLine( 35, 0, 35, 33 );
  rLine( 35, 33, 0, 40 );
  rLine( 0, 40, 0, 72 );
  rLine( 0, 72, 38, 72 );
  rLine( 38, 72, 38, 40 );
  rLine( 38, 40, 2, 33 );
  translate(spacing, 0);
}

void draw_9 () {
  rLine( 31, 42, 10, 42 );
  rLine( 10, 42, 0, 21 );
  rLine( 0, 21, 17, 0 );
  rLine( 17, 0, 44, 0 );
  rLine( 44, 0, 28, 72 );
  translate(spacing, 0);
}


