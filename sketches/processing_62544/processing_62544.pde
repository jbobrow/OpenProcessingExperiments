
int x;
int y=850;
int i=0;
boolean done=false;
PFont font;
int k=0;

void setup(){
    size(600,400);
    background(252,218,3);
    font = loadFont("CenturyGothic-Bold-48.vlw"); 
}
void draw(){
  if(done==false)
  {
  blackOut();
  }
  else
  {
  yellowIn();
  if(i<850)
  {
  fill(252,218,3);
  strokeWeight(10);
  ellipse(0,0,i,i);
  strokeWeight(10);
  ellipse(600,0,i,i);
  strokeWeight(10);
  ellipse(600,400,i,i);
  strokeWeight(10);
  ellipse(0,400,i,i);
  //middle circle
  strokeWeight(100);
  ellipse(300,200,i,i);
  text(i);
  i++;
  }
  else
  {
  fill(252,218,3);
   textAlign(CENTER);
   textFont(font, 40); 
   text("GOODBYE", 300, 200);
  }
  }
}

void blackOut(){
  fill(0);
  if(x<850)
  {
  ellipse(width/2,height/2,(int)random(x),(int)random(x));
  x++;
  if(x>20)
  {
  fill(252,218,3);
  textAlign(CENTER);
  textFont(font,20); 
  text("ˊ _>ˋ", 300, 200);
  }
  }
  else{
  done=true;
  }
 }  
  void yellowIn()
  {
    strokeWeight(100);
    fill(252,218,3,5);
    if(y>0)
    {
    ellipse(width/2,height/2,y,y);
    y--;
    }
    else
    {
     fill(0,0,0,10);
     noStroke();
    rect(0,0,600,400);
  }
  }
void text(int i){
  if(i>130 && k<500 && i%4==0)
  {
  fill(0);
  textAlign(CENTER);
  textFont(font,k); 
  text("HELLO", 300, 200);
  k++;
  }
}

