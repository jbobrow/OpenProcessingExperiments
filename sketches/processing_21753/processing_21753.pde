
PImage imagen;
Snowflake[] snow;
int numSnows = 50;

void setup()
{
  size(192,157);
  imagen= loadImage ("ny.jpg");
  
  snow = new Snowflake[numSnows];
  for(int i = 0; i<numSnows;i++)
    snow[i] = new Snowflake(i*10, 0);
  frameRate(30);
  smooth();
}

void draw()
{
  image(imagen,0,0);
  for(int i = 0; i<snow.length; i++){
    snow[i].fall();
    snow[i].render();
  }
}


