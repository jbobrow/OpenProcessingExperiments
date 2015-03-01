
float r = random(0,2);
float g = random(0,2);
float b = random(0,2);

void setup(){
  size(300,400);
  strokeWeight(1/2);
  background(0);
  translate(190,90);
  itG();
  
  }
void it1(){
    line(0,0,0,1);
    line(0,1,1,1);
  }
  void it2(){
    it1();
    translate(2,0);
    rotate(PI/2);
    it1();
  }
  void it3(){
    it2();
    translate(-2,0);
    rotate(0);
    it2();
  }
  void it4(){
    it3();
    translate(2,4);
    rotate(-PI/2);
    it3();
  }
  void it5(){
    it4();
    translate(2,-4);
    rotate(PI);
    it4();
  }
  void it6(){
    it5();
    translate(-6,4);
    rotate(PI/2);
    it5();
  }
  void it7(){
    it6();
    translate(10,4);
    rotate(0);
    it6();
  }
  void it8(){
    it7();
    translate(-6,-12);
    rotate(-PI/2);
    it7();
  }
  void it9(){
    it8();
    translate(-6,20);
    rotate(PI);
    it8();
  }
  void itA(){
    it9();
    translate(26,-12);
    rotate(PI/2);
    it9();
  }
  void itB(){
    itA();
    translate(-38,-12);
    rotate(0);
    itA();
  }
  void itC(){
   stroke(100*r,100*g,100*b);
    itB();
    translate(26,52);
    rotate(-PI/2);
   stroke(150*r,150*g,150*b);
    itB();
  }
  void itD(){
    itC();
    translate(26,-76);
    rotate(PI);
    itC();
  }
  void itE(){
    itD();
    translate(-102,52);
    rotate(PI/2);
    itD();
  }
  void itF(){
    itE();
    translate(154,52);
    rotate(0);
    itE();
  }
  void itG(){
    itF();
    translate(-102,-204);
    rotate(-PI/2);
    itF();
  }
  /*void mouseClicked(){
    r = random(0,2);
    g = random(0,2);
    b = random(0,2);
    itG();
    }*/
