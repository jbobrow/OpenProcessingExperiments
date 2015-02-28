
import remixlab.proscene.*;


Scene scene;
Prisme prisme;
void setup() {
     size(800, 500, P3D);
     scene=new Scene(this);

    scene.setRadius(80);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(false);

     prisme=new Prisme();
}

void draw() { 
     background(240,230,220);
     lights();

     prisme.draw();
}


