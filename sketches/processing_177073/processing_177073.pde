
PImage b;
Int Tsize= 40;

void setup() {  //setup function called initially, only once
  size(1024, 768);
  b = loadImage("http://m0.i.pbase.com/o3/57/624457/1/117157500.Nxdh6DlB.20090817_D704309_10_11_12Editscreen.jpg" );
  
}

void draw() {   

  background(b);
  text("MY WEB", 410, 80, textSize(Tsize));
  
}
