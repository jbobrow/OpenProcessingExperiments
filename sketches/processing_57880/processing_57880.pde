
Hello[] square1, square2;
int bye;

void setup(){

  smooth();
  size(800,800);
  background(bye,255,bye);
  bye=0;
  square1 = new Hello[20];
  square2 = new Hello[5];
  for(int i = 0; i < square1.length; i++){
    square1[i] = new Hello(random(cos(width)),tan(height));
  }
  for(int i = 0; i < square2.length; i++){
    square2[i] = new Hello(sin(width/2),(height*2));
  }
}

void draw(){
  fill(100,mouseX,255,bye);
  bye++;
  if(bye==140){
    bye=150;
  }
  rect(0,0,width,height);
  for(int i = 0; i < square1.length; i++){
    square1[i].move();
    square1[i].display();
    
  }
   for(int i=0; i < square2.length; i++){
     square2[i].move();
     square2[i].display();
     
   }

}














class Hello{
  float x,y;
  Hello(float _x, float _y){
    x = _x;
    y = _y;
  }
  void move(){
    x+=1;
    //y+=1;
  if(x > 1000){
    x=0;
  }
  if(y>1000){
    y=0;
  }
  }
  void display(){
   noStroke();
    fill(225,random(100),random(160));
    ellipse(mouseY,mouseX,random(mouseY),random(mouseX));
  }
 
}

