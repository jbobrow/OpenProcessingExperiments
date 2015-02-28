
float y;
PImage photo;

void setup() {
  size (900, 700);
  y = width;
  photo = loadImage("wallpaper_hd_abstract_music_widescreen_hd_wallpaper.jpg"); //loading
}

 size (700, 600);
  y = width;
  photo = loadImage("DJKRNG - January Promo Mix.mp3"); //loading
  
void draw() {
  //background(0);
   image(photo, y, 0);
  if (y>0) { //add this to make it sop when it reaches the border
  y = y -1;
  }
  
}

