
import ddf.minim.*;
Minim minim;
AudioPlayer in;
void setup(){
size(200,1000);
minim = new Minim(this);
in = minim.loadFile("Young Girl.mp3");
in.play();
}
void draw(){
background(0);
stroke(255);

for(int i=0; i < in.left.size()-1; i++){
  line(100+ in.right.get(i)*20, i ,100+in.right.get(i+1)*20, i+1);
  }
for(int i=0; i < in.left.size()-1; i++){
  stroke(200);
  line(80+ in.right.get(i)*30, i ,80+in.right.get(i+1)*30, i+1);
  line(120+ in.right.get(i)*30, i ,120+in.right.get(i+1)*30, i+1);
  }

for(int i=0; i < in.left.size()-1; i++){
  stroke(200);
  line(80+ in.right.get(i)*40, i ,80+in.right.get(i+1)*40, i+1);
  line(120+ in.right.get(i)*40, i ,120+in.right.get(i+1)*40, i+1);
  }

for(int i=0; i < in.left.size()-1; i++){
  stroke(150);
  line(60+ in.right.get(i)*50, i ,60+in.right.get(i+1)*50, i+1);
  line(140+ in.right.get(i)*50, i ,140+in.right.get(i+1)*50, i+1);
  }

for(int i=0; i < in.left.size()-1; i++){
  stroke(100);
  line(40+ in.right.get(i)*60, i ,40+in.right.get(i+1)*60, i+1);
  line(160+ in.right.get(i)*60, i ,160+in.right.get(i+1)*60, i+1);
  }

for(int i=0; i < in.left.size()-1; i++){
  stroke(50);
  line(20+ in.right.get(i)*70, i ,20+in.right.get(i+1)*70, i+1);
  line(180+ in.right.get(i)*70, i ,180+in.right.get(i+1)*70, i+1);
  }
}

void stop(){
  in.close();
  minim.stop();
  
  super.stop();
}


