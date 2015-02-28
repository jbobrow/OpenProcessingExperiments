
/**
 * Background moving
 * by SiV. 
 *
 */

PImage back;
float xpos;
float ypos;
float xvel = 2;
float yvel = 1;
int imwidth;
int imheight;


void setup() {
  imageMode(CENTER);
  size (500,80); 
  back=loadImage("./background.jpg");
  xpos=width/2;
  ypos=height/2;
  imwidth=back.width;
  imheight=back.height;
  image(back,xpos, ypos);
}

void draw() {
  float x,y;
  //  xpos=mouseX;
  //  ypos=mouseY;
  //  
  //  x=map(xpos,0, width,(width/2)+((imwidth-width)/2),(width/2)-((imwidth-width)/2));
  //  y=map(ypos,0, height,(height/2)+((imheight-height)/2),(height/2)-((imheight-height)/2));

  x=mouseX;
  y=mouseY;
  if(abs(x-xpos)>xvel) {

    if (x>xpos) {
      xpos+=xvel;
    }
    else
    {
      xpos-=xvel;
    }
  }
  if(abs(y-ypos)>yvel) {
    if (y>ypos) {
      ypos+=yvel;
    }
    else
    {
      ypos-=yvel;
    }
  }

  image(back,map(xpos,0, width,(width/2)+((imwidth-width)/2),(width/2)-((imwidth-width)/2)), map(ypos,0, height,(height/2)+((imheight-height)/2),(height/2)-((imheight-height)/2)));
}


