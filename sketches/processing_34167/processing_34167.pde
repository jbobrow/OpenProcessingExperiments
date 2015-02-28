
int rect_x = 20;
int rect_y = 200;
int rect_width = 20;
int rect_height = 52;

int zone_x = 60;
int zone_y = 624;
int zone_width = 50;
int zone_height = 50;
int zone_spacing = 60;

int tick_width = 3;
int tick_height = 50;
int tick_spacing = 25;

int slider_x_pos = 75;

int mask_w = 440;
int mask_h = 414;
int rect_size = 20;
int paint_color;
int num_masks = 8;
PImage[] mask_male = new PImage[num_masks];
PImage[] mask_female = new PImage[num_masks];
PImage current_mask = createImage(mask_w, mask_h, ALPHA);
PImage hair;

boolean dude = false;
boolean chick = false;
boolean default_img = true;

PImage dude_btn;
PImage chick_btn;
PImage frame;
PImage male_head_lg;
PImage female_head_lg;
PImage question;
PImage hair_bg;

PFont rockwell;

void setup () {
   background (255, 234, 0);
   size (600, 800);
   noStroke();
   
   frame = loadImage ("frame.png");
   dude_btn = loadImage ("dude_btn.png");
   chick_btn = loadImage ("chick_btn.png");
   male_head_lg = loadImage ("male_head_lg.png");
   female_head_lg = loadImage ("female_head_lg.png");
   question = loadImage ("question_mark.png");
   hair = loadImage("hair.png");
   
   PImage f_1920 = loadImage ("1920_f_mask.jpg");
   PImage f_1930 = loadImage ("1930_f_mask.jpg");
   PImage f_1940 = loadImage ("1940_f_mask.jpg");
   PImage f_1950 = loadImage ("1950_f_mask.jpg");
   PImage f_1960 = loadImage ("1960_f_mask.jpg");
   PImage f_1970 = loadImage ("1970_f_mask.jpg");
   PImage f_1980 = loadImage ("1980_f_mask.jpg");
   PImage f_1990 = loadImage ("1990_f_mask.jpg");
   
   PImage m_1920 = loadImage ("1920_m_mask.jpg");
   PImage m_1930 = loadImage ("1930_m_mask.jpg");
   PImage m_1940 = loadImage ("1940_m_mask.jpg");
   PImage m_1950 = loadImage ("1950_m_mask.jpg");
   PImage m_1960 = loadImage ("1960_m_mask.jpg");
   PImage m_1970 = loadImage ("1970_m_mask.jpg");
   PImage m_1980 = loadImage ("1980_m_mask.jpg");
   PImage m_1990 = loadImage ("1990_m_mask.jpg");
   
   mask_female[0] = f_1920;
   mask_female[1] = f_1930;
   mask_female[2] = f_1940;
   mask_female[3] = f_1950;
   mask_female[4] = f_1960;
   mask_female[5] = f_1970;
   mask_female[6] = f_1980;
   mask_female[7] = f_1990;
   
   mask_male[0] = m_1920;
   mask_male[1] = m_1930;
   mask_male[2] = m_1940;
   mask_male[3] = m_1950;
   mask_male[4] = m_1960;
   mask_male[5] = m_1970;
   mask_male[6] = m_1980;
   mask_male[7] = m_1990;
   
   rockwell = loadFont ("Rockwell-Bold-18.vlw");
   
   textFont (rockwell, 46);
   noStroke ();  
   fill (50, 50, 50);
   text ("Fun With Follicles!", 85, 100); 
   
   textFont (rockwell, 18);
   noStroke ();  
   fill (50, 50, 50);
   text ("1920    1930    1940    1950    1960    1970    1980    1990", 65, 700); // dates
   
   noStroke ();  
   fill (50, 50, 50);
   text ("Pick:", 300, 148);
   
  textFont (rockwell, 14);
   noStroke ();  
   fill (220, 27, 18);
   text (">> Press the 'E' key toadd some volume give them a hair cut <<", 63, 750); 
   


}

