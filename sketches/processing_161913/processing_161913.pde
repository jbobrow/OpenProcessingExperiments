
/* @pjs preload="snowflake.png"; */

size(500,500);
background(220);
PImage snowflake;
snowflake = loadImage("snowflake.png");
//image(snowflake,0,0,500,500);

int x = 120;
int y = -50;
for (int i=51;i<=255;i+=32) {
  tint(255,i);
  image(snowflake,x+300,y,200,200);
  image(snowflake,x+150,y,200,200);
  image(snowflake,x,y,200,200);
  image(snowflake,x-150,y,200,200);
  image(snowflake,x-300,y,200,200);
  
  x -= 15;
  y += 72;
}


