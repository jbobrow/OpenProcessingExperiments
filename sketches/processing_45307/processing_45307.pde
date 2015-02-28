
import traer.animation.*;
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.geom.mesh2d.*;
import toxi.processing.*;

VerletPhysics2D fisica;
Vector particulas;
int n=50;
Rect frontera;
float t=0,pel=0,escala=0.1;


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
  escala+=0.01;
  t+=0.006;
  pel+=0.05;
  fill(255,75);
  rect(0,0,width,height);
   movimientoAleatorio();
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
{//llenamos el diagrama de voronoi con nuestros puntos
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
        Vec2D centroid=new Vec2D(0,0);
         for( Vec2D v : poly.vertices){
           centroid.addSelf(v);
        }
        centroid.scaleSelf(1.0f/(float)poly.vertices.size());
        //calculamos puntos de bezier
        List<Vec2D> v =new Vector();
        int nv=poly.vertices.size();
        float x1,x2,y1,y2,x3,y3;
       for(int j =0; j < nv;j++){
        Vec2D v1=(Vec2D)poly.vertices.get(j%nv);
        Vec2D v2=(Vec2D)poly.vertices.get((j+1)%nv);
        Vec2D v3=(Vec2D)poly.vertices.get((j+2)%nv);   
        x1=lerp(lerp(v1.x,v2.x,0.5),centroid.x,ts);
        y1=lerp(lerp(v1.y,v2.y,0.5),centroid.y,ts);
        x2=lerp(v2.x,centroid.x,ts);
        y2=lerp(v2.y,centroid.y,ts);
        x3=lerp(lerp(v2.x,v3.x,0.5),centroid.x,ts);
        y3=lerp(lerp(v2.y,v3.y,0.5),centroid.y,ts);
        //evaluamos la curva de bezier en 10 puntos diferentes
        for(int i=0; i < 10; i++){
          float tt=i/(float)10;
          float xpos= (1.0-tt)*(lerp(x1,x2,tt))+tt*(lerp(x2,x3,tt));
          float ypos= (1.0-tt)*(lerp(y1,y2,tt))+tt*(lerp(y2,y3,tt));
        v.add( new Vec2D( xpos,ypos)  );
        }
       }

      
      //dibujamos pelitos
 stroke(220+random(-25,25),0,0,150);
 float tt;
        beginShape(LINES);
        float textra=0;
        for(Vec2D vv:v){
          tt=2.0+sin(textra);
          textra+=0.05;
 vertex(vv.x,vv.y);
vertex(lerp(centroid.x,vv.x,tt),lerp(centroid.y,vv.y,tt));
        }     
      endShape(CLOSE);
    
               //dibujamos celda
        stroke(255,0,0);
fill(0,225);
        beginShape();
        for(Vec2D vv:v){
        vertex(vv.x,vv.y);
        }     
      endShape(CLOSE);    
    }

   
}



