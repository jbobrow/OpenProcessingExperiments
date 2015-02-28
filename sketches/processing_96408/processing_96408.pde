
int x=-100;
 int y=05;
 void setup (){
  size (200, 200);
  background (95,5,62);
}
    
 void draw (){
  int spacing= 8;
  int endegs= 200;
  stroke (222,172,204);
  strokeWeight(5);
    x=x+spacing;
    point (x+100,x*x/100+100);
     point (-x+100,-x*x/100+100);
      point (x*x/100+100, x+100);
     point (-x*x/100+100, -x+100);
}
