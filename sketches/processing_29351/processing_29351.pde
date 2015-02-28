
class Food {


  PImage picture;
  int foodtype;
  int x, y;
  int speed;


  Food () {
    speed = 6; 
    x = int(random(-300,-100));
    y= int(random(0,height));
    allocate();
  }
  
  void display() {
    image(picture,x,y,picture.width,picture.height);
    if (x > width) {   //if x > width, restart the array with new food options, rather then repeat current selection
      x= int(random(-300,-100));
      y = int(random(50,height-50));
      allocate();
    }
  } 

  void update() {
    x += speed;
  }


  void allocate()  {
    int let = int(random(0,5)); 
    foodtype = 0;
    if     (let == 0) { 
      picture = loadImage("STEAK.png"); 
      foodtype = 1;   }
    else if (let == 1) { 
      picture = loadImage("Pizza1.png"); }
    else if (let == 2) { 
      picture = loadImage("Pasta.png");}
    else if (let == 3) { 
      picture = loadImage("Chicken.png"); 
      foodtype = 2; }
    else if (let == 4) { 
      picture = loadImage("TOFU.png"); }
  }
  
  
  void reset(){
    x = int(random(-300,-100));
    y= int(random(50,height-50)); 
  }
  

  int foodypass() {
  return foodtype; }
}

