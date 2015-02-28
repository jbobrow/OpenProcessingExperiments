

Hour1 ho1;
Hour2 ho2;
Minute1 mi1;
Minute2 mi2;



void setup(){
  size(400, 300);
  colorMode(HSB,100);
  background(95);
  textSize(55);

  ho1 = new Hour1(80, height/2 - 60, 0.3, height/2 - 60);
  ho2 = new Hour2(120, height/2, 0.3, height/2);
  mi1 = new Minute1(180, height/2, 0.3, height/2);
  mi2 = new Minute2(210, height/2 - 30, 0.3, height/2 - 30);


}

void draw(){
  noStroke();
  fill(95);
  rect(0, 0, width, height);



  ho1.move();
  ho1.display2();
  ho1.display1();


  ho2.move();
  ho2.display2();
  ho2.display();

  mi1.move();
  mi1.display2();
  mi1.display();

  mi2.move();
  mi2.display2();
  mi2.display();
}






class Hour1{
  float x, y, sp, y2;

  Hour1(float _x, float _y, float _sp, float _y2){
    x = _x;
    y = _y;
    y2 = _y2;
    sp = _sp;
  }

  void move(){
    y += sp;
    y2 += sp;
    if (y > height/2 + 90) y =  height/2;

    if (y2 > height + 30) y2 = y;

  }


  void display1(){
    int h = hour();
    fill(30);

    if(h > 19 && h < 24){
      text(2, x, y);
    }
    else     if(h > 9 && h < 20){
      text(1, x, y);
    }
    else{
      text(0, x, y);
    }


  }

  void display2(){
    int h = hour();
    fill(70);


    if(h > 19 && h < 24){
      text(2, x, y2);
    }
    else     if(h > 9 && h < 20){
      text(1, x, y2);
    }
    else{
      text(0, x, y2);
    }


  }
}



class Hour2{
  float x, y, sp, y2;

  Hour2(float _x, float _y, float _sp, float _y2){
    x = _x;
    y = _y;

    y2 = _y2;
    sp = _sp;
  }

  void move(){
    y += sp;
    y2 += sp;
    if (y > height/2 + 90) y = height/2;   
    if (y2 > height + 30) y2 = y;

  }


  void display(){
    int h = hour();
    fill(30);
    if(h > 19 && h < 24){
      text(h - 20, x, y);
    }
    else  if(h > 9 && h < 20){
      text(h - 10, x, y);
    }
    else{
      text(h, x, y);
    }


  }

  void display2(){
    int h = hour();
    fill(70);
    if(h > 19 && h < 24){
      text(h - 20, x, y2);
    }
    else  if(h > 9 && h < 20){
      text(h - 10, x, y2);
    }
    else{
      text(h, x, y2);
    }


  }
}



class Minute1{
  float x, y, sp, y2;

  Minute1(float _x, float _y, float _sp, float _y2){
    x = _x;
    y = _y;
    y2 = _y2;
    sp = _sp;
  }

  void move(){
    y += sp;
    y2 += sp;
    if (y > height/2 + 60) y = height/2;
    if (y2 > height + 30) y2 = y;
  }


  void display(){
    int m = minute();
    fill(30);

    if(m > 49 && m < 60){
      text(5, x, y);
    }
    else     if(m > 39 && m < 50){
      text(4, x, y);
    }
    else      if(m > 29 && m < 40){
      text(3, x, y);
    }
    else      if(m > 19 && m < 30){
      text(2, x, y);
    }
    else     if(m > 9 && m < 20){
      text(1, x, y);
    }
    else{
      text(0, x, y);
    }

  }

  void display2(){
    int m = minute();
    fill(70);

    if(m > 49 && m < 60){
      text(5, x, y2);
    }
    else     if(m > 39 && m < 50){
      text(4, x, y2);
    }
    else      if(m > 29 && m < 40){
      text(3, x, y2);
    }
    else      if(m > 19 && m < 30){
      text(2, x, y2);
    }
    else     if(m > 9 && m < 20){
      text(1, x, y2);
    }
    else{
      text(0, x, y2);
    }

  }
}




class Minute2{
  float x, y, sp, y2;

  Minute2(float _x, float _y, float _sp, float _y2){
    x = _x;
    y = _y;

    y2 = _y2;
    sp = _sp;
  }

  void move(){
    y += sp;
        y2 += sp;
    if (y > height/2 + 60) y =  height/2;
    if (y2 > height + 30) y2 = y;
  }

  void display(){
    int m = minute();
    String t =  nf(m,2);
    fill(30);

    if(m > 49 && m < 60){
      text(m - 50, x, y);
    }
    else     if(m > 39 && m < 50){
      text(m - 40, x, y);
    }
    else      if(m > 29 && m < 40){
      text(m - 30, x, y);
    }
    else      if(m > 19 && m < 30){
      text(m - 20, x, y);
    }
    else     if(m > 9 && m < 20){
      text(m - 10, x, y);
    }
    else{
      text(m, x, y);
    }
  }


  void display2(){
    int m = minute();
    String t =  nf(m,2);
    fill(70);

    if(m > 49 && m < 60){
      text(m - 50, x, y2);
    }
    else     if(m > 39 && m < 50){
      text(m - 40, x, y2);
    }
    else      if(m > 29 && m < 40){
      text(m - 30, x, y2);
    }
    else      if(m > 19 && m < 30){
      text(m - 20, x, y2);
    }
    else     if(m > 9 && m < 20){
      text(m - 10, x, y2);
    }
    else{
      text(m, x, y2);
    }
  }
}

