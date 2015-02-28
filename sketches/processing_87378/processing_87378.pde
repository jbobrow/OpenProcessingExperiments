
int playerx= 20;
int points=0;
void setup() {  
  size(1000, 250);
  noCursor();
}
void draw() {  
  int s=millis()/1000;
  int c=random(120,255);
  int c2=random(120,255);
  int c3=random(120,255);
  int p=sin(s)*250;
  background(0); 
  fill(255);
  rect(mouseX,200,playerx,10 );
  fill(c,c2,c3);
  rect(p+500,100,40,10);
  println(c);
  text(points, 10, 10);
  if(p+540<mouseX){
  points-=10;
  }
  if(mouseX<p+500){
  points-=10;
  }
  if(mouseX>p+500 && p+540>mouseX){
  points+=15;
  }
  if (120-s <= 0){
  background(0);
  fill(255);
  if(points >= 0)
  text("YOUWASTED120SECONDSOFYOURLIFE!",10,10);
  if(points <= 0)
  text("Just leave.",10,10);
  }
}
