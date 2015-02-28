
int x=-100;
 int y=05;
 void setup (){
  size (200, 200);
  background (248,252,46);
}
     
 void draw (){
  int spacing= 5;
  int endegs= 200;
  stroke (227,23,169);
  strokeWeight(8);
    x=x+spacing;
    point (x+100,x*x/100+100);
     point (-x+100,-x*x/100+100);
      point (x*x/100+100, x+100);
     point (-x*x/100+100, -x+100);
     
       
  }
