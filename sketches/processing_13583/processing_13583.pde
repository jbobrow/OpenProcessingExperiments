
PFont font;
String s = "mousePressed to see if  PROCESSING doing  OK :" ;
String s2= "                    pow(5,12) =                         " ;

void setup()   {
  size(700,400) ;
  background(109,100,0) ;
  font = loadFont("ArialMT-24.vlw");
  textFont(font) ;
  text(s, 20,40) ;
  text(s2, 20,80) ;
}
////////////////
void draw()  {




}
//////////////
void mousePressed()  {

  float rval = pow(5,12);
  println(" rval by processing  " + rval);

  String ss3= str(rval) ;
  text(ss3, 100, 150);
  String ss4= "Should be 244,140,625" ;

  text(ss4, 200, 250);

}


