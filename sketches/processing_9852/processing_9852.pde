
import traer.physics.*;
ParticleSystem physics;
Particle[] particles;
Particle[]ECM;
Particle[]obstcl; 

//////////////////////////////
float rotX; 
float rotY; 
float scaleFactor = 1; 
///////////////////////////////
int numCells = 80;
int lengt= 10; 

Ball[]cells = new Ball[numCells];
PVector []dis1 = new PVector [numCells]; 
PVector []dis = new PVector [numCells]; 
PVector []dis2 = new PVector [numCells]; 

float []distance=new float[numCells]; 
float []distanc=new float[numCells]; 

float bounds = 50;
float bound_min = 40;
float bound_max = 45;
boolean newNode= false; 

void setup() 
{
  size(800, 800, P3D);
  stroke( 255); 
  //help =  new Help3d();
  physics = new ParticleSystem(0.0,0.0,0.0, 0.05);
  particles = new Particle[numCells];
  ECM = new Particle[numCells];
  obstcl = new Particle[numCells];

  ECM[0]= physics.makeParticle(0.2,  0 , 0, 0); 
  ECM[1]= physics.makeParticle(0.2, -35 , -30, 20); 
  ECM[2]= physics.makeParticle(0.2, -20 , -37,-30); 
  ECM[3]= physics.makeParticle(0.2, -10 , 20,-15); 
  ECM[4]= physics.makeParticle(0.2, 37 , 10,  35); 
  ECM[5]= physics.makeParticle(0.2, 20 , -20, 10); 
  ECM[6]= physics.makeParticle(0.2, 15 , 36,  -5); 
  ECM[7]= physics.makeParticle(0.2, 0 ,-5, -36); 


  for ( int i = 0; i<8; i++)//change this if you want random positions. 
  {
    // ECM[i]= physics.makeParticle(0.2, random(-bound_min,bound_min) , random(-bound_min,bound_min),random(-bound_min,bound_min); 
    ECM[i].makeFixed();

  }

  for (int u = 0; u < numCells; u++) 
  {
    particles[u] = physics.makeParticle(0.2, random(-bounds,bounds), random(-bounds,bounds), random(-bounds,bounds));  
    cells[u] = new Ball(particles[u].position().x(), particles[u].position().y(),particles[u].position().z(), 5, u, cells,lengt);
  }

  for (int u = 0; u < numCells; u++) 
  {

    for (int m = 0; m < numCells; m++) 
    {
      dis[u]=new PVector(particles[u].position().x(), particles[u].position().y(), particles[u].position().z()); 
      dis1[u]= new PVector(particles[m].position().x(), particles[m].position().y(), particles[m].position().z()); 
      distanc[u] = dis1[u].dist(dis[u]);
      if (distanc[u]<15)
      {
        physics.makeSpring(particles[u], particles[m], 8.0, 0.5, 15);
      }
    }

    for ( int i = 0; i<8; i++)//change this if you want random positions. 
    {
      dis2[i]= new PVector(ECM[i].position().x(),ECM[i].position().y(),ECM[i].position().z());
      distance[u] = dis[u].dist(dis2[i]);

      if (distance[u]<15)
      {
        physics.makeSpring(particles[u], ECM[i], 8.0, 0.5, 25);
      }

    }
  }
}


void draw() 
{
  background(0);
  physics.tick(0.1);
  translate(width/2,height/2,500);
  rotateX(rotY); 
  rotateY(rotX);  
  scale(scaleFactor); 

  for (int u = 0; u < numCells; u++) 
  {
    cells[u].display();  
    //cells[u].network();
  }
  DrawMatrix(); 
  drawNetwork();  
}


void DrawMatrix(){
  for (int i = 0;  i<8; i++) 
  {
    for (int u = 0; u < numCells; u++) 
    {
      pushMatrix(); 
      fill(0,0,255); 
      translate (ECM[i].position().x(),ECM[i].position().y(),ECM[i].position().z()); //draw matrix 
      sphereDetail(6); 
      sphere(3);
      popMatrix();  
      cells[u] = new Ball(particles[u].position().x(),particles[u].position().y(),particles[u].position().z(),5, u, cells,lengt);
      physics.makeAttraction(ECM[i],particles[u], 20, 5);
    }
  }
}

