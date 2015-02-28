
void setup() {
  size(400,120);
  smooth();
}

void draw() {
  background(104);
  stroke(0);
  strokeWeight(3);
  
   for(int i=0;i<120;i++) {
     line(10*i,0,10*i,120);
  }
  
  moth(80,110);
  moth(200,110);
  moth(320,110);
}

void moth(int x, int y) {
  pushMatrix();
  translate(x,y);
  //BUTT
  stroke(204,153,102);
  fill(204,153,102);
  strokeWeight(3);
  arc(0,-25,20,20,radians(0),radians(180));
  //BODY
  stroke(204,102,0,200);
  strokeWeight(30);
  line(0,-35,0,-65);
  stroke(0,90);
  strokeWeight(1);
  line(0,-22,0,-65);
  //Stripes
  stroke(102,51,51,90);
  strokeWeight(1);
  fill(204,102,0,0);
  arc(0,-65,30,30,0,PI);
  arc(0,-55,30,30,0,PI);
  arc(0,-45,30,30,0,PI);
  arc(0,-70,30,30,0,PI);
  //NECK
  fill(0,100);
  arc(0,-65,30,30,radians(200),radians(340));
  //HEAD
  fill(255,204,102);
  arc(0,-78,15,15,radians(180),radians(360));
  noFill();
  stroke(255,204,102);
  strokeWeight(5);
  arc(0,-65,25,25,radians(180),radians(360));
  //Antenai
  strokeWeight(1);
  line(-5,-80,-10,-90);
  line(5,-80,10,-90);
  //WINGS 
  if(mousePressed) {
    stroke(204,102,102,100);
    strokeWeight(30);
    line(-10,-60,-30,-20);
    line(0,-60,-60,-40);
    line(5,-55,20,-20);
    line(15,-55,50,-40);
  }
  else{
    stroke(204,102,102,100);
    strokeWeight(35);
    line(0,-20,0,-50);
  }
  popMatrix();
}
                
                