void draw () {
  image (frame, 80, 170); //frame
  image (dude_btn, 355, 125); //dude btn
  image (chick_btn, 440, 125); //chick btn

  if (default_img == true){
    image(question, 180, 210);
  }

  if (dude == true) {
    hair.mask(current_mask);
    image(male_head_lg, 205, 235);
    image(hair, 80, 170);
  }
  
  if (chick == true) {
    hair.mask(current_mask);
    image(female_head_lg, 200, 240);
    image(hair, 80, 170);
//  image(current_mask, 205, 245);
  }
  drawSlider();
  
 }
 
 void drawSlider () {
   
   //draw rect as bg
   fill(255, 234, 0);
   rect(0, 620, width, 60);
   
   noFill();
   rect (zone_x, zone_y, zone_width, zone_height);//decade zone 1920
   fill (220, 27, 18);
   rect (zone_x + 25, zone_y, tick_width, tick_height);//tick 1920

   noFill();
   rect (zone_x + zone_spacing, zone_y, zone_width, zone_height);//decade zone 1930
   fill (220, 27, 18);
   rect (zone_x + 85, zone_y, tick_width, tick_height); //tick 1930

   noFill();
   rect (zone_x + zone_spacing*2, zone_y, zone_width, zone_height);//decade zone 1940
   fill (220, 27, 18);
   rect (zone_x + 145, zone_y, tick_width, tick_height);//tick 1940
   
   noFill();
   rect (zone_x + zone_spacing*3, zone_y, zone_width, zone_height);//decade zone 1950
   fill (220, 27, 18);
   rect (zone_x + 205, zone_y, tick_width, tick_height); // tick 1950
   
   noFill();
   rect (zone_x + zone_spacing*4, zone_y, zone_width, zone_height);//decade zone 1960
   fill (220, 27, 18);
   rect (zone_x + 265, zone_y, tick_width, tick_height);//tick 1960
   
   noFill();
   rect (zone_x + zone_spacing*5, zone_y, zone_width, zone_height);//decade zone 1970
   fill (220, 27, 18);
   rect (zone_x+325, zone_y, tick_width, tick_height);//1970 tick
   
   noFill();
   rect (zone_x + zone_spacing*6, zone_y, zone_width, zone_height);//decade zone 1980
   fill (220, 27, 18);
   rect (zone_x + 385, zone_y, tick_width, tick_height);//tick 1980
   
   noFill();
   rect (zone_x + zone_spacing*7, zone_y, zone_width, zone_height);//decade zone 1990
   fill (220, 27, 18);
   rect (zone_x + 445, zone_y, tick_width, tick_height);//tick 1990
   
   stroke(220, 27, 18);
   strokeWeight(20);
   line(50, 650, 550, 650); //bar

   fill(50,50,50);
   noStroke ();
   rect (slider_x_pos, 624, rect_width, rect_height); //slider
   
 }
 
 void mouseClicked () {
  if ((mouseX >= 355) && (mouseX <= 430) && (mouseY >= 125) && (mouseY <=160)) {
    dude = true;
    chick = false;
    default_img = false;
    male_head_lg = loadImage ("male_head_lg.png");
    current_mask = mask_male[0]; 
  }
  
  if ((mouseX >= 440) && (mouseX <= 520) && (mouseY >= 125) && (mouseY <=160)) {
    chick = true;
    dude = false;
    default_img = false;
    female_head_lg = loadImage ("female_head_lg.png");
    current_mask = mask_female[0]; 
  }
 }
 
void mouseDragged () {
  if ((mouseY > 625) && (mouseY < 675)) {   
   slider_x_pos = mouseX;
  }
  current_mask.loadPixels();
  int mos_pos_x = mouseX - 80;
  int mos_pos_y= mouseY - 170;
  if ((mos_pos_x<mask_w) && (mos_pos_y<mask_h)) {
    for (int i = mos_pos_y; i<rect_size+mos_pos_y; i++) {
      for (int j = mos_pos_x; j < rect_size+mos_pos_x; j++) {
          if ((i*mask_w+j < current_mask.pixels.length) && (i*mask_w+j > 0)) {
            current_mask.pixels[i*mask_w+j] = paint_color;
          }
      }
    }
  }
  current_mask.updatePixels();
}

void mouseReleased () {
  if ((mouseX <= zone_x + zone_width) && (mouseY <= zone_y + zone_height)){
  if (chick == true) {//1920
      current_mask = mask_female[0];
    } else {
      current_mask = mask_male[0]; 
    }

  }
  if ((mouseX >= zone_x + zone_width) && (mouseX <= zone_x *3) && (mouseY <= zone_y + zone_height)){
    if (chick == true) {//1930
      current_mask = mask_female[1];
    } else {
      current_mask = mask_male[1]; 
    }
  }
  if ((mouseX >= zone_x *3) && (mouseX <= zone_x *4) && (mouseY <= zone_y + zone_height)){
      if (chick == true) {//1940
      current_mask = mask_female[2];
    } else {
      current_mask = mask_male[2]; 
    }
  }
    if ((mouseX >= zone_x *4) && (mouseX <= zone_x *5) && (mouseY <= zone_y + zone_height)){
      if (chick == true) {//1950
      current_mask = mask_female[3];
    } else {
      current_mask = mask_male[3]; 
    }
  }
    if ((mouseX >= zone_x *5) && (mouseX <= zone_x *6) && (mouseY <= zone_y + zone_height)){
      if (chick == true) {//1960
      current_mask = mask_female[4];
    } else {
      current_mask = mask_male[4]; 
    }
  }
    if ((mouseX >= zone_x *6) && (mouseX <= zone_x *7) && (mouseY <= zone_y + zone_height)){
      if (chick == true) {//1970
      current_mask = mask_female[5];
    } else {
      current_mask = mask_male[5]; 
    }
  }
    if ((mouseX >= zone_x *7) && (mouseX <= zone_x *8) && (mouseY <= zone_y + zone_height)){
      if (chick == true) {//1980
      current_mask = mask_female[6];
    } else {
      current_mask = mask_male[6]; 
    }
  }
    if ((mouseX >= zone_x *8) && (mouseX <= zone_x *9) && (mouseY <= zone_y + zone_height)){
      if (chick == true) {//1990
      current_mask = mask_female[7];
    } else {
      current_mask = mask_male[7]; 
    }
  }
  
  
}

void keyPressed() {
  if (key == 'e') {
    paint_color = (paint_color == 0) ? 255 : 0;
  }
}

