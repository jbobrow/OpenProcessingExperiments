
Orange[] oranges;
Bunny bunny;

PImage tree;
//int a=340;
//int b=50;
float x;
float y;
float g=2;
float vy=1;
float move=5;
float friction=-.8;
boolean click=false;
boolean grow=false;

int eatenOranges=0;
int score=0;
   
void setup(){
  tree = loadImage("tree.jpg");
  size(tree.width, tree.height);
  background(tree);

  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  smooth();
  
  oranges = new Orange[10];
  for(int i = 0; i < 10; i++){
    oranges[i] = new Orange(random(100,450), random(200,430));
  }
  
  
  bunny = new Bunny(90,700);
  //photoFilter();
}
 
 
void draw(){
  
  float x=0;
  background(tree);
  fill(0);
  rect(0, 0, 578, 50);

  for(int i = 0; i <10; i++){
    oranges[i].display();
    eatenOranges += oranges[i].isEaten(bunny.xpos(), bunny.ypos());
  }

  if (eatenOranges==10) {
    for(int i = 0; i < 10; i++){
      oranges[i] = new Orange(random(100,450), random(200,430));
    }   
    eatenOranges = 0; 
  }
  bunny.display();

  if((keyPressed==true) && (key == 'a')) x=-move;
  if((keyPressed==true) && (key == 's')) x=move;   
  bunny.move(x, -10);

  println(score);

}

class Orange {
  PImage img;
  float x, y;
  boolean available;
  
  
  //constructor
  Orange(float xpos, float ypos){
    x = xpos;
    y = ypos;
    available = true;
  }

  void display(){
    if(available == true) {
      img = loadImage("orange.png");
      image(img, x, y);    
    }
  }
    
  void move(){
    vy += g;
    y += vy;
    if(y > height){
      vy = 0;
    }

  }
  
  int isEaten(float xpos, float ypos) {
    if((((xpos-x)*(xpos-x)+(ypos-y)*(ypos-y))<3000) && available) {
       score++;
       available = false;
       return 1;
    }
    return 0;
  }
}

class Bunny {
  PImage img;
  float x, y;

  Bunny(float xpos, float ypos){
    x = xpos;
    y = ypos;
  }
  
  void display(){
    img = loadImage("labbit.png");
    image(img, x, y);    
  }
  
  void move(float movex, float jumpv){
    if(((x+movex) < tree.width) && ((x+movex) > 0)) {
      x += movex;   
    }
    vy += g;
    y += vy;
    y -= jumpv;
    if(y > 600){
      vy -= 10;
    }

  }

  float xpos() {
    return x;
  }
  float ypos() {
    return y;
  }

}

