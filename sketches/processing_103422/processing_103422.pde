
omm [] omm = new omm[20];

void setup() {
  size(1000, 700);  
  smooth();

  for (int i = 0; i < omm.length; i++) {
    omm[omm.length-i-1] = new omm(omm.length-i-1);
  }
}

void draw() {  
  background(255);

  for (int i = 0; i < omm.length; i++) {
    omm[i].looking();
  }
}

//------------------------------------------------------------------------------------------------

class omm {
  float x;  //座標
  float y;
  float vx; //速度
  float vy;
  float k;  //緩衝常數
  float l;  //間格距離
  float ll; //間格距離超距版

  int num; //編號

  omm(int i) {
    x = width / 2;
    y = height / 2;
    vx = 0;
    vy = 0;
    num = i;
    k = 0.15;
  }


  void looking() {

    if (num == (omm.length - 1)) {        //頭
      x = mouseX - 60;
      y = mouseY - 60; 
      fill(50, 200, 0);   
      stroke(0);
      strokeWeight(5);          
      ellipse(x, y, 120, 120);
      line(x-40, y-20, x-10, y-20);
      line(x+40, y-20, x+10, y-20);
      line(x-15, y+30, x+15, y+30);
    //  line(x+(60/sqrt(2)), y-(60/sqrt(2)), x+70, y-70);
     // line(x-(60/sqrt(2)), y-(60/sqrt(2)), x-70, y-70);
      noFill();
      curve(x+(60/sqrt(2))+50, y-(60/sqrt(2))-20,x+(60/sqrt(2)), y-(60/sqrt(2)), x+(60/sqrt(2))+20, y-(60/sqrt(2))-20, x+(60/sqrt(2))-40, y-(60/sqrt(2))-40);
      curve(x-(60/sqrt(2))-50, y-(60/sqrt(2))-20,x-(60/sqrt(2)), y-(60/sqrt(2)), x-(60/sqrt(2))-20, y-(60/sqrt(2))-20, x-(60/sqrt(2))+40, y-(60/sqrt(2))-40);
      noStroke();
      fill(0);
      ellipse(x-25, y-15, 10, 10);
      ellipse(x+25, y-15, 10, 10);
    }
    else {                                 //身體
      strokeWeight(3);
      stroke(0);      
      fill(200, 0, 0, 50);
      ellipse(x, y, 100, 100);
      line(x+(50/sqrt(2)), y+(50/sqrt(2)), x+55, y+55);
      line(x-(50/sqrt(2)), y+(50/sqrt(2)), x-55, y+55);
      l = sqrt(sq(omm[num+1].x - x) + sq(omm[num+1].y - y));
      if (l < 90 ) {

        vx = (omm[num+1].x - x) * k;
        vy = (omm[num+1].y - y) * k;

        x = x + vx;
        y = y + vy;
      }
      else if (l >= 90) {
        ll = sqrt(sq(omm[num+1].x - x) + sq(omm[num+1].y - y));

        vx = (omm[num+1].x - x) * k;
        vy = (omm[num+1].y - y) * k;
        x = (omm[num+1].x) - (90*(omm[num+1].x - x)/ll) + vx;
        y = (omm[num+1].y) - (90*(omm[num+1].y - y)/ll) + vy;
      }
    }
  }
}


