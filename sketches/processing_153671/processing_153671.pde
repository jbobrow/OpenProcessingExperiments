
//Jeff Conway, jconway@andrew.cmu.edu
//Copyright 2014
PImage photo;

//set image size
float kitty_fatness = 100;
float kitty_tallness = 100;

//set starting position
float x = random(0, 400 - kitty_fatness);
float y = random(0, 400 - kitty_tallness);

//set movement direction
float delta_x = 3;
float delta_y = 2;

//overwritten processing functions
void setup(){
  size(400, 400);
  photo = loadImage("kitten.jpg");
}

void draw(){
  background(0);
  place_the_kitty();
  update_corner_position();
}

//auxiliary functions
void place_the_kitty(){
  image(photo, x, y, kitty_fatness, kitty_tallness);
}

void update_corner_position(){
  update_horizontal_position();
  update_vertical_position();
}

void update_vertical_position(){
  if (y > height){
    y = -1 * kitty_tallness;
  }
  else{
    y += delta_y;
  }
}

void update_horizontal_position(){
  if (x > width){
    x = -1 * kitty_fatness;
  }
  else{
    x += delta_x;
  }
}


