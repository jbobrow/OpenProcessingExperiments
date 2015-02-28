
int x = 5;
float b = 400;
PFont myfont;

void setup(){
  size(500,500);
  background(0,0,0);
  myfont = loadFont("Antipasto-48.vlw");
  
}

void draw(){
  //fill(250,150,10);
  fill(b,250,150);
  textFont(myfont);
  //textSize(random(200));
  textSize(b);
  text("electric",0,500);
  text("tattoo", 0,400);
  text("exchange",0,450);
  text("asphalt", 0,300);
  text("district",0,250);
  text("bridge", 0,200);
  text("financial",0,150);
  text("textron", 0,100);
  
}

void mousePressed(){ 
  b = b - 10;
   
}




