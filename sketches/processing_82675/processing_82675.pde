
import traer.physics.*;
import java.util.*;

ParticleSystem physics;

List <Caminante> noche;
List <Estrella> estrellas;
PGraphics pg;
DiscretePalete1D nochecol,estrellacol;

void setup()
{
    size(800,800);
    smooth();
    physics = new ParticleSystem( 0.0, 0.0);
    pg = createGraphics(width,height);
    noche=new Vector();
    estrellas= new Vector();
    nochecol=new DiscretePalete1D(60, dataPath("Noche.png"));
    estrellacol=new DiscretePalete1D(60, dataPath("Estrella.png"));
    background(0);
}


void draw()
{
    color sabor;
    //Truco de fade lento para background
    noStroke();
    fill(0,5);
    rect(0,0,width,height);
    physics.tick();
    addCaminante();
    if(keyPressed)addEstrella();
    addEstrella();
    //loop para las estrellas
    pg.beginDraw();
    pg.background(0);
    for (Iterator<Estrella> it = estrellas.iterator(); it.hasNext();)
    {
    Estrella e = it.next();
    e.draw();
     if (e.dead())
        {
            it.remove();
        }
  
    }
    pg.endDraw();    
    //loop para dibujar los caminantes
    for (Iterator<Caminante> it = noche.iterator(); it.hasNext();)
    {
        Caminante c = it.next();
        c.update();
        color col=pg.get((int)c.x(),(int)c.y());
        if( col != color(0) ){;
          sabor=estrellacol.randomC();
        }
        else {
          sabor=nochecol.randomC();
        }
        c.draw( sabor );

        if (c.dead())
        {
            c.kill();
            it.remove();
        }
    }

}


    
void addCaminante()
{
    if(random(1.0) > 0.7 )
    {
      int ncam=(int)random(10,30);
      for(int i=0; i < ncam; i++)
        noche.add(  new Caminante(random(width),random(height),1.0,physics)  );
    }
}

void addEstrella()
{
    if(random(1.0) > 0.9 )
    {
      float x=random(width);
      float y=random(height);
        estrellas.add(  new Estrella(x,y)  );
        
        int ncam=(int)random(40,300);
        for(int i=0; i < ncam; i++)
        noche.add(  new Caminante(x,y,random(1,10),physics)  );
    }
}

final int frames=60;
final float minv=0.01;
final float maxv=1;

class Caminante
{
    Particle p;
    int wid;
    ParticleSystem physics;
    float life=0.0,step,offset;


    Caminante(float x,float y,float mult,ParticleSystem physics)
    {
        offset=random(10);
        step=1.0f/(frames*random(1,5));
        
        this.physics=physics;
        float ang=random(0,TWO_PI);
        float rad=exp(random(log(maxv)))*mult;
        p =physics.makeParticle( 1.0, x,y, 0 );
        p.velocity().set( rad*sin(ang),rad*cos(ang),0.0f );

    }
    
    float x(){
     return p.position().x();
    }
    
    float y(){
     return p.position().y();
    }
    
    void update()
    {
        life+=step;
        float ang=random(0,TWO_PI);
        float rad=random(minv,maxv);
        p.velocity().add( rad*sin(ang),rad*cos(ang) ,0.0f);
        
    }

    boolean dead()
    {
        return (life > 1.0);
    }

    void draw(color base)
    {
        float alpha=255-pow(2,life*4);
        noFill();
        int index;
        strokeWeight(noise(life+offset)*4 +1);
        stroke(base,alpha);
        line(p.position().x(),p.position().y(),p.position().x()+p.velocity().x(),p.position().y()+p.velocity().y());
    }

    void kill()
    {
      physics.removeParticle(p);
    }

}




final float step=1.0/200.0;

class Estrella{
 float t=1.0;
 float rad1,rad2,ang,angstep;
 float x,y;
 float offset=random(10),mult=random(10)+1;
 int n;
 
 Estrella(float x,float y){
 this.x=x;
 this.y=y;
 n=(int)random(5,12);
 rad1=exp(random(2,6));
 rad2=random(rad1*n*0.05);
 ang=random(0,TWO_PI);
 offset=random(10);
 angstep=TWO_PI/(n*2.0);
 }
 
 
 void draw(){
 t-= step;
 pg.pushMatrix();
 pg.translate(x,y);
 pg.rotate(ang);
 pg.noStroke();
 pg.fill(255*t);
 pg.beginShape();
 float r1=rad1*t;
 float r2=rad2*t;
 
 for(int i=0; i < n; i++){
   pg.vertex(r1*cos(i*angstep*2),r1*sin(i*angstep*2));
   pg.vertex(r2*cos((i*angstep*2) +1),r2*sin((i*angstep*2) +1));
   }
 pg.endShape();
 pg.popMatrix();
 } 
 
 boolean dead(){
  return t < 0.0 ;
 }
 
}
/* DiscretePALETE 1D */

class DiscretePalete1D
{
    color c[];
    float t,step;
    int size;
    int now;

    DiscretePalete1D(int frames,String path)
    {
        t=0;
        step=1.0/(float)frames;
        PImage img =loadImage(path);
        size=img.width*img.height;
        now=(int)random(0,size-1);
        c=new color[size];
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.height; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }
    }
    void update()
    {
        t+=step;
        if(t > 1.0f)
        {
            now++;
            t=0.0f;
            if(now==size)now=0;
        }
    }

    color next()
    {
        t+=step;
        if(t > 1.0f)
        {
            now++;
            t=0.0f;
            if(now==size)now=0;
        }
        return c[now];
    }

    color get(int ind)
    {
        ind=(ind+now)%size;
        return c[ind];
    }

    color randomC()
    {
        return c[(int)random(size)];
    }
}


