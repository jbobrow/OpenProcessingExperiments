
class dotter{
  int x,y;
  dotter(){
    x=width/2;
    y=height/2;
  }
  void display(){
    int i=0;
    while(i<480){
      i++;
      point(random(720),i);
    }
  }
}
dotter d;
dotter e;
void setup(){ 
d= new dotter();
e= new dotter();
size(640,480);  
smooth();
background(0);}
void draw(){
  float yoyoy= constrain(mouseX, 50, 150);
  float yoyoyo=constrain(mouseY, 100, 200);
  float yoyoy1= constrain(mouseX, 160, 240);
  float yoyoyo1=constrain(mouseY, 160, 240);
  
   
  if(mouseX==yoyoy&&mouseY==yoyoyo){
    stroke(255);
    strokeWeight(0.1);
    d.display();
    strokeWeight(100);
    point(100,150);
    strokeWeight(80);
    stroke(255,0,0);
    point(200,200);
    
  }
  else if(mouseX==yoyoy1&&mouseY==yoyoyo1){
    stroke(255,0,0);
    strokeWeight(0.1);
    e.display();
    stroke(255);
    strokeWeight(80);
    point(200,200);
    strokeWeight(100);
    stroke(255,0,0);
    point(100,150);
    
  }
}
