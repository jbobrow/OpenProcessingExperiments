

float pos_x = 10;
float pos_y = 10;
float pos_z = 10;
int mode = 0;
float x,y;
float d = 10;
boolean working = false;
void setup ()
{
    size(800, 600);
}

void draw ()
{
    if(mode == 1){
      background(255,0,0);
    }
    if(mode == 2){
      background(0,255,0);
    }if(mode == 3){
      background(0,0,255);
    }
    if(working){
      
    fill((pos_z/360)*255);
    strokeWeight(2);
    //pos_y is -90 to 89.9
    //pos_y is -170 to 170
    ellipse(x, y, d, d);
    x = x + pos_y;
    x=constrain(x,d/2,width-d/2);
    y = y + pos_x;
    y=constrain(y,d/2,height-d/2);
    }
    
}

void setBallPos ( float posX, float posY, float posZ, int modechoice)
{
    pos_x = posX;
    pos_y = posY;
    pos_z = posZ;
    mode = modechoice;
    working = true;
}




