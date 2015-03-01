
PImage yyy;
float speed = 5.0;
float move;
void setup() {  //setup function called initially, only once
  size(620, 250);
  yyy=loadImage("http://www.blogcdn.com/www.autoblog.com/media/2011/04/07-2012-lamborghini-aventador-fd-1304055519-opt.jpg");
         
}
     
void draw() {  //draw function loops
  move=move+speed;
       
  image(yyy,move,10);
  if (move>500){
  move=0
  }
     
  }

