
int s;
int lastSecond;
int m;
int lastMinute;
int num = 50;
//int[] x = new int[num];
//int[] y = new int[num];


void setup() {
  size(600, 500);
  background(0, 0, 0);
  smooth();
}

void draw() {


  s = second();
  m = minute();
  float r = random(600);
  strokeWeight(.5);
  stroke(random(255), random(255), random(255));
  noFill();



  for (int i = 0; i < num; i++) {
    if (s !=lastSecond) {
      //"M"
      line(190+s, 150+s, 190+s, 250+s);
      line(190+s, 150+s, 220+s, 250+s);
      line(220+s, 250+s, 250+s, 150+s);
      line(250+s, 150+s, 250+s, 250+s);
      //"I"
      line(300+s, 150+s, 300+s, 250+s);
      line(285+s, 150+s, 315+s, 150+s);
      line(285+s, 250+s, 315+s, 250+s);
      //"N"
      line(350+s, 150+s, 350+s, 250+s);
      line(350+s, 150+s, 380+s, 250+s);
      line(380+s, 250+s, 380+s, 150+s);
      //"."

      stroke(random(255), random(255), random(100)) ;
      line(400+s, 250+s, 405+s, 250+s);
      lastSecond=s;
    }


    if (m != lastMinute) {
      //"time"
      stroke(10+r, 200+r, 200+r);
      line(140+m, 150+m, 140+m, 250+m);
      line(130+m, 160+m, 140+m, 150+m);
      lastMinute =m;
    }

    // line(150+s, 150+s, 200+s, 150+s);
    //line(300, 300, 360+s, 330+s);
    //line(300, 300, 100+s, 500+s);
    //line(300, 300, 500+s, 200+s);

    //  if (s > 10) {
    //  line(100+s, 300+s, 70 + s, 300+s);
    //   line(500+s, 200+s, 520+s, 150+s); 
    //   line(300+s, 420+s, 250+s, 500+s);
    //   lastSecond = s;
    //  if (s > 20) {
    ////     line(70+s, 300+s, 80+s, 400+s);
    //   line(250+s, 500+s, 300+s, 280+s);
    //    line(100+s, 600+s, 180+s, 320+s);
    //  line(520+s, 150+s, 400+s, 120+s);
    // if (m != lastMinute - 1){
    //line(70 + m,  300 + m , 30 +m, 150 + m);
    //if (s> 30) {
    //   line(80+s, 400+s, 100+s, 400+s);
    //   line(300+s, 280+s, 380+s, 100+s);
    // line(180+s, 320+s, 300+s, 180+s);
    //   line(400+s, 120+s, 500+s, 50+s);



    //if (m != lastMinute) {
    //  curve(100+s+r, 100+r+s, 0,0 , 15+s+r, 70 +s+r, s, s);
    // lastMinute = m;
    //   }

    println("tick"+s);
    //    }
    //    }
    //    }
    //    }
  }
}



