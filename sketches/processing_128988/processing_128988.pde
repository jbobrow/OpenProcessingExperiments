

void setup(){
  size(600,600);
  frameRate(10);
}
 
void draw(){
  scale(3);
  background(30,30,240);
   
  stroke(250,100,0);
  strokeWeight(0);
 
  fill(250,100,0);
  rect(20,50,160,60); 
   
  fill(30,30,240);
  textSize(20);
  text("'Sup World!",35,90);
  berechne(); //Erlaubt, weil "berechne()" bekannt ist!
 lel();
}
 
void berechne(){
    int i=2+2;
    fill(255,0,0);
    text(i,30,30);
}

void lel(){
int x=mouseX;
int y=mouseY;
fill(100,6,24);
text(x,10,180);
text(y,10,160);
}




