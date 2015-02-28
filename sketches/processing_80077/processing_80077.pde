
PFont font;
PImage ironman;
float w, h;
 
void setup() {
  size(1000, 800);
  font = loadFont ("OCRAbyBT-Regular-40.vlw"); //llamar desde processing, tolls - create font
  textFont (font);
  background(0);
  
  //ironman = loadImage ("iron-man.png");
 

  strokeCap(SQUARE);
  noFill();
  w = width / 2;
  h = height / 2;
}
 
 
void draw() {
  background(#F2D702);

  
//  image (ironman, 300, 350 , 400, 400);
 
 noFill();
  //translate(1050, 100);
 //rotate(PI/1.5);
  smooth();
  strokeWeight(40);
  stroke(#000000);
  hand(new PVector(w, h), 700, radians(second()*6.1));
  
  
  smooth();
  strokeWeight(80);
  stroke(#00B5D3);
  hand(new PVector(w, h), 360, radians(hour()*15));
   

  smooth();
  strokeWeight(70);
  stroke(#F20202);
  hand(new PVector(w, h), 550, radians(minute()*6));
   

}
 
void hand(PVector loc, float radius, float angle){
   
 
  arc(loc.x, loc.y, radius, radius, 0, angle);
  
  
  

  int a = second();
  int b = minute();
  int c = hour();
  
  String t = nf(c,2) + ":" + nf(b,2) + ":" + nf(a,2);
 textAlign(CENTER);
 
 
text (t,500,410);

}



