
PImage myimage;
//placement up here makes this accessible to both void setup and void draw
PImage secondimage;

void setup() {
  size(300, 300);
  myimage = loadImage("pug_pic.jpg");
  secondimage = loadImage("panda_pic.jpg");
  frameRate(5);
}


  
  
  void draw(){
    
    image(myimage, 0, 0,300, 300);
    //two coordinates = x top, y top
    tint(mouseY, mouseX, 0, 250);
    image(secondimage, 50, 110, 100, 100);
    
  }

