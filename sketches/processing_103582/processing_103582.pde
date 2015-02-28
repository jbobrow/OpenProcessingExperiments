
color[] c1={#957ca3,#8195d0,#4da8a1,#a1d356,#d6d846,#d1d365,#dfc5ae,#db8a52,#de768d,#bedc58,#eabca5,#d3953e,#e79fc5,#e9b6bf,#e876a9,#e0ac7d,#e5825b,#eb896c,#ecb35a,#aade79,};

void setup() {
  size(600,600);
  background(255);
  smooth();
}

void draw() {
  filter(ERODE);
  fill(255,255,255,200);
  rect(0,0,width,height);
  
  PVector b_1 = new PVector(300, 200);
  PVector b_2 = new PVector(200, 300);
  PVector b_3 = new PVector(400, 300);
  PVector b_4 = new PVector(300, 400);

  Blackhole blackhole_1 = new Blackhole(100, 20);
  blackhole_1.drawthis();
  Ball ball_1 = new Ball(b_1, 20, frameCount/100.293,#609de0 );
  Ball ball_2 = new Ball(b_2, 20, frameCount/100.293,#609de0 );
  Ball ball_3 = new Ball(b_3, 20, frameCount/100.293,#609de0 );
  Ball ball_4 = new Ball(b_4, 20, frameCount/100.293,#609de0 );
  
  ball_1.drawthis();
  ball_2.drawthis();
  ball_3.drawthis();
  ball_4.drawthis();
  
  ball_1.Gthis();
  
  
  println(ball_1.d);
}

class Ball {
  PVector StartLoc;
  float r;
  float Angle;
  color c;
  float d;
  Ball(PVector temp_StartLoc, float temp_r, float temp_Angle,color temp_c) {
    StartLoc =  temp_StartLoc;
    r = temp_r;
    Angle = temp_Angle;
    c = temp_c;
  }

  void drawthis() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(Angle);
    fill(c);
    stroke(90,80);
    strokeWeight(1);
    ellipse(StartLoc.x-width/2, StartLoc.y-height/2, r, r);
    popMatrix();
  }
  
  void Gthis(){
    d = StartLoc.mag();

  }

}

class Blackhole {
  float r;
  int floor;
  Blackhole(float temp_r, int temp_floor) {
    r=temp_r;
    floor=temp_floor;
  }

  void drawthis() {
    pushMatrix();
    translate(width/2, height/2);
    fill(0);
    ellipse(0, 0, r, r);
    float r1=r;
    for(int i=0;i<floor;i++){
      noFill();
      stroke(c1[i]);
      strokeWeight(random(14,15));
      ellipse(0,0,r1+i*15,r1+i*15);
    }
    
    
    popMatrix();
  }
}
