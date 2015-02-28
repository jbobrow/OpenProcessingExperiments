
import remixlab.proscene.*;
Scene scene;
Ceva ceva;
PImage abeille;
//
//
void setup(){
     size(850,850,P3D);
     scene =new Scene(this);
     scene.setRadius(100);
    
     scene.camera().setPosition(new PVector(0,600,600));
       scene.camera().setOrientation(0,0.8); 
    scene.setGridIsDrawn(false);
    
     scene.setAxisIsDrawn(false);
     ceva=new Ceva();
     abeille = loadImage("sonia.gif");

}

//
//
void draw(){
background(220);
lights();
 scene.drawGrid(200,50);
ceva.cevaDraw();


}//fin de draw()



