
PImage mynd; // PImage er gagnategund (datatype)
PImage mynd2;
PImage mynd3;

void setup () {
  size (640, 360);
  mynd = loadImage("standing_cat.png"); // ath ad setja mynd í möppuna: data
  mynd2 = loadImage("ceilingcat.png");
  mynd3 = loadImage("dodge-cat.png");
  
}
  
  void draw() {
   image(mynd, 0,0);   //í vinstra horni efst
   image(mynd2, 300,200,150,150);
   image(mynd2, 300,100,300,200);
   image(mynd2, 320,0,400,250);
   image(mynd3, 0,270, 150,150);
   image(mynd, mouseX, mouseY, 55,44);     //thar sem musin er
   
  }
