
int x = 0;
float h = 900;
int time;
float theta = 0.1;
Back c1, c2, c3;
Back2 r1;
Back3 t1, t2;
Back4 l1;
Back5 b1;

int limit = 17;


void setup(){
  size(500,1000);
  background(0);
  smooth();
  c1 = new Back(100);//Ã¥ï¿½ï¿½Ã¥Â¾ï¿½
  c2 = new Back(150);
  c3 = new Back(50);
  r1 = new Back2(10);
  t1 = new Back3(100, 500, 1000);//(x, y, Ã¥ï¿½ï¿½Ã¥Â¾ï¿½Ã¯Â¼ï¿½
  t2 = new Back3(100, 500, 100);
  l1 = new Back4(width/2, height/2);
  b1 = new Back5(10, 10);
}
  void draw(){
    
      
  time = millis()/1000;
  if(time <= 3){
    stroke(245, 245, 79);
    t1.tri();
    t2.tri();
    
    textSize (30);
  text("CLICK!!!",20,500);
  text("START three seconds later",10,600);

  }

  if(time == 4){
  background(54, 138, 245, 500);
  
    l1.Line();
  textSize(100);
  stroke(255);
  text(3, width/2, height/2);
  }
  if(time == 5){
  background(145, 245, 79, 500);
  
  l1.Line();
  text(2, width/2, height/2);
  }
  if(time == 6){
  background(245, 136, 52, 500);
  l1.Line();
  
  text(1, width/2, height/2);}
  if(time ==7){
  background(0);
  text("START", 150, height/2);
  }
  if(time >= 7){
  background(0);
  
 
  b1.ball();
  c1.el();
  c2.el();
  c3.el();
  c1.el2();
  c2.el2();
  c3.el2();
  textSize(100); 
  fill(53, 146, 237);
  ellipse(360, h-30, 170, 150);
  fill(255);
  text(x,300, h);
  textSize(30);
  text("TIME;", 10, 600);
  text(limit-17-(time-17), 100, 600);
}
  
  if(time>limit){
    textSize(55);
    strokeWeight(10);
    text("TIME UP",10,800);
    textSize(50);
    text("your record; "+x,10,850);
    textSize(25);
    text("calorie consumption; "+x*1.4+"calorie", 10, 900);
    Stop();
  }
  
  }
  

void mousePressed(){
  pushMatrix();
  fill(245, 245, 79);
  ellipse(mouseX, mouseY, 55, 55);
  if(time>=7){
  x++;
  h--;
  
  if(((b1.x>mouseX&&b1.x-10<mouseX)||(b1.x<mouseX&&b1.x+10>mouseX))&&((b1.y < mouseY && b1.y + 10 > mouseY)||(b1.y > mouseY && b1.y-10 < mouseY))){
  limit++;
  textSize(50);
  text("+1 point", 100, 500);
  }}
  popMatrix();
  }



void mouseDragged(){
  background(245, 72, 72,100);
  
}


void keyPressed(){
  if(key == 's'){
    loop();
}
  if(key == 'p'){
    noLoop();
  }
  if(key == 'q'){
    
    background(0);
  }
  if(key == 'a'){
    limit++;
    
}
}



class Back{
  float theta = 0.1;
  int rd;
  float randcol1;
  float randcol2;
  float randcol3;
  

Back(int r){
   
  rd = r;
  }
  
  void el(){
    randcol1 = random(255);
  randcol2 = random(255);
  randcol3 = random(255);
  
    fill(randcol1, randcol2, randcol3, 500);
    ellipse(250+rd*cos(theta), 200+rd*sin(theta),30, 30);
  theta+=0.1;
    
    
    
  }
  
  void el2(){
    fill(245, 72, 72);
    ellipse(250+rd*-cos(theta),400+rd*-sin(theta), 30, 30);
   theta+=0.2;
 
}
}
class Back2{
  int ti;
  int count = 0;
  float randx = random(500);
  float randy = random(1000);
  
  
  Back2(int t){
    
    ti = t;
    
  }
  
  void Randel(){
    if(count <= 100){
    ellipse(randx, randy, ti, ti);
    count++;
    }
  }
}
    
    
    
class Back3{

int radius;
int x;
int y;
float theta = 0.1;

  Back3(int px, int py, int r){
    
    x = px;//Ã¥ï¿½Â³Ã¥Â½Â¢Ã£ï¿½Â®Ã¤Â½ï¿½Ã§Â½Â®Ã¯Â½ï¿½
    y = py;//Ã¥ï¿½Â³Ã¥Â½Â¢Ã£ï¿½Â®Ã¤Â½ï¿½Ã§Â½Â®y
    
    radius = r;//Ã¥ï¿½ï¿½Ã¥Â¾ï¿½Ã£ï¿½Â®Ã¥Â¤Â§Ã£ï¿½ï¿½Ã£ï¿½ï¿½
    
  }
  
  void tri(){
    
    pushMatrix();
    
    noFill();
    
    stroke(245, 245, 79, 100);
    
    triangle(100, 300, x+radius*sin(theta), y+radius*cos(theta), 400, 300);
    
    theta += 0.1;
    
    popMatrix();
    
  }
}
class Back4{
  
  float theta = 0;
  int x;
  int y;
  
  Back4(int lx, int ly){
    
    x = lx;
    y = ly;
    
  }
  
  void Line(){
    strokeWeight(50);
    line(width/2, height/2, x+200*sin(theta),y+200*cos(theta)); 
    theta += 0.1;
    strokeWeight(1);
  }


}
class Back5{
  int x;
  int y;
  int speed = 1;
  
  Back5(int bx, int by){
    
    x = bx;
    y = by;
    
  }
  
  void ball(){
    
    ellipse(x, y, 20, 20);
    
    x += speed;
 
    if(width<x){
      x=0;
      y+=10;
      speed += 1;
    }
    
  }
      
}


