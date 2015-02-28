
//import processing.opengl.*;

//jason Fitzgerald
//symmetry C6
//"Blood cell ribbon"

void setup(){
  //size(300,300,OPENGL);NOPE!
  //size(300,300,P3D);//trying P3D to make it faster.(this appears to be working best)
  size(300,300);
  colorMode(HSB,360,100,100);
  smooth(); //Smooth does not function with p3d?
 background(360,100,50);
  frameRate(30);
}
void draw(){

translate(width/2,height/2);
for(int j = 60; j < 360; j++){
  rotate(radians(60));
  float radius = 1;
  for (int deg =25; deg < 360*1; deg += 1){
    float angle = radians(deg);
    float x = 59 + (cos(angle) * radius);
    float y = -120 + (sin(angle) * radius);
    fill(random(343,360),random(50,100),100);
    //noStroke(); //I like it with a stroke...haha puns are cool
    strokeWeight(.5);
    stroke(random(333,360),random(30,100),random(50,100));
    ellipse(x,y, random(1,10), random(1,20));//by making the random # range 1,10 & 1.20 gives us a twisting "ribbon" effect I like.
    radius = radius + 1.1;
  }
}
}

