
class Alphabet{
  char alpha;
  PVector location;
  PVector velocity= new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  PVector aim;
  float r;
  float g;
  float b;
  Alphabet(char word, float x,float y,float aimx, float aimy){
    alpha = word;
    location= new PVector(x,y);
    aim = new PVector(aimx,aimy);
    r= random(0,255);
    g= random(0,255);
    b= random(0,255);
    
  }
  void display(){
    textFont(f,30);       
    fill(r,g,b);
    text(alpha,location.x,location.y);
  }
  void move(){
    PVector dir = PVector.sub(aim,location); 
    dir.normalize();     
    dir.mult(3);        
    velocity = dir; 
    
    location.add(velocity);
  }
}
ArrayList texts;
String text= "hello my name is Seo Ha";
PFont f;
int j=0;
void setup(){
  size(500,500);
  texts = new ArrayList();
  f = createFont("Arial",16,true);
  
}
void draw(){
  background(255);
  if(mousePressed){
    if(j<23){
    texts.add(new Alphabet(text.charAt(j),mouseX,mouseY,30+j*20,height/2));
    }
    j=j+1;
    if(j>=23){
    Alphabet alphabet = (Alphabet) texts.get(j%23);
    alphabet.location= new PVector(mouseX,mouseY);
    alphabet.r= random(0,255);
    alphabet.g= random(0,255);
    alphabet.b= random(0,255);
    }
  }
  for (int i = texts.size()-1 ; i>= 0; i--) {
    Alphabet alphab = (Alphabet) texts.get(i);
 
    alphab.display();
    alphab.move();
 
  }
  
}

  


