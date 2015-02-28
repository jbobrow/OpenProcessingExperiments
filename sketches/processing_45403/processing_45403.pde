
import java.util.Vector;
import toxi.physics2d.constraints.*;
import toxi.physics2d.*;
import toxi.geom.*;

VerletPhysics2D fisica;
Tendril t;

void setup()
{
    size(600,600);
//setup de la fisica
    fisica=new VerletPhysics2D();
    fisica.setWorldBounds(new Rect(-width/2, -height/2, width, height));

    t=new Tendril(fisica);
    background(0);
}


void draw()
{
    fisica.update();
    t.update();
    translate(width/2,height/2);
    t.draw();
}


