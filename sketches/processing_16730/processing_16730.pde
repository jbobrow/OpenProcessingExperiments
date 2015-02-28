
//Clockクラスを定義
class Clock {
  //属性を定義
  float x, y; 

  Clock(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    

    int s = second();
    int m = minute();
    int h = hour();

    stroke(0);

    //時針
    pushMatrix();

    strokeWeight(8);
    rotate(h * TWO_PI/12);
    line(0,0,0,-70);
    popMatrix();

    //分針
    pushMatrix();

    strokeWeight(4);
    rotate(m * TWO_PI/60);
    line(0,0,0,-120);
    popMatrix();

    //秒針
    /*
    pushMatrix();
    strokeWeight(1);
    rotate(s * TWO_PI/60);
    line(0,0,0,-150);
    popMatrix();
    */



    //周りの円
    pushMatrix();
    rotate(s * TWO_PI/60);
    noStroke();
    fill(255);
    translate(0,-250);
    for (int i = 0; i < 8; i++) {
      rotate(TWO_PI/8);
      translate(3,8);
      ellipse(0,0,30,20);
    }
    popMatrix();




pushMatrix();
    //晴れ
    /*
    noStroke();
    fill(255,0,0);
    translate(-110,-120);
    ellipse(0,0,40,40);
    for (int i = 0; i < 8; i++) {
      stroke(255,0,0);
      rotate(TWO_PI/8);
      line(20,20,25,25);
    }*/
   
     popMatrix();

    //曇り
    /* noStroke();
     fill(255);
     translate(-50,-50);
     for (int i = 0; i < 8; i++) {
     
     translate(3,8);
     rotate(TWO_PI/8);
     ellipse(0,0,30,20);
     }
     */
  }
}