void CreateSpring( Particle a, Particle b ) //creates a spring between node and new node  
{ 
  physics.makeSpring( a, b, 8.0, 0.5, 10); 
} 

void addNode() //function that adds a new node everytime spacebar is pressed 
{  
  if ( newNode==true){
    Particle p = physics.makeParticle(); 
    Particle q = physics.getParticle( (int)random( 0, physics.numberOfParticles()-1) ); 
   while ( q == p ) 
      q = physics.getParticle((int)random( 0, physics.numberOfParticles()-1) ); 
    CreateSpring( p, q ); //create spring
    p.position().add( q.position().x() + random( -30, 30 ), q.position().y() + random( -30, 30 ), q.position().z() + random( -30, 30 ) ); 

  }
}

void drawNetwork()
{      
  // draw vertices
  fill( 160 );
  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    Particle v = physics.getParticle( i );
    pushMatrix();
    translate(v.position().x(), v.position().y(),v.position().z()); 
    box(1); 
    popMatrix(); 
  }
  drawLines();
 // drawLines00();
}


void drawLines(){ 
  for ( int i = 0; i < physics.numberOfParticles(); ++i ) 
  { 
    for ( int j = 0; j < physics.numberOfParticles(); ++j ) 
    { 
      Particle d= physics.getParticle(i);  
      Particle e= physics.getParticle(j);  

      PVector dis =new PVector(d.position().x(), d.position().y(),d.position().z()); 
      PVector dis1= new PVector( e.position().x(), e.position().y(), e.position().z());
      float distance = dis.dist(dis1);
      pushStyle(); 
      if((distance>=3)&&(distance<10)){ 
        strokeWeight(.5); 
        stroke(247,220,220); 
        line(d.position().x(), d.position().y(), d.position().z(), e.position().x(), e.position().y(),e.position().z()); 
      } 
      if((distance>=10)&&(distance<15)){ 
        strokeWeight(.5); 
        stroke(232,159,159); 
        line(d.position().x(), d.position().y(), d.position().z(), e.position().x(), e.position().y(),e.position().z()); 
      } 
      if((distance>=15)&&(distance<20)){ 
        strokeWeight(0.5); 
        stroke(255,54,54); 
        line(d.position().x(), d.position().y(), d.position().z(), e.position().x(), e.position().y(),e.position().z()); 

      } 
      popStyle(); 
    } 
  } 
}

//if a spring exists then 
void drawLines00(){
  stroke(255); 
  strokeWeight (.75);  
  for ( int i =0; i < physics.numberOfSprings(); ++i ) 
  { 
    Spring e = physics.getSpring( i ); 
    Particle a = e.getOneEnd(); 
    Particle b = e.getTheOtherEnd(); 

    PVector dis =new PVector(a.position().x(), a.position().y(),a.position().z()); 
    PVector dis1= new PVector( b.position().x(), b.position().y(), b.position().z());
    float distance = dis.dist(dis1);

    pushStyle(); 
    strokeWeight(2); 
    line( a.position().x(), a.position().y(),a.position().z(), b.position().x(), b.position().y(), b.position().z()); 
    popStyle(); 
  }

}

void keyPressed() 
{ 
  if ( key == ' ' )  //when spacebar is pressed, a new node is added 
  { 
    newNode=true; 
    addNode(); 
    return; 
  } 

} 

void mouseDragged() 
{ 
  if(mouseY<height-90){
    if (mouseButton==LEFT){ 

      rotX += (mouseX - pmouseX) * 0.005; 
      rotY -= (mouseY - pmouseY) * 0.005; 
    } 
    if (mouseButton==RIGHT){ 
      if (scaleFactor>0.01){ 
        scaleFactor += 0.01*(mouseX-pmouseX); 
      } 
      else{ 
        scaleFactor += abs(0.01*(mouseX-pmouseX)); 
      } 
    } 
  }
} 


















