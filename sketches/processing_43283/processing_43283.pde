
PImage img;
float start_x=30;
float start_y=10;
int i=0;
int n=0;
 
ArrayList<dust> dust;//居場所を作ってあげて
 
void setup(){
  size(640, 480);
  dust = new ArrayList();
  img = loadImage("Totoro2.jpg");
}
 
void draw(){
  image(img,0,0);
  ArrayList<dust> dead = new ArrayList();
  textSize(40);
  text("Float This Way→",0,30);
  println(n);
   
  for(dust d : dust){
    d.draw();
    d.walk();
    if(d.x > width+50){
      dead.add(d);
      n--;
    }
  }
   
  for(dust d : dead){
    dust.remove(d);
  }
 
  if(random(1) < 0.25 ){
    n++;
    dust.add(new dust());
  }
 
}
 
class dust{
  int col;
  float x,y,sp;
 
  dust(){//Placement of circles
    this.x = random(-50);
    this.y = random(25,height-25);
    col = int(random(0,150));
    sp = random(1,5);
  }
 
  void draw(){
    noStroke();
    fill(col,90);
    ellipse(x,y,45,45);
  }
   
  void walk(){
    x+=sp;
  }
}

