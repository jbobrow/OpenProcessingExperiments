
import remixlab.proscene.*;

Scene scene;
Figure figure;
PFont myFont;
PImage img;
float temps;

void setup() {
     size(850, 850, P3D);
     myFont = loadFont("ArialMT-48.vlw");
     scene =new Scene(this);
     figure=new Figure();
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);
     img= loadImage("noether.png");
     scene.camera().setPosition(new PVector(0,-170,800));
}

void draw() {
     background(0);
     	temps = temps + 0.005f;
			if ((temps < 0) || temps > 4)
				temps = 0;
     textFont(myFont, 8);
     figure.draw();
}


