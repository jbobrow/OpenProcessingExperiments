
//BFF
void setup(){
 size(500,700);
smooth();

}

  void draw(){
PImage bff;
bff = loadImage( "bff.jpg");
if(bff==null){
println("image could not be loaded");
}
image(bff,0,0);
PFont fancy;
fancy = loadFont("Vivaldii-90.vlw");
textFont(fancy);
fill(#FFFFFF);
text("Bestest \n Friends\nForever",100,300);

  }



