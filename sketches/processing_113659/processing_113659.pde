
PImage one;
//have to load the image
PImage two; 
PImage three; 
PImage four; 
PImage five; 
PImage six; 
PImage seven; 
PImage eight; 
PImage nine;
PImage ten; 
PImage eleven; 
PImage twelve; 
PImage thirteen;
PImage fourteen; 
PImage fifteen; 
PImage sixteen; 
PImage seventeen;
PImage eighteen; 
PImage nineteen; 
PImage twenty;  
PImage twentyone; 
PImage twentytwo; 
PImage twentythree; 
PImage twentyfour; 

float rw;
float rh;

void setup() {
  size (600, 600);
  frameRate(1);
  //loading image
  one = loadImage("one.png");
  two = loadImage("two.png");
  three = loadImage("three.png");
  four = loadImage("four.png");
  five = loadImage("five.png");
  six = loadImage("six.jpg");
  seven = loadImage("seven.jpg");
  eight = loadImage("eight.jpg");
  nine = loadImage("nine.jpg");
  ten = loadImage("ten.jpg");
  eleven = loadImage("eleven.jpg");
  twelve = loadImage("twelve.jpg");
  thirteen = loadImage("thirteen.jpg");
  fourteen = loadImage("fourteen.jpg");
  fifteen = loadImage("fifteen.jpg");
  sixteen = loadImage("sixteen.jpg");
  seventeen = loadImage("seventeen.jpg");
  eighteen = loadImage("eighteen.jpg");
  nineteen = loadImage("nineteen.jpg");
  twenty = loadImage("twenty.jpg");
  twentyone = loadImage("21.jpg");
  twentytwo = loadImage("22.jpg");
  twentythree = loadImage("23.jpg");
  twentyfour = loadImage("twentyfour.jpg");
  
  
  // rectMode(CENTER); changes where the shape is drawn from
  imageMode(CENTER);
}

void draw() {

  background(0);
  
  rw = random(0, width);
  rh = random(0, height);
  image (twentyfour, rw, rh);
  
    
  rw = random(0, width);
  rh = random(0, height);
  image (eight, rw, rh);

  
  rw = random(0, width);
  rh = random(0, height);
  image (twentyone, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (twentytwo, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (twentythree, rw, rh);
  
 
  rw = random(0, width);
  rh = random(0, height);
  image(one, rw, rh );


  rw = random(0, width);
  rh = random(0, height);
  image (two, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (three, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (four, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (five, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (six, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (seven, rw, rh);

  
  rw = random(0, width);
  rh = random(0, height);
  image (nine, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (ten, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (eleven, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (twelve, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (thirteen, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (fourteen, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (fifteen, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (sixteen, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (seventeen, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (eighteen, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (nineteen, rw, rh);
  
  rw = random(0, width);
  rh = random(0, height);
  image (twenty, rw, rh);
  

}








//void draw() {
//  background(204);
//  int s = second();  // Values from 0 - 59
//  line(s, 0, s, 33);
//  
//}



