
///make a array list for the rings
// display on screen

ArrayList<Ring> Rings =new ArrayList<Ring>();

void setup(){
  size(960,600);
  background(0);
  frameRate(30);
}

void draw(){
  background(0);
  if(frameCountP == 0 && Rings.size()<5) makeRing(1);
  for (int i = 0; i<Rings.size();i++){
    Ring a = Rings.get(i);
    a.run() ;
  }
  //filter(BLUR,5);
  //println(frameCount);
}

void makeRing(int num){
  for(int i = 0;i<num;i++){
    PVector randompos = new PVector(random(width),random(height));
    Ring a= new Ring(randompos);
    Rings.add(a);
    //filter(BLUR,5);
  }
}


class Ring{
  int age = 0;
  float spin_ang = 0;
  PVector pos;
  float speed;
  float diam = random(10,50);
  int op = 0;
  color c = color(random(255),random(255),random(255));
  Ring(PVector _pos){
    pos = _pos;
    speed = random(-0.1,0.1);
  }
  
  //run the programe
  void run(){
    render();
    age();
    //spin_ang += speed;
  }
  void render(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(spin_ang);
    noFill();
    //stroke(random(255),random(255),random(255));
    stroke(c,op);
    strokeWeight(2);
    ellipse(0,0,diam,diam);
    ellipse(diam/2,diam/2,diam/2,diam/2);
    //filter(BLUR,5);
    spin_ang+=speed;
    popMatrix();
  }
  
  void age(){
    //tint(255,op*10);
    age++;
    diam+=3;
    println(age);
    if (op<255){
      op+=3;
      //println(op);
    }
    if (age>700) {Rings.remove(this);}
   }
    

  }



