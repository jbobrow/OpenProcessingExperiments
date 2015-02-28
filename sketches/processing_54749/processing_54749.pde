
//int x= 8;'
float c = (10);
float d = (30);
float e = (37);
float f = (10);
float b = (450);
PFont myfont;
void setup(){
  size(1000,700);

}

void draw(){
  fill(255,255,255);
  text("Helo helooo...",mouseX-170,mouseY);
  text("is there" );
  text(" anybody");
 text(" in there?");
  
  textSize(19);
  //textFont(myfont);
  fill(c,d,e,f);
  //ellipse(10,10,b,b);
  ellipse(mouseX,mouseY,b,b);
  stroke(0,0,0);
  strokeWeight(0);
  
}

void mousePressed(){
fill(random(255),random(255),random(255));
 c= random(255);
 d= random(255);
 e= random(255);
 f= random(5);

}

void keyPressed(){
rect(random(100),random(100),30,30);}
