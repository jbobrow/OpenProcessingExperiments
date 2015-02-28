
import remixlab.proscene.*;

Scene scene;
Figure figure;
PFont myFont;
PImage img;


void setup() {
     size(850, 850, P3D);
     myFont = loadFont("ArialMT-48.vlw");
     scene =new Scene(this);
     figure=new Figure();
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     img= loadImage("maquille.jpg");
     scene.camera().setPosition(new PVector(0,-170,800));
}

void draw() {
     background(0);
     textFont(myFont, 8);
     figure.draw();
}


