
import java.util.Arrays;



PFont font;



String[] names = {
  "Angel", 
  "Raquel", 
  "Hazel", 
  "Jay", 
  "Lyoniel", 
  "Benjie", 
  "Wilhrose", 
  "Arcy", 
  "Nelson", 
  "Ferdinand", 
  "Xenia", 
  "Verlou"
};


ArrayList<int[]> colors = new ArrayList<int[]>();


float pos_x = 0; //initial x-axis
float pos_y = 0; //initial y-axis


float rect_w = 335; //width of the rectangle;
float rect_h = 100; //height of the rectangle;


float raw_spacer_horizontal = 5; // horizontal spacer between rectangles;
float raw_spacer_vertical = 25; // vertical spacer between rectangles;


float act_spacer_horizontal = raw_spacer_horizontal + rect_h; // formula for the actual spacer;
float act_spacer_vertical = raw_spacer_vertical + rect_w;


float text_size_def = 60; // default text size;


float text_box_size_w = (float)rect_w/2;
float text_box_size_h = rect_h;


float letter_x = 0;
float letter_y = 0;



float child_letter_pos_x = 0; // initial x-axis of the 1st letter;
float child_letter_pos_y = 0; // initial y-axis of the 1st letter;



float child_letter_x_offset = 4; // x-offeset of the every letter;
float child_letter_spacing = 5; // spaces between letters;



float child_rows = 4; // for the grid
float child_rows_text = 3; // for the letters
float child_rows_letter_min = 3; // minimum letters per row;




float rect_row_count = 5;
float rect_col_count = Math.ceil((float)names.length/rect_row_count);



float window_size_w = (rect_w+raw_spacer_vertical)*rect_col_count;
float window_size_h = (rect_h+raw_spacer_horizontal)*rect_row_count;


float optimal_rect_w = ((text_box_size_h)/child_rows) * (rect_w/((text_box_size_h)/child_rows));
float optimal_rect_h = (rect_h/child_rows) * child_rows;




int[] stroke_color = {
  0, 0, 0
};
int[] fill_color_shape = {
  255, 255, 255
};



int[] stroke_color_text = {
  0, 0, 0
};
int[] fill_color_text = {
  255, 255, 255
};




//Special variables
boolean is_pdf = true;
boolean is_alt_onhold = false;
boolean is_to_show_elem_lines = false;





//Helper functions
float calc_nxt(float val, float nth, float space) {
  return ((val * nth) + space);
}



void draw_text(String message, int fontXPos, int fontYPos, int BoxSide, int charSpacing) {
  for (int i = 0; i < message.length (); i++) {
    stroke_text(message.charAt(i), fontXPos, fontYPos-6, BoxSide, BoxSide, CENTER, CENTER, stroke_color_text, fill_color_text);


    fontXPos += charSpacing;
  }
}



void stroke_text(String message, int x, int y, int w, int h, int align_x, int align_y, int[] outline_color, int[] fill_color) 
{ 
  textAlign(align_x, align_y);


  fill(outline_color[0], outline_color[1], outline_color[2]); 
  text(message, x-1, y, w, h); 
  text(message, x, y-1, w, h); 
  text(message, x+1, y, w, h); 
  text(message, x, y+1, w, h); 
  fill(fill_color[0], fill_color[1], fill_color[2]); 
  text(message, x, y, w, h);
}



ArrayList<int[]> get_shades_and_tints(int R, int G, int B)
{
  ArrayList<int[]> colorList = new ArrayList<int[]>();



  int RGB; 
  int max;
  RGB = (int)R + (int)G + (int)B;
  max = Math.round(RGB / 38.25);
  if (max == 19) max = 25;
  int i; 
  Float f; 
  int r; 
  int g; 
  int b;
  for (i = 0; i < max; i++)
  {
    f = 1/max;
    f = i * f; 
    r = (int)(R * f); 
    if (r > 255) r = 255;
    g = (int)(G * f); 
    if (g > 255) g = 255;
    b = (int)(B * f); 
    if (b > 255) b = 255;




    colorList.add(new int[] {
      r, g, b
    }
    );
  }
  max = 20 - max;
  for (i = 0; i < max; i++)
  {
    f = 1/max;
    f = i * f;
    r = (int)((255 - R) * f + R); 
    if (r > 255) r = 255;
    g = (int)((255 - G) * f + G); 
    if (g > 255) g = 255;
    b = (int)((255 - B) * f + B); 
    if (b > 255) b = 255;


    colorList.add(new int[] {
      r, g, b
    }
    );
  }





  return colorList;
}



int row_rect_cnt = 1;
int names_len = names.length;
int export_count = 1;



