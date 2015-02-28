
int x=-100;
 int y=25;
 void setup (){
  size (200, 200);
  background (0);
}
     
 void draw (){
  int spacing= 7;
  int endegs=200;
  stroke (96,87,80);
  strokeWeight(4);
    x=x+spacing;
    point (x+100,x*x/100+100);
point (-x+100,-x*x/100+100);
point (x*x/100+100, x+100);
point (-x*x/100+100, -x+100);

       
  }
