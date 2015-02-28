
int x=-100;
 int y=25;
 void setup (){
  size (200, 200);
  background (0);
}
     
 void draw (){
  int spacing= 05;
  int endegs=200;
  stroke (#FFF93B);
  strokeWeight(6);
    x=x+spacing;
    point (x+100,x*x/100+100); 
     point (-x+100,-x*x/100+100); 
      point (x*x/100+100, x+100); 
     point (-x*x/100+100, -x+100);
 }