void setup() {
  background(192);
  frameRate(10);


  //noLoop();



  size(1080, 525);


  // colors.add(new int[] {
  // 113, 9, 170
  // }
  // ); //purple 
  // colors.add(new int[] {
  // 247, 30, 30
  // }
  // ); //red
  // colors.add(new int[] {
  // 255, 110, 30
  // }
  // ); //orange
  // colors.add(new int[] {
  // 0, 166, 124
  // }
  // ); //green 
  // colors.add(new int[] {
  // 192, 192, 192
  // }
  // ); //blue
  // colors.add(new int[] {
  // 17, 43, 181
  // }
  // ); //blue


  for (String name : names) {
    colors.add(new int[] {
      random(0, 255), random(0, 255), random(0, 255)
    }
    );
  }


  //names = new String[]{
  //"Lyoniel"
  //};
  //
  //names_len = names.length;
  //
  //colors.clear();
  //colors.add(new int[] {17, 43, 181}); //blue

  println("Optimal Rectangle Width: "+optimal_rect_w);
  println("Optimal Rectangle Height: "+optimal_rect_h);

  println("Optimal Window Width: "+window_size_w);
  println("Optimal Window Height: "+window_size_h);

  println("Column Count: "+rect_col_count);
}



void draw() {


  is_pdf = false;
  if (keyPressed) {
    if (key=='e') {
      is_pdf = true;
    }
  }





  populate();


  if (is_pdf) {
    int dy= day();
    int mo = month();
    int yr = year();



    int sec = second();
    int min = minute();
    int hr= hour();



    String dt = yr+""+mo+""+dy+"_"+hr+""+min+""+sec;



    saveFrame("export_"+dt+".png");
  }
}



