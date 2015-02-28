
import traer.physics.*;


ParticleSystem physics;

Particle[] p;
Particle cUni, aUni;
int NUM_PARTICLES = 3000;

float rotationX;
float rotationY;
float velocityX;
float velocityY;
float radius = 150;
float zCam = 0;

float theta = 0;
float x,y,z = 0;
 
void setup()
{
 size(800,600,P3D);
 physics = new ParticleSystem(0.0, 0.05);
 cUni = physics.makeParticle(2, 0,0,0);
 aUni = physics.makeParticle(1, 0,0,0);
 cUni.makeFixed();
 aUni.makeFixed();
 
 p = new Particle[NUM_PARTICLES];  
 rotationX = 0;
 rotationY = 0;
 velocityX = 0;
 velocityY = 0;  
  for(int i = 0; i < NUM_PARTICLES; i++)
   {
     float theta = i/TWO_PI;
     float u = map(i, 0, NUM_PARTICLES, -1, 1); // spyro
     x = radius*cos(theta)*sqrt(1-(u*u));
     y = radius*sin(theta)*sqrt(1-(u*u));
     z = u*radius;
     p[i] = physics.makeParticle(random(1.0, 10.0), x, y, z);  
     physics.makeSpring( cUni, p[i], 0.01, 0.05, 190 );
     physics.makeAttraction( p[i], cUni, 300, 100 );
     
   }
}

void draw()
{
 background(0);
 physics.tick();
 rotationX += velocityX;
 rotationY += velocityY;
 velocityX *= 0.95;
 velocityY *= 0.95;
 
 pushMatrix();
 translate(width/2, height/2, zCam);
 rotateX(radians(-rotationX));
 rotateY(radians(270 - rotationY));
 noFill();
 
 stroke(255, 30);
 beginShape();  
   curveVertex(p[0].position().x(),p[0].position().y(),p[0].position().z());  
   for(int i = 1; i < NUM_PARTICLES-1; i++)
   {
   curveVertex(p[i].position().x(), p[i].position().y(), p[i].position().z());
   }
   curveVertex(p[p.length-1].position().x(),p[p.length-1].position().y(),p[p.length-1].position().z());
 endShape();




 popMatrix();
 

 if(mousePressed){
   velocityX += (mouseY-pmouseY) * 0.05;
   velocityY -= (mouseX-pmouseX) * 0.05;
   
 }
}



void keyPressed()
{
// zCam at 0 z works well only with OPENGL render
//   switch(key) {
//   case 'i':
//   zCam = 400;
//       break;
//   
//   case 'o':
//   zCam = 0;
//       break;
//   
//   case 's':
//   saveFrame();
//       break;
//   }  
}

