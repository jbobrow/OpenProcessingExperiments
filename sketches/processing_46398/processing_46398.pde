
import remixlab.proscene.*;
Scene scene;
Ceva ceva;
PImage abeille;
//
//
void setup(){
     size(900,600,P3D);
     scene =new Scene(this);
     scene.setRadius(100);
     scene.camera().setPosition(new PVector(0,0,450));
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     ceva=new Ceva();
     abeille = loadImage("sonia.jpg");

}

//
//
void draw(){
background(220);
lights();

ceva.cevaDraw();


}//fin de draw()



