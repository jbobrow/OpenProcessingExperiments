
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;

VerletPhysics2D fisica;
Vector particulas;
AttractionBehavior atractor,repulsor;
int modeA=20;
int n=100;
Rect frontera;

void setup()
{
    size(600,600);
    smooth();
    noCursor();
//setup de la fisica
    fisica=new VerletPhysics2D();
    frontera=new Rect(-width/2, -height/2, width, height);
    fisica.setDrag(0.05f);
    fisica.setWorldBounds(frontera);
//setup de las particulas
    particulas=new Vector();
    for(int i=0; i < n; i++)
    {
        VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(random(0,width/2)));
        fisica.addParticle(p);
        particulas.add(p);
//esto le da una fuerza repulsiva a cada particula
        fisica.addBehavior(new AttractionBehavior(p, 20, -1.2f, 0.01f));
    }
    background(255);
}

void draw()
{
    atraccionAleatoria();
    fisica.update();
    translate(width/2,height/2);
    dibujaVoronoi();
}

//una funcion que dispara atracciones cada determinado tiempo
void atraccionAleatoria()
{

    if(modeA ==20 )
    {
        if( random(1.0)  > 0.5)modeA=0;
    }
    else
    {
        modeA++;
    }
    if(modeA==0)
    {
      //creamos la atraccion y la dejamos durante 19 iteraciones
        atractor = new AttractionBehavior(Vec2D.randomVector().scale(random(0,width/2)), width/2, 0.9f);
        fisica.addBehavior(atractor);
    }
    if(modeA==19)
    {
      //la quitamos y volvemos la lanzar dados
        fisica.removeBehavior(atractor);
        modeA=20;
    }

}


void dibujaVoronoi()
{
//llenamos el diagrama de voronoi con nuestros puntos
    int nParticulas=particulas.size();
    Voronoi voronoi = new Voronoi();
    for (int i=0; i < nParticulas; i++)
    {
        VerletParticle2D p= (VerletParticle2D)particulas.get(i);
        voronoi.addPoint(new Vec2D(p.x,p.y) );
    }
//dibujamos cada polygono
    int i=0;
for (Polygon2D poly : voronoi.getRegions())
    {
      //cortamos la celda de acuerdo a la ventana
        PolygonClipper2D clipper=new SutherlandHodgemanClipper(frontera);
        poly=clipper.clipPolygon(poly);
        //el color lo escogemos de acuerdo al tamaño de la celda
        float C= map( abs(poly.getArea()) ,500,7000,0,255);
        stroke(255-C);
        strokeWeight( constrain(map(abs(poly.getArea()),1000,7000,5,1),1,5)  );
        fill(C,125);
       //dibujamos
        beginShape();
         for( Vec2D v : poly.vertices)
        {
            vertex(v.x,v.y);
        }
        endShape(CLOSE);
        i++;
    }
}