void populate() {
  smooth();




  int cur_col = 0;
  int tmp_col =0;


  debugger;
  for (row_rect_cnt = 1; row_rect_cnt <= names_len; row_rect_cnt ++) {
    ArrayList<int[]> row_rect_colors = new ArrayList<int[]>();
    ArrayList<int[]> row_rect_colors_trim = new ArrayList<int[]>();


    if (cur_col!=tmp_col) {
      pos_x = (cur_col * rect_w) + (cur_col * raw_spacer_vertical);
      pos_y = 0;
      tmp_col = cur_col;
    }


    int[] child_row_x = new int[child_rows_text];
    int[] child_row_y = new int[child_rows_text];



    int cur_row = (row_rect_cnt - (cur_col * rect_row_count) - 1);
    int curr = row_rect_cnt -1;
    int spacer_calc = cur_row * act_spacer_horizontal;


    int nxt_x = calc_nxt(pos_x, cur_row, spacer_calc);
    int nxt_y = calc_nxt(pos_y, cur_row, spacer_calc);


    int[] cur_color = colors.get(curr);



    row_rect_colors = get_shades_and_tints(cur_color[0], cur_color[1], cur_color[2]);


    int cur_color_cnt = 0;


    for (int[] rgb : row_rect_colors) {
      if (cur_color_cnt ==0 || cur_color_cnt == row_rect_colors.size() -2) {
        cur_color_cnt++;
        continue;
      }


      row_rect_colors_trim.add(new int[] {
        rgb[0], rgb[1], rgb[2]
      }
      );


      cur_color_cnt++;
    }


    fill(row_rect_colors_trim.get(0)[0], row_rect_colors_trim.get(0)[1], row_rect_colors_trim.get(0)[2]);
    rect(pos_x, nxt_y, rect_w, rect_h);


    int sq_count_x = rect_w/(text_box_size_h/child_rows);
    int sq_w = text_box_size_h/child_rows;






    for (int vertical_counter= 0; vertical_counter<sq_count_x; vertical_counter++) {
      int sq_x = pos_x+(rect_w/sq_count_x)*vertical_counter;
      int sq_y = nxt_y;
      int sq_y2 = sq_y+text_box_size_h;





      for (int horizontal_counter = 0; horizontal_counter<child_rows; horizontal_counter++) {
        int sq_y_inc = ((rect_h/child_rows)*horizontal_counter);
        int sq_y3 = sq_y+sq_y_inc;
        int sq_x2 = pos_x+(rect_w/sq_count_x)*(vertical_counter+1)+child_letter_x_offset;



        //line(sq_x, sq_y3, sq_x2, sq_y3);
        int r = Math.floor(random(row_rect_colors_trim.size()));
        fill(row_rect_colors_trim.get(r)[0], row_rect_colors_trim.get(r)[1], row_rect_colors_trim.get(r)[2]);
        rect(sq_x, sq_y3, sq_w, sq_w);
      }
    }


    int half_w_child = pos_x+(rect_w/2);
    int half_w = (rect_w/2);
    int child_row_h = nxt_y;




    for (int chx=1; chx <= child_rows; chx++) {
      child_row_x[chx-1] = half_w_child;
      child_row_y[chx-1] = nxt_y+((text_box_size_h/child_rows)*chx);



      int half_y = (nxt_y+((text_box_size_h/child_rows)*chx));
      int half_half_y = child_row_h + ((half_y-child_row_h)/2);



      if (is_to_show_elem_lines) {
        stroke(255, 0, 0);
        line(half_w, half_y, pos_x+rect_w, half_y);



        stroke(0, 0, 255);
        line(half_w, half_half_y, pos_x+rect_w, half_half_y);



        child_row_h =half_y;
      }
    }



    int nxt_letter_x = letter_x + pos_x; 
    int nxt_letter_y = (cur_row * (rect_h+raw_spacer_horizontal))+pos_y+letter_y;



    font = createFont("GeoSlab703 Md BT", text_size_def);
    textFont(font);
    stroke_text(names[curr].charAt(0), nxt_letter_x, nxt_letter_y-12, half_w, text_box_size_h, CENTER, CENTER, stroke_color_text, fill_color_text);


    //textAlign(CENTER, CENTER);
    //float ascent = textAscent();
    //float descent = textDescent();
    //float cw = textWidth(names[cur_row].charAt(0));


    //fill(0,0,0);
    //text(names[cur_row].charAt(0), nxt_letter_x, nxt_letter_y-10, half_w, text_box_size_h);
    //line(nxt_letter_x, nxt_letter_y-ascent, nxt_letter_x+half_w, nxt_letter_y-ascent); 
    //line(nxt_letter_x, nxt_letter_y+descent, nxt_letter_x+half_w, nxt_letter_y+descent);


    //line(nxt_letter_x+cw, nxt_letter_y, nxt_letter_x+cw, nxt_letter_y+ascent);
    //line(nxt_letter_x+cw, nxt_letter_y, nxt_letter_x+cw, nxt_letter_y-descent);



    String sub = names[curr].substring(1);


    int qoutient = Math.ceil(sub.length()/child_rows);




    int rem = sub.length();
    int end = 0;
    int stt = 0;
    int row_cnt = 1;
    int opp_cnt = child_rows_text;



    int row_hx = (rect_h/child_rows_text);



    while (row_cnt <= child_rows && end!=rem) {
      int ccount = qoutient < child_rows_letter_min? child_rows_letter_min : qoutient;



      stt = (row_cnt-1) * ccount;
      end = row_cnt * ccount; 
      end = end > rem? rem: end;




      font = createFont("GeoSlab703 Md BT", round(text_size_def/child_rows_text));
      textFont(font);
      draw_text(sub.substring(stt, end).toUpperCase(), child_row_x[row_cnt-1]+child_letter_x_offset, child_row_y[row_cnt-1]-((row_hx/child_rows_text)*(opp_cnt-1)), row_hx, row_hx+child_letter_spacing, LEFT, CENTER, stroke_color_text, fill_color_text);



      //println(stt, end);
      opp_cnt--;
      row_cnt++;
    }



    if (row_rect_cnt%rect_row_count==0) { 
      cur_col++;
    }
  }

  pos_x = 0;
  pos_y = 0;
  cur_col = 0;
  tmp_col = 0;
}




void keyPressed() {
  debugger;


  if (keyPressed) {
    if (key==CODED) {
      if (keyCode == ALT) {
        is_alt_onhold = true;
        println("alt key: pressed");
      }
    }



    if (key=='l') {
      //show elementary lines 
      if (is_to_show_elem_lines) {
        is_to_show_elem_lines = false;
      } else {
        is_to_show_elem_lines = true;
      }
    }




    if (key == 'r') {
      redraw();
    }
  }



  if (is_alt_onhold) {
    println("alt key: hold");


    if (key == 'c') {
      //decrease rows
      println("c: pressed");
      if (child_rows > 1) {
        child_rows--;
      }
      println("Child Row Count:"+child_rows);
    } else if (key == 'p') {
      //decrease font size
      text_size_def--;



      println("Default Size: "+text_size_def);
    }
  } else {
    if (key == 'c') {
      //increase rows
      child_rows++;
      println("Child Row Count:"+child_rows);
    } else if (key == 'p') {
      //increare font size
      text_size_def++;
      println("Default Size: "+text_size_def);
    }
  }
}



void keyReleased() {
  if (key == CODED) {
    if (keyCode == ALT) {
      is_alt_onhold = false;
      println("alt key: released");
    }
  }
}



