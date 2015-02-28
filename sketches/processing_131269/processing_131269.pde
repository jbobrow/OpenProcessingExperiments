
//Global Variables

/*-----Shape-----*/
float red_rad=50; //circle size
float green_rad=50; //circle size
float blue_rad=5; //circle size
/*-----Color Variables-----*/
/*Stroke*/
float poscol_R; // x color
float poscol_G; // y color
float poscol_B = 1; // negative x color
/*Fill*/
float fillcol_R; // x color
float fillcol_G; // y color
float fillcol_B =255; // negative x color
float p_num= 001;

float red_rotation=1;
float green_rotation=1;
float blue_rotation=1;

float red_elloc = 20;
float green_elloc = 20;
float blue_elloc = 20;


void setup()
{
  size(1600, 900); //resolution 1600x900
  background(100); //white color
  smooth(); //anti aliasing
}

void draw()
{
  //---------red circle series------------
  red_elloc++;
  red_rad = red_rad+0.8;
  red_rotation = red_rotation + 10;
  println(red_rad);
  poscol_R= map(red_rad, 0, 1080, 255, 0);
  println(red_rad);
  fillcol_R= map(red_rad, 0, 1080, 0, 255);
  fill(fillcol_R, 0, 0, 10);
  stroke(poscol_R, 0, 0, 100);
  pushMatrix();
  translate(800, 450);
  rotate(radians(red_rotation));
  ellipse( red_elloc, 0, red_rad, red_rad);
  popMatrix();
  //-------------green rectangle series------------
  green_elloc++;
  green_rad = green_rad+0.8;
  green_rotation = green_rotation + 10;
  println(green_rad);
  poscol_G= map(green_rad, 0, 900, 0, 255);
  println(green_rad);
  fillcol_G= map(green_rad, 0, 900, 255, 0);
  fill(0, fillcol_G, 0, 10);
  stroke(fillcol_R, poscol_G, 0, 100);
  pushMatrix();
  translate(800, 450);
  rotate(radians(green_rotation));
  rectMode(CENTER);
  rect( green_elloc, 0, green_rad, green_rad);
  popMatrix();
  //-----------blue ellipse series------------
  if (green_rad >= 300) {
    noFill();
    poscol_B = poscol_B+1;
    fillcol_B = fillcol_B-1;
    stroke(0, 0, poscol_B, fillcol_B);
    blue_rad = blue_rad +5;
    ellipse(800, 450, blue_rad, blue_rad);
  }
}
void mousePressed() {
  p_num=p_num+1;    //each time increases the number so the new snapshot wont delete the previous one
  save(p_num+"radial.jpg"); 
  loop();
}

