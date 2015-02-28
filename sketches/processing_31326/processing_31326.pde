
PImage crow;
PImage crow_apple;
PImage brown_bird;
PImage eaten;
PImage fatty_bird;
PImage sunset;
PImage apple;
PImage parrot;
PImage peacock;
PImage candy_land;
PImage current_image;
void setup(){
  size(500,500);
  crow = loadImage("crow.jpg");
  crow.resize(500,500);
  brown_bird = loadImage("brown bird.jpg");
  brown_bird.resize(500,500);
  candy_land = loadImage("candy_land_board_game.jpg");
  candy_land.resize(500,500);
  crow_apple = loadImage("crow_apple.jpg");
  crow_apple.resize(500,500);
  eaten = loadImage("eaten.jpg");
  eaten.resize(500,500);
  fatty_bird = loadImage("fatty_bird.jpg");
  fatty_bird.resize(500,500);
  sunset = loadImage("flyingintosunsetyay.jpg");
  sunset.resize(500,500);
  apple = loadImage("greenapple.jpg");
  apple.resize(500,500);
  parrot = loadImage("parrot.jpg");
  parrot.resize(500,500);
  peacock = loadImage("peacock_chui.jpg");
  peacock.resize(500,500);
  
   image(crow,0,0);
   text("Hello! My name is Abby \n and I am the head of this counsel",5,450);
  
 
  }

void draw(){
  fill(200,50,50);
   rect(480,480,20,20);
  if(mousePressed == true){
  if(mouseX>480 && mouseY>475){
    image(brown_bird,0,0);
    text("I am Hailey, the brown bird, therefore I am BETTER than you. \n I am the king of the forest HEAR ME SQUABBLE!! RAAA!!", 10,10);
  delay(2000);
  }
  }
 fill(50,200,50);
 rect(480,455,20,20);
  if(mousePressed == true){
  if(mouseX>480 && mouseY>460 && mouseY< 475){
    image(peacock,0,0);
    fill(255,255,255);
    text("Hey y'all I'm a peacock WHAT?! WHAT?!  My name's Chewy...\n and I think we need more women.  And the brown bird should shut up, too.",10,20);
  }
  }
  fill(50,50,200);
  rect(480,430,20,20);
  if(mousePressed == true){
  if(mouseX>480 && mouseY>420 && mouseY<440){
  image(parrot,0,0);
  fill(255,255,255);
  text("I am Remy and I'm so cool \n I can ride a miniature motorcycle. \n Be jealous of my coolness.",10,10); 
}
}
rect(480, 395, 20, 20);
if(mousePressed == true){
  if(mouseX>480 && mouseY>385 && mouseY<405){
    image(apple,0,0);
    fill(255,255,255);
    text("I AM AN APPLE! \n (Caroline)", 230,250);
  }
}
}

