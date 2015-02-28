
int x=-100;
 int y=05;
 void setup (){
  size (200, 200);
  background (0,15,204);
}
   
 void draw (){
  int spacing= 8;
  int endegs= 200;
  stroke (224,163,163);
  strokeWeight(5);
    x=x+spacing;
    point (x+100,x*x/100+100);
     point (-x+100,-x*x/100+100);
      point (x*x/100+100, x+100);
     point (-x*x/100+100, -x+100);  
  }
