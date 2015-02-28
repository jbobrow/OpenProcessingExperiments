
int y = 0;
int speed = 10;
  
smilely s = new smilely(100);
Timer time;
PImage img;

void setup() {
  img = loadImage("pig.gif");
  time = new Timer (200);
  time.start();
  int s1 = 400;
  size(s1,s1);
  background(255);
  smooth();
  }
    
void draw() {
  image(img, 0, 0);
  
  checkEdges();
    
  s.smileCordx = mouseX;
  s.smileCordy = y;
  s.drawSmiley();
    
  float r = 0;
  float g = 0;
  float b = 0;
  float as= random(3);
  float w = random(3);
  float maxs = random(100,200);
    
    
if (mousePressed){
    r=random(100);
    g=random(100);
    b=random(100);
    background(r,g,b);
    as= random(3);
    w = random(3);
    maxs = random(100,200);
    int i=0;
   
 if (time.isFinished()){
  int[] arrayMath = new int[3];
  s.changeColor();
  arrayMath[0] = 1;
  arrayMath[1] = 2;
  arrayMath[2] = 3;
  int a = arrayMath[0] + arrayMath[1] + arrayMath[2];
    
 for (i=0; i<a; i++){
  fill(255);
  rect(random(400),random(400),20,20);
   }
   time.start();
 }
 /*
 int c=300;
  fill(random(c),random(c),random(c));
  ellipse(smileCordx,smileCordy,100,100);
  fill(s.a);
  ellipse(smileCordx-20,smileCordy-15,16,32);
  ellipse(smileCordx+20,smileCordy-15,16,32);
  fill(s.a);
  arc(smileCordx, smileCordy+20,50, 30, 0, PI);
  */
}
 
}
  
void checkEdges() {
    y = y + speed;
    if ((y > width-50) || (y < 10)) {
      speed = speed * -1;
    }
}
      
class smilely {
  public int a = 0;
  public int c = 0;
  public float smileCordx = mouseX;
  public float smileCordy = y;
  smilely(int initialC){
    c = initialC;
    smileCordx = mouseX;
    smileCordy = y;
  }
  
  void drawSmiley(){
    if (key == 'v'){
        a += 5;
      }
    if (key == 'b' ) {  
      a -= 5;
  }
    fill(random(c),random(c),random(c));
    ellipse(smileCordx,smileCordy,100,100);
    fill(a);
    ellipse(smileCordx-20,smileCordy-15,16,32);
    ellipse(smileCordx+20,smileCordy-15,16,32);
    fill(a);
    arc(smileCordx, smileCordy+20,50, 30, 0, PI);
  }
  void changeColor(){
    int  c=300;
   fill(random(c),random(c),random(c));
  }
  void changeColor2(){
      if (key == 'v'){
        a += 10;
      }
    if (key == 'b' ) {  
      a -= 10;
  }
      }
  }
class Timer{
  int time;
  int limit;
   
  Timer(int timeLimit){
    limit = timeLimit;
  }
  void start(){
    time=millis();
  }
  boolean isFinished() {
    int passedTime = millis()-time;
    if (passedTime > limit) {
      return true;
    }
    else{
      return false;
    }
  }
 
}

