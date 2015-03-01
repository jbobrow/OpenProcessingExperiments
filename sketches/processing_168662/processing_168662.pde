
int xpos= 25;
int ypos= 25;
int speed= 10;

int dirx = speed;
int diry = speed;

int col1 = 255;
int col2 = 255;
int col3 = 255;
int diff = 10;

boolean collum = true;
boolean row = false;

void setup(){
  size(500,500);
  noStroke();
  frameRate(100);
}
void draw(){
  //fill(200,1);
  //rect(0,0,500,500);
   fill(col1,col2,col3);
   ellipse(xpos,ypos,50,50);
   if(collum == true){
     xpos = xpos + dirx;
   }
   if(row == true){
     ypos = ypos + diry;
   }
  

  
  if(xpos > width-25 && collum == true){
    dirx = - speed;
    col1 -= diff;
    col2 -= diff;
    col3 -= diff;
    fill(col1,col2,col3);
    ypos += 50;
  }
  if(xpos< 25 && collum == true){
    dirx = speed;
    col1 -= diff;
    col2 -= diff;
    col3 -= diff;
    ypos += 50;
  }
  if(ypos > height){
    collum = false;
    row = true;
  //  rect(200,200,50,50);
  }
  if(ypos > height-25 && row == true){
    diry = -speed;
    col1 -= diff;
    col2 -= diff;
    col3 -= diff;
  }
  if(ypos < 25 && row == true){
    xpos += 50;       
    diry = speed;
    col1 -= diff;
    col2 -= diff;
    col3 -= diff;
  }
  if(xpos >500){
    collum = true;
    row = false;
    xpos = 25;
    ypos = 0;
  }
  if (col1 < 0 || col2 < 0 || col3 < 0){
    col1 = 255;
    col2 = 255;
    col3 = 255;
  }
}
  


