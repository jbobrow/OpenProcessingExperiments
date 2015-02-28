
Hour1 ho1;
Hour2 ho2;
Minute1 mi1;
Minute2 mi2;



void setup(){
  size(400, 300);
  colorMode(HSB,100);
  background(95);
  textSize(50);

  ho1 = new Hour1(80, height/2 - 45, 0.1);
    ho2 = new Hour2(120, height/2, 0.1);
  mi1 = new Minute1(170, height/2, 0.1);
  mi2 = new Minute2(200, height/2 - 30, 0.1);


}

void draw(){
  noStroke();
  fill(95);
  rect(0, 0, width, height);



  ho1.move();
  ho1.display();

    ho2.move();
  ho2.display();

  mi1.move();
  mi1.display();

 mi2.move();
  mi2.display();
}


class Hour1{
  float x, y, sp;

  Hour1(float _x, float _y, float _sp){
    x = _x;
    y = _y;
    sp = _sp;
  }

  void move(){
    y += sp;
    if (y > height/2 + 90) y =  height/2;
  }


  void display(){
    int h = hour();
    fill(30);
    
    if(h > 19 && h < 24){
      text(2, x, y);
    }else     if(h > 9 && h < 20){
      text(1, x, y);
    }
    else{
      text(0, x, y);
    }


  }
}



class Hour2{
  float x, y, sp;

  Hour2(float _x, float _y, float _sp){
    x = _x;
    y = _y;
    sp = _sp;
  }

  void move(){
    y += sp;
    if (y > height/2 + 90) y = height/2;
  }


  void display(){
    int h = hour();
    fill(30);
    if(h > 19 && h < 24){
      text(h - 20, x, y);
    }else  if(h > 9 && h < 20){
      text(h - 10, x, y);
    }
    else{
      text(h, x, y);
    }


  }
}




class Minute1{
  float x, y, sp;

  Minute1(float _x, float _y, float _sp){
    x = _x;
    y = _y;
    sp = _sp;
  }

  void move(){
    y += sp;
    if (y > height/2 + 60) y = height/2;
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
}


class Minute2{
  float x, y, sp;

  Minute2(float _x, float _y, float _sp){
    x = _x;
    y = _y;
    sp = _sp;
  }
  
    void move(){
   y += sp;
   if (y > height/2 + 60) y =  height/2;
  }

  void display(){
    int m = minute();
    String t =  nf(m,2);
    fill(30);
    
    if(m > 49 && m < 60){
      text(m - 50, x, y);
    }else     if(m > 39 && m < 50){
      text(m - 40, x, y);
    }
    else      if(m > 29 && m < 40){
      text(m - 30, x, y);
    }else      if(m > 19 && m < 30){
      text(m - 20, x, y);
    }else     if(m > 9 && m < 20){
      text(m - 10, x, y);
    }
    else{
      text(m, x, y);
    }
  }

}


                
