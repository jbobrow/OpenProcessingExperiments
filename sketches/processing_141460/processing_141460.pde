


float y;
PImage photo;
PImage photo1;
PImage photo2;
PImage photo3;


void setup() {
  size (1000, 800);
  y = width;
  photo = loadImage("wallpaper_hd_abstract_music_widescreen_hd_wallpaper.jpg"); //loading
  photo1 = loadImage("IMG_0606.JPG"); //loading
  photo2 = loadImage("IMG_0587.JPG"); //loading
  photo3 = loadImage("IMG_0744.JPG"); //loading
  
}

  
void draw() {
  //background(0);  
   image(photo, y, 0);
  if (y>0) { //add this to make it sop when it reaches the border
  y = y -1;
  }
  
    image(photo1, X, 90);
  if (y>0) { //add this to make it sop when it reaches the border
  y = y -1;
  }
  
    image(photo2, y, 390);
  if (y>0) { //add this to make it sop when it reaches the border
  y = y -1;
  }
    image(photo3, X, 490);
  if (y>0) { //add this to make it sop when it reaches the border
  y = y -1;
  }
}


