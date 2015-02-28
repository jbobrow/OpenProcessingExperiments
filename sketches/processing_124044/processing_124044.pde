
ArrayList<Queen> queenArray = new ArrayList<Queen>();
float t=1, t2=2, t3=3, tstep=.1, frame;
void setup(){
  size(600,600);
  frameRate(60);
}
void draw(){
   fill(0,5);
   rect(0,0,width,height);
   Queen temp = new Queen(color(255*noise(t),255*noise(t2),255*noise(t3)),random(width),random(height),random(5,20),random(-5,5),random(-5,5));
   queenArray.add(temp);
   for(Queen temp2 : queenArray){
     temp2.display();
     temp2.move();
     cinc();
   }
   frame ++;
   println(frame%50);
   if(frame>1200){
     queenArray.clear();
     frame=0;
   }
   
}
void cinc(){
  t+=tstep;
  t2+=tstep;
  t3+=tstep;
}

class Queen{
  color c;
  PVector PositionQ1, VelocityQ1;
  float Qx, Qy, Qv,Qr;
  Queen(color tC, float tQx, float tQy, float tQr, float tQvx, float tQvy){
    PositionQ1 = new PVector(tQx,tQy);
    VelocityQ1 = new PVector(tQvx,tQvy);
    c=tC;
    Qr=tQr;
  }
  void display(){
    noStroke();
    fill(c);
    ellipse(PositionQ1.x,PositionQ1.y,Qr,Qr);
  }
  void move(){
    if(mousePressed){
      if(mouseButton==LEFT){
      VelocityQ1.rotate(.1);
      }
      else{
      VelocityQ1.rotate(-.1); 
      }
    }
    PositionQ1.add(VelocityQ1);
/*    if(frame%120<30){
      PositionQ1.add(VelocityQ1);
    }
    else if(frame%120<60&&frame%120>=30){
      VelocityQ1.rotate(90);
      PositionQ1.add(VelocityQ1);
      VelocityQ1.rotate(-90);
    }
    else if(frame%120<60&&frame%120>=90){
      VelocityQ1.rotate(270);
      PositionQ1.add(VelocityQ1);
      VelocityQ1.rotate(-270);
    }
    else{
      PositionQ1.sub(VelocityQ1);
    }*/
  }
}


