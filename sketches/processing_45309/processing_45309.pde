
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.geom.mesh2d.*;

VerletPhysics2D fisica;
Vector particulas;
int n=50;
Rect frontera;
float escala=0.1,strokeW=0.0;

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
    }
    background(255);
}

void draw()
{
    escala+=0.01;
    strokeW+=0.02;
    background(255);
    movimientoAleatorio();
    rect(0,0,width,height);
    fisica.update();
    translate(width/2,height/2);
    dibujaVoronoi();
}

//una funcion que dispara movimientos aleatorios
void movimientoAleatorio()
{
    int nParticulas=particulas.size();
    int randomIndex=(int)random(nParticulas);
    VerletParticle2D p= (VerletParticle2D)particulas.get(randomIndex);
    p.addVelocity(Vec2D.randomVector().scale(0,5));
}


void dibujaVoronoi()
{
    //cambia gradualmente los tamaños
    strokeWeight(pow(2,noise(strokeW)*3));
    //llenamos el diagrama de voronoi con nuestros puntos
    int nParticulas=particulas.size();
    Voronoi voronoi = new Voronoi();
    for (int i=0; i < nParticulas; i++)
    {
        VerletParticle2D p= (VerletParticle2D)particulas.get(i);
        voronoi.addPoint(new Vec2D(p.x,p.y) );
    }
//dibujamos cada polygono
    int k=0;
    float ts=noise(escala);
for (Polygon2D poly : voronoi.getRegions())
    {
        //cortamos la celda de acuerdo a la ventana
        PolygonClipper2D clipper=new SutherlandHodgemanClipper(frontera);
        poly=clipper.clipPolygon(poly);
        //calculamos el centroide de cada polygono
        Vec2D centroid=new Vec2D(0,0);
for( Vec2D v : poly.vertices)
        {
            centroid.addSelf(v);
        }
        centroid.scaleSelf(1.0f/(float)poly.vertices.size());
        //calculamos puntos de bezier
        List<Vec2D> v =new Vector();
        int nv=poly.vertices.size();
        float x1,y1;
        for(int j =0; j < nv; j++)
        {
            Vec2D v1=(Vec2D)poly.vertices.get(j%nv);
            Vec2D v2=(Vec2D)poly.vertices.get((j+1)%nv);

            //evaluamos la curva de bezier en 10 puntos diferentes
            for(int i=0; i < 12; i++)
            {
                float tt=i/(float)12;
                x1=lerp(v1.x,v2.x,tt);
                y1=lerp(v1.y,v2.y,tt);
                v.add( new Vec2D( x1,y1)  );
            }
        }

        //dibujamos pelitos
        stroke(50+random(-25,25),75);
        float tt;
        beginShape(LINES);
        float textra=0;
for(Vec2D vv:v)
        {
            vertex(centroid.x,centroid.y);
            vertex(lerp(centroid.x,vv.x,1),lerp(centroid.y,vv.y,1));
        }
        endShape(CLOSE);
    }
}


