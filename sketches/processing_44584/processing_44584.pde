
class BlobSuave
{
    Particle centro;
    float radio,tight,wave,sabor,sat,hue,alfa;
    int n;
    Vector particulas;
    Vector enlaces;
    ParticleSystem fisica;

    BlobSuave(ParticleSystem fisica, float radio,float alfa)
    {
        this.centro=centro;
        this.radio=radio;
        this.fisica=fisica;
        centro=fisica.makeParticle(1.0,0,0,1.0);
        this.n=8;
        particulas=new Vector();
        enlaces=new Vector();
        tight=random(0,1);
        wave=random(0,1);
        hue=random(0,255);
        sabor=random(0,1);
        this.alfa=alfa;
//creo las particulas y las ligo al centro
        for(int i=0; i < (n); i++)
        {
            float angulo=TWO_PI/float(n) * i;
            Particle  p = fisica.makeParticle(1.0,radio*cos(angulo) ,radio*sin(angulo),0.0);
            particulas.add( p );
            enlaces.add( fisica.makeSpring(centro,p,0.01,0.01,radio) );
        }
//concateno el exterior del blob
        Particle ultimo =(Particle)particulas.get(particulas.size()-1);
        for(int i=0; i < n; i++)
        {
            Particle p=(Particle)particulas.get(i);
            float distancia=dist(p.position().x(),p.position().y(),ultimo.position().x(),ultimo.position().y());
            enlaces.add(  fisica.makeSpring(ultimo,p,0.01,0.01,distancia) );
            ultimo=p;
        }

    }

    void update()
    {
        //lanzamiento de moneda aleatorio para darle movimiento a alguna esquina aleatoria
        if(random(1.0) > 0.)
        {
            int randIndex=int(random(0, enlaces.size()));
            ((Spring)enlaces.get(randIndex)).setRestLength(radio*map(noise(wave),0,1,0.85,1.3));
        }
        //aumentamos contadores
        tight+=0.01;
        wave+=0.015;
        sabor+=0.01;
    }

    void draw()
    {
//preparamos los datos para calcular una curva suave que pase por los vertices
        Spline2D sp=new Spline2D();
        sp.setTightness(map(noise(tight),0,1,0.1,0.35));
        for(int i=0; i < n; i++)
        {
            Particle p = (Particle)particulas.get(i);
            sp.add( p.position().x() ,  p.position().y()  );
        }
        Particle p = (Particle)particulas.get(0);
        sp.add( p.position().x() ,  p.position().y()  );

//Dibujamos el cuerpo
        noStroke();
        fill(color((50*noise(sabor))+hue,255,255,alfa));
        beginShape();
        for(Iterator i=sp.computeVertices(32).iterator(); i.hasNext();)
        {
            Vec2D v=(Vec2D)i.next();
            vertex(v.x,v.y);
        }
        endShape(CLOSE);

    }

    //esto es para debugear
    void drawSkeleton()
    {
        //dibujar vertices
        fill(0);
        for(int i=0; i < particulas.size(); i++)
        {
            Particle p = (Particle)particulas.get(i);
            ellipse( p.position().x() ,  p.position().y() ,5,5 );
        }
        stroke(125);
        //dibujar los enlaces
        beginShape( LINES );
        for(int i=0; i < enlaces.size(); i++)
        {
            Spring s= (Spring)enlaces.get(i);

            Particle a = s.getOneEnd();
            Particle b = s.getTheOtherEnd();
            vertex( a.position().x(), a.position().y() );
            vertex( b.position().x(), b.position().y() );
        }
        endShape();

    }

}


