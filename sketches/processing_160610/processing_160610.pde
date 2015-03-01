
PImage photo;
float speed =2.0;
float move;

void setup()
{

size(805, 300);
photo = loadImage ("http://blog.karachicorner.com/wp-content/uploads/2012/07/timeline-covers/fb-cover-image-2.jpg");
size(200,200);
  smooth();
  
 
  }

}
void draw()
{
move= move + speed;
image(photo, 10, move);
if(move > 20){
move = 0;
}

  
  }
