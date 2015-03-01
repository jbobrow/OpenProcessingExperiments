

PFont f;                         
void setup(){

size(900, 700);
PImage granite = loadImage("granite.jpg");
image(granite,0,0,900,700);
f = createFont("New Agsana",50, true);  
}
void draw(){
  PImage granite = loadImage("granite.jpg");

 
  PImage grave= loadImage("grave.jpg");
  if (mouseX>1) {
    image(grave, 200, 200);
  image(grave,200, 100);
   image(grave,200, 300);
   image(grave,200, 400);
   image(grave,200, 500);
   image(grave,200, 600);
   image(grave,200, 700);
   image(grave, 300, 200);
  image(grave,300, 100);
   image(grave,300, 300);
   image(grave,300, 400);
   image(grave,300, 500);
   image(grave,300, 600);
   image(grave,300, 700);
   image(grave, 100, 200);
  image(grave,100, 100);
   image(grave,100, 300);
   image(grave,100, 400);
   image(grave,100, 500);
   image(grave,100, 600);
   image(grave,100, 700);
   image(grave, 400, 200);
  image(grave,400, 100);
   image(grave,400, 300);
   image(grave,400, 400);
   image(grave,400, 500);
   image(grave,400, 600);
   image(grave,400, 700);
   image(grave, 500, 200);
  image(grave,500, 100);
   image(grave,500, 300);
   image(grave,500, 400);
   image(grave,500, 500);
   image(grave,500, 600);
   image(grave,500, 700);
   image(grave, 600, 200);
  image(grave,600, 100);
   image(grave,600, 300);
   image(grave,600, 400);
   image(grave,600, 500);
   image(grave,600, 600);
   image(grave,600, 700);
   image(grave, 700, 200);
  image(grave,700, 100);
   image(grave,700, 300);
   image(grave,700, 400);
   image(grave,700, 500);
   image(grave,700, 600);
   image(grave,700, 700);
   image(grave, 800, 200);
  image(grave,800, 100);
   image(grave,800, 300);
   image(grave,800, 400);
   image(grave,800, 500);
   image(grave,800, 600);
   image(grave,800, 700);
   image(grave,0, 200);
  image(grave,0, 100);
   image(grave,0, 300);
   image(grave,0, 400);
   image(grave,0, 500);
   image(grave,0, 600);
   image(grave,0,700);
PImage counter=loadImage("counter.jpg");
  if (mouseX>275) {
    image(counter, 200, 200);
  image(counter,200, 100);
   image(counter,200, 300);
   image(counter,200, 400);
   image(counter,200, 500);
   image(counter,200, 600);
   image(counter,200, 700);
   image(counter, 300, 200);
  image(counter,300, 100);
   image(counter,300, 300);
   image(counter,300, 400);
   image(counter,300, 500);
   image(counter,300, 600);
   image(counter,300, 700);
   image(counter, 100, 200);
  image(counter,100, 100);
   image(counter,100, 300);
   image(counter,100, 400);
   image(counter,100, 500);
   image(counter,100, 600);
   image(counter,100, 700);
   image(counter, 400, 200);
  image(counter,400, 100);
   image(counter,400, 300);
   image(counter,400, 400);
   image(counter,400, 500);
   image(counter,400, 600);
   image(counter,400, 700);
   image(counter, 500, 200);
  image(counter,500, 100);
   image(counter,500, 300);
   image(counter,500, 400);
   image(counter,500, 500);
   image(counter,500, 600);
   image(counter,500, 700);
   image(counter, 600, 200);
  image(counter,600, 100);
   image(counter,600, 300);
   image(counter,600, 400);
   image(counter,600, 500);
   image(counter,600, 600);
   image(counter,600, 700);
   image(counter, 700, 200);
  image(counter,700, 100);
   image(counter,700, 300);
   image(counter,700, 400);
   image(counter,700, 500);
   image(counter,700, 600);
   image(counter,700, 700);
   image(counter, 800, 200);
  image(counter,800, 100);
   image(counter,800, 300);
   image(counter,800, 400);
   image(counter,800, 500);
   image(counter,800, 600);
   image(counter,800, 700);
   image(counter,0, 200);
  image(counter,0, 100);
   image(counter,0, 300);
   image(counter,0, 400);
   image(counter,0, 500);
   image(counter,0, 600);
   image(counter,0,700);
}
PImage stone= loadImage("stone.jpg");
if (mouseX>625) {
    image(stone, 200, 200);
  image(stone,200, 100);
   image(stone,200, 300);
   image(stone,200, 400);
   image(stone,200, 500);
   image(stone,200, 600);
   image(stone,200, 700);
   image(stone, 300, 200);
  image(stone,300, 100);
   image(stone,300, 300);
   image(stone,300, 400);
   image(stone,300, 500);
   image(stone,300, 600);
   image(stone,300, 700);
   image(stone, 100, 200);
  image(stone,100, 100);
   image(stone,100, 300);
   image(stone,100, 400);
   image(stone,100, 500);
   image(stone,100, 600);
   image(stone,100, 700);
   image(stone, 400, 200);
  image(stone,400, 100);
   image(stone,400, 300);
   image(stone,400, 400);
   image(stone,400, 500);
   image(stone,400, 600);
   image(stone,400, 700);
   image(stone, 500, 200);
  image(stone,500, 100);
   image(stone,500, 300);
   image(stone,500, 400);
   image(stone,500, 500);
   image(stone,500, 600);
   image(stone,500, 700);
   image(stone, 600, 200);
  image(stone,600, 100);
   image(stone,600, 300);
   image(stone,600, 400);
   image(stone,600, 500);
   image(stone,600, 600);
   image(stone,600, 700);
   image(stone, 700, 200);
  image(stone,700, 100);
   image(stone,700, 300);
   image(stone,700, 400);
   image(stone,700, 500);
   image(stone,700, 600);
   image(stone,700, 700);
   image(stone, 800, 200);
  image(stone,800, 100);
   image(stone,800, 300);
   image(stone,800, 400);
   image(stone,800, 500);
   image(stone,800, 600);
   image(stone,800, 700);
   image(stone,0, 200);
  image(stone,0, 100);
   image(stone,0, 300);
   image(stone,0, 400);
   image(stone,0, 500);
   image(stone,0, 600);
   image(stone,0,700);
}

  
  }
 
  
  textFont(f,60);                
  fill(255);                         
  text("DON'T TAKE IT FOR GRANITE",25,75);
  if (mouseY < 100){
    PImage img=loadImage("rocky1.jpg");
  image(img, 200, 200);
  image(img,200, 100);
   image(img,200, 300);
   image(img,200, 400);
   image(img,200, 500);
   image(img,200, 600);
   image(img,200, 700);
   image(img, 300, 200);
  image(img,300, 100);
   image(img,300, 300);
   image(img,300, 400);
   image(img,300, 500);
   image(img,300, 600);
   image(img,300, 700);
   image(img, 100, 200);
  image(img,100, 100);
   image(img,100, 300);
   image(img,100, 400);
   image(img,100, 500);
   image(img,100, 600);
   image(img,100, 700);
   image(img, 400, 200);
  image(img,400, 100);
   image(img,400, 300);
   image(img,400, 400);
   image(img,400, 500);
   image(img,400, 600);
   image(img,400, 700);
   image(img, 500, 200);
  image(img,500, 100);
   image(img,500, 300);
   image(img,500, 400);
   image(img,500, 500);
   image(img,500, 600);
   image(img,500, 700);
   image(img, 600, 200);
  image(img,600, 100);
   image(img,600, 300);
   image(img,600, 400);
   image(img,600, 500);
   image(img,600, 600);
   image(img,600, 700);
   image(img, 700, 200);
  image(img,700, 100);
   image(img,700, 300);
   image(img,700, 400);
   image(img,700, 500);
   image(img,700, 600);
   image(img,700, 700);
   image(img, 800, 200);
  image(img,800, 100);
   image(img,800, 300);
   image(img,800, 400);
   image(img,800, 500);
   image(img,800, 600);
   image(img,800, 700);
   image(img,0, 200);
  image(img,0, 100);
   image(img,0, 300);
   image(img,0, 400);
   image(img,0, 500);
   image(img,0, 600);
   image(img,0,700);
 
    PImage ghost=loadImage("ghost.gif");
    if (mouseX > 1) {
      image(ghost,200,225);
    }

  } 
   if (mouseY > 100 && (mouseButton == LEFT)) {
   PImage img=loadImage("granite3.png");
  image(img,mouseX,mouseY);
  } 
  if (mouseY < 100 && (mouseButton == RIGHT)) {
  PImage hand =loadImage("hand.png");
  image(hand,mouseX,mouseY);
  }
}



