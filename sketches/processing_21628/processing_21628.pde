
int num=50;
 
obj[] myobj = new obj[num];
color[] myColors = new color[5];
 
void setup(){
  size(400,400);
  smooth();
  background(255);
 myColors[0] = color(150,100,150,20);
 myColors[1] = color(100,150,200,20);
 myColors[2] = color(200,100,150,20);
 myColors[3] = color(150,100,255,20);
 for(int x=0;x<myobj.length;x++){
   myobj[x]= new obj(20);
 }
}
 
void draw() {
 
 
  for(int x=0; x < myobj.length; x++) {
    myobj[x].update();
    myobj[x].draw();
  }
}
 
 
class obj {
 
  float xpos = random(30,width-30);
  float ypos = random(30,height-30);
 float rot ;
 
  color c = myColors[floor(random(0,4))];
 
  obj(float rot_) {
    rot = rot_;
  }
   
  void update() {
    xpos=xpos+random(-10,10);
    ypos=ypos+random(-10,10);
  }
 
  void draw() {
    noStroke();
    fill(c);
    ellipse(xpos,ypos,random(20),random(20));
  }
}


