
//脱線
//どこでも旭日つくる
//いつのまにかmakeになってる
class Sun{
  float x, y;
  float easing;
  float p, q, r;
  float rad, w;
  Sun(float x, float y){
    this.x = x;
    this.y = y;
    w=random(.03, .5);            //strokeweight
    easing=random(0.05, 0.15);    //easing
    p=0;
    q=0;
    r=0;
    rad=random(40, 130);         //max line length
    strokeCap(ROUND);
  }
  void show(){
    pushMatrix();
    translate(x, y);
    strokeWeight(p);
    for(int i=0; i<12; i++){
      stroke(98, 20, 25);
      line(q, 0, r, 0);
      stroke(20, 40, 75, map(dist(q, 0, r, 0), 0, rad, 0, 100) );
      ellipse(q, q, 10, 10);
      rotate(radians(30));
    }
    popMatrix();
      q+=1.2;
      p+=w;
      r+=(rad-r)*easing;
  }
}
PFont make;
PFont submake;
String m, subm;
//float tW;                                //横幅はかろうとおもったのに機能しないし
float bigger;
ArrayList<Sun> suns = new ArrayList<Sun>();
void setup(){
  size(400, 300);
  textAlign(CENTER);
  make = createFont("Arial Bold", 100);
  submake = createFont("Franklin Gothic Medium", 27);
  m="Make:";
  subm="technology on your time";
  smooth();
  rectMode(CENTER);
  colorMode(RGB, 100);
  bigger=1;
//  println(tW);
}

void draw(){
  background(100);
  for(int i=0; i<suns.size(); i++){
    Sun s=suns.get(i);
    s.show();
    if(s.q>s.r)suns.remove(i);          //measure distance between start and end point of line 
  }                                     //if its zero, that line removed

  pushStyle();
  pushMatrix();
  translate(width/2, height/2);
  scale(bigger);
  strokeWeight(3);
  stroke(20, 40, 75, 70);
  fill(100, 80);
  rectMode(CENTER);
  rect(0, -20, 300, 150);
  fill(100, 0, 0);
  textFont(make);
  text(m, 0, 0);
  fill(20, 40, 75);
  textFont(submake);
  text(subm, 0, 20, 300, 32);
  popMatrix();
  popStyle();
  
}
/*
void mousePressed(){
  suns.add(new Sun(mouseX, mouseY));
}
*/
//↓行き急ぐ人向け・やりすぎると低速

void mousePressed(){
  for(int i=0; i<10; i++){
    suns.add(new Sun(random(-width/3, width*4/3), random(-height/3, height*4/3)));
  }
}

void keyPressed(){
  println("pressed");
  saveFrame("thumnail.png");
}

