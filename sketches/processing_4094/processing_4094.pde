
/*
PROYECTO FINAL

Título: materia
Nombre: iNÊSantiago
Fecha:  junio'09
Lugar: Barcelona
Objetivo: hacer los visuals de la musica "matéria", de nikka.
*/

import traer.physics.*;
import java.util.Vector;

int NUM_IMAGENES = 13;

PImage[] imagenes= new PImage[NUM_IMAGENES];
boolean renderToFrames = false; //renderizamos a frames?
Vector tendrils;
ParticleSystem physics;
Particle mouse;
int greyer;
boolean drawing;
boolean nothingDrawn;
PImage imagenAleatoria;

void setup()
{
  size( 720, 576);
  smooth();
  stroke( 0 );
  background(255);  
  cursor( CROSS );	  
  frameRate(30);
  physics = new ParticleSystem( 0.0f, 0.05f );

  mouse = physics.makeParticle();
  mouse.makeFixed();

  tendrils = new Vector();
  drawing = false;
  greyer = 255;
  initImages();
}
void initImages(){
  for (int i=0;i <NUM_IMAGENES; i++){ 
    imagenes[i] = loadImage("e"+i+".png");
  }
  imageMode(CENTER);
}	
void draw()
{



  mouse.position().set( mouseX, mouseY, 0 );

  if ( !drawing )
  {
    physics.tick();
    if ( greyer < 255 )
      greyer *= 1.11111;
    if ( greyer > 255 )
      greyer = 255;
  }
  else
  {
    if ( greyer >= 64 )
      greyer *= 0.9;
  }

  background(255);  

  drawOldGrey();
  if (renderToFrames)
    renderFrames(); // render frames (if we want)
}
void renderFrames(){
  if (renderToFrames==true){

    saveFrame("./render/particles-####.pn");

  }
}	
void drawOldGrey()
{
  stroke( 255 - greyer );
  for ( int i = 0; i < tendrils.size()-1; ++i )
  {
    T3ndril t = (T3ndril)tendrils.get( i );
      drawElastic( t );
  }

  stroke( 0 );
  if ( tendrils.size()-1 >= 0 )
    drawElastic( (T3ndril)tendrils.lastElement() );
}

void drawElastic( T3ndril t )
{
  float lastStretch = 1;
  for ( int i = 0; i < t.particles.size()-1; ++i )
  {
    Vector3D firstPoint = ((Particle)t.particles.get( i )).position();
    Vector3D firstAnchor =  i < 1 ? firstPoint : ((Particle)t.particles.get( i-1 )).position();
    Vector3D secondPoint = i+1 < t.particles.size() ? ((Particle)t.particles.get( i+1 )).position() : firstPoint;
    Vector3D secondAnchor = i+2 < t.particles.size() ? ((Particle)t.particles.get( i+2 )).position() : secondPoint;

    //float springStretch = 2.5f/((Spring)t.springs.get( i )).stretch();
    Spring s = (Spring)t.springs.get( i );
    float springStretch = 2.5*s.restLength()/s.currentLength();

    strokeWeight( (float)((springStretch + lastStretch)/2.0f) );	// smooth out the changes in stroke width with filter
    lastStretch = springStretch;

    curve( firstAnchor.x(), firstAnchor.y(),
    firstPoint.x(), firstPoint.y(),
    secondPoint.x(), secondPoint.y(),
    secondAnchor.x(), secondAnchor.y() );
    if (i%10 == 0 )   image(dameImagen(2),firstAnchor.x(),firstAnchor.y(),30,30);	
    if (i== 0) 	 image(imagenAleatoria,firstAnchor.x(),firstAnchor.y(),30,30);
    if  (i == t.particles.size()-2) {
    //tint(255,0,0,100);

      image(dameImagen(0),firstAnchor.x(),firstAnchor.y(),40,40);
      //ellipse(firstAnchor.x(),firstAnchor.y(),40,40);
     // filter(BLUR, 0.5);
    
    }
  }
}
PImage dameImagen(){
  int imagenAleatoria  = int(random(0,NUM_IMAGENES));
  return imagenes[imagenAleatoria];

}
PImage dameImagen(int num){
  return imagenes[num];

}
void mousePressed()
{
  drawing = true;
  tendrils.add( new T3ndril( physics, new Vector3D( mouseX, mouseY, 0 ),  mouse ) );

}

void mouseDragged()
{
  ((T3ndril)tendrils.lastElement()).addPoint( new Vector3D( mouseX, mouseY, 0 ) );
  imagenAleatoria = dameImagen();
  println("imagenAleatoria:"+imagenAleatoria);	
}

void mouseReleased()
{
  drawing = false;
}

void keyPressed()
{
   if(key == 'r'){
      renderToFrames =! renderToFrames;
    }
  if ( key == ' ' )
  {
   // tendrils.clear();
    physics.clear();
  }
}

class T3ndril
{
  public Vector particles;
  public Vector springs;
  ParticleSystem physics;

  public T3ndril( ParticleSystem p, Vector3D firstPoint, Particle followPoint )
  {
    particles = new Vector();
    springs = new Vector();

    physics = p;

    Particle firstParticle = p.makeParticle( 1.0f, firstPoint.x(), firstPoint.y(), firstPoint.z() );
    particles.add( firstParticle );
    physics.makeSpring( followPoint, firstParticle, 0.9f, 0.1f, 5 );
   //physics.makeSpring( followPoint, firstParticle, 0.1f, 0.001f, 1 );
  }

  public void addPoint( Vector3D p )
  {
    Particle thisParticle = physics.makeParticle( 1.0f, p.x(), p.y(), p.z() );
    springs.add( physics.makeSpring( ((Particle)particles.lastElement()),
    thisParticle, 
    1.0f,
    1.0f,
    ((Particle)particles.lastElement()).position().distanceTo( thisParticle.position() ) ) );
    particles.add( thisParticle );
    
    /*
        0.4f,
    1.0f,
    */
  }
}


