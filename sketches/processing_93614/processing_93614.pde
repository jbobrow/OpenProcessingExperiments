
int x=-100;
 int y=05;
 void setup (){
  size (200, 200);
  background (0);
}
   
 void draw (){
  int spacing= 8;
  int endegs= 200;
  stroke (44,235,240);
  strokeWeight(5);
    x=x+spacing;
    point (x+100,x*x/100+100);
     point (-x+100,-x*x/100+100);
      point (x*x/100+100, x+100);
     point (-x*x/100+100, -x+100);
   
     
  }
