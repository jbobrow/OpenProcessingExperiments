
Cheese tongue;
Toppings bunTop;
Toppings bunBottom;
Toppings tomatoTop;
Toppings tomatoBottom;
Toppings onion;
Lettuce top;
Lettuce bottom;
Eye left;
Eye right;
Extras extra;
Condiments toDraw;


int bgR;
int bgG;
int bgB;

void setup(){
  size(200,200);
  smooth();
  
  bgR = 100;
  bgG = 50;
  bgB = 5;
  
  background(bgR,bgG,bgB);
  
  tongue = new Cheese(255,235,50,2,15,80,40,110,140);
  tongue.show();
   
  bunTop = new Toppings(235,165,2,0,40);
  bunTop.show();
  
  bunBottom = new Toppings(235,165,2,170,40);
  bunBottom.show();
  
  tomatoTop = new Toppings(200,0,0,40,10);
  tomatoTop.show();
  
  tomatoBottom = new Toppings(200,0,0,160,10);
  tomatoBottom.show();
  
  onion = new Toppings(140,10,160,50,10);
  onion.show();
  
  extra = new Extras();
  extra.show();
  
  toDraw = new Condiments(100,0,0,220,195,0,5);
}

void draw(){
  toDraw.show();
  top = new Lettuce(0,200,0,10,20,60,PI/2,PI,0,PI/2);
  top.show();
  
  bottom = new Lettuce(0,200,0,10,20,160,PI,TWO_PI-PI/2,TWO_PI-PI/2,TWO_PI);
  bottom.show();
  
  left = new Eye(255,0,25,12,4,50,85,93);
  left.show();
  
  right = new Eye(255,0,25,12,4,150,85,94);
  right.show();
  
  toDraw.show();
}

