
int i=0;
  void setup(){
    size(800,800);
    background(225);
    stroke(225);
  }
  
  void draw(){
    fill(180,random(50,100),random(120,200),50);
    translate(width/2,height/2);
    rotate(i++);
    ellipse(i%500,1,10,10);
    fill(200,random(150,200),random(10,30),15);
    rect(i%500,1,i%33,5+i%50);
    fill(10,random(150,200),random(150,230),20);
    rect(i%500,8,i%33,5+i%10);
  }
