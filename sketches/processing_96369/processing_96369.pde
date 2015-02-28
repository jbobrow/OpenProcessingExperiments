
int x=-100;
 int y=05;
 void setup (){
  size (200, 200);
  background (67,5,90);
}
   
 void draw (){
  int spacing= 5;
  int endegs= 200;
  stroke (241,242,7);
  strokeWeight(4);
    x=x+spacing;
    point (x+100,x*x/100+100);
     point (-x+100,-x*x/100+100);
      point (x*x/100+100, x+100);
     point (-x*x/100+100, -x+100);
 }
