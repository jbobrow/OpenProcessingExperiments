
// Spirals recursive generation
// Click to pause, hit a key  to restart
ArrayList sp;
PImage img;

void setup(){
  size(800,800);
  frameRate(300);
  background(255);
  smooth();
  sp=new ArrayList();
  img=loadImage("pic01.gif");
  img.loadPixels();
  sp.add(new Spirale(width/2,height/2,1));
}
void draw(){
  //translate(width/2,height/2);
  for(int i=0;i<sp.size();i++){
    Spirale s=(Spirale)sp.get(i);
    if(abs(s.count)<6 && sp.size()<300 && s.x0>0 && s.x0<width && s.y0>0 && s.y0<height){
      s.display();
   }else{
     //println("supp");
     sp.remove(s);
    }
  }
}
void mousePressed(){
  noLoop();
}
void mouseReleased(){
  loop();
}
void keyPressed(){
  setup();
}
class Spirale{
  float count=0.01;
  float beta=0;  
  float x,y;
  float x0;
  float y0;
  float step=random(0.003,0.01);
  int sens;
  float r=random(50,200);  
//color from = color(0, 0, 250);
//color to = color(0, 252, 0);
//color interA = lerpColor(from, to, random(1));
//color interB = lerpColor(from, to, random(1));
color interA =img.pixels[floor(random(img.width))+floor(random(img.height))*img.height];
color interB =img.pixels[floor(random(img.width))+floor(random(img.height))*img.height];
  Spirale(float X0,float Y0,int Sens){
    x=x0=X0;
    y=y0=Y0;
    sens=Sens;
  }
  void display(){
    //strokeWeight(1);
    stroke(interA,50);
    count+=sens*step;   
    //translate(x0,y0);
    pushMatrix();  
    float x1=x;
    float y1=y;
    x=x0+r*count*sin(count*5);
    y=y0+r*count*cos(count*5);
    //point(x,y);  
    line(x1,y1,x,y);
    stroke(color(interB,20));
    //strokeWeight(4);
    line(x0,y0,x,y);
    popMatrix();  
    if(random(1)<0.01){
     //if(floor(count*100)==300){
      Spirale sp1=new Spirale(x,y,-sens);
      sp.add(sp1);
    }
    
  }
}

