
color[] bandanaduck = {#000000, #4548FF, #FF5D58, #74E1FF, #ECF1FF};
color[] palette = bandanaduck;
color[]deep = {#5B5DFF, #47E8CF, #FFD4B3, #FFDEF5, #BAFF7C};
color[] palette = deep;
color[] pastels = {#FFEA5D, #7BD095, #FD5C52, #F8DBBB, #D1FFD0};

int choice;
int p1 = 1;
int p2 = 2;

float x;
float y;
float d = 50;
float b = 15;

void setup(){
 size(600, 300);
 smooth();
 x = width/2;
 y = height/2;
}

void draw(){
 background(palette[0]);
 fill(palette[1]);
 stroke(palette[2]);
 strokeWeight(b);
 ellipse(x, y, d, d);

 if(mouseX <width/3){  
  d += 1;
  } else { 
   d -+ 1;
 }
