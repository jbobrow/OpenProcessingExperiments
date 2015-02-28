
import processing.opengl.*;
import javax.media.opengl.*;
import traer.physics.*; 
import controlP5.*; 
//import processing.video.*; 
//MovieMaker mm;  
ControlP5 controlP5;
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
float cUniMass = 6;
float theta = 0;
//float u; 
//float theta, u; 
float vTheta, vU; 
float x,y,z; 
  
void setup() 
{ 
  size(800,600,OPENGL);
  colorMode(HSB, 360, 100, 100, 100);
  //hint( ENABLE_OPENGL_4X_SMOOTH ); 
  //lights();
  physics = new ParticleSystem(0.0, 0.05);
  cUni = physics.makeParticle(cUniMass, 0,0,0);
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
            
      //theta += 0.01;
      float theta = i/TWO_PI; 
      float u = map(i, 0, NUM_PARTICLES, -1, 1); // spyro
      //u += i;
      //theta = i/TWO_PI;  
      //float u = random(-1,1);  // con questo dispongo random le particelle
//      theta = Theta; 
//      u = U; 
//      vTheta = 0; 
//      vU = 0; 
      x = radius*cos(theta)*sqrt(1-(u*u)); 
      y = radius*sin(theta)*sqrt(1-(u*u)); 
      z = u*radius;
      p[i] = physics.makeParticle(random(1.0, 10.0), x, y, z);
      //p[i].makeFixed();      
      physics.makeSpring( cUni, p[i], 0.01, 0.05, 170 );
      physics.makeAttraction( p[i], cUni, 300, 130 );
      //physics.makeAttraction( aUni, p[i], -300, 150 );
      
    } 
    //physics.makeAttraction( p[0], p[2999], 2000, 10 );
    //mm = new MovieMaker(this, width, height, "drawing.mov", 30, MovieMaker.VIDEO, MovieMaker.LOSSLESS);  
  
  //Sliders
  controlP5 = new ControlP5(this);  
  Slider sldr = controlP5.addSlider("frc", 0, 9, cUniMass, width-180, height-14, 100, 5);
  sldr.setLabel("attractor mass");
} 
 
void draw() 
{ 
  background(0, 0, 0); 
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
  
  
  beginShape();  
    curveVertex(p[0].position().x(),p[0].position().y(),p[0].position().z());   
    for(int i = 1; i < NUM_PARTICLES-1; i++) 
    {
    float cl = map(sqrt(sq(p[i].position().x())+sq(p[i].position().y())+sq(p[i].position().z())) , 130, 170, 360, 285);
    stroke(cl, 100, 100, 20);
      //point(p[i].position().x(),p[i].position().y(),p[i].position().z());
    curveVertex(p[i].position().x(), p[i].position().y(), p[i].position().z()); 
    }
    curveVertex(p[p.length-1].position().x(),p[p.length-1].position().y(),p[p.length-1].position().z()); 
  endShape();
//    stroke(0,0,100, 50);
//    for(int i = 0; i < NUM_PARTICLES; i++) 
//    {
//    point(p[i].position().x(),p[i].position().y(),p[i].position().z());
//    }

   //line(p[0].position().x(),p[0].position().y(),p[0].position().z(), p[p.length-1].position().x(),p[p.length-1].position().y(),p[p.length-1].position().z());
//   noStroke();
//   fill(255, 200);
//   translate(aUni.position().x(),aUni.position().y(),aUni.position().z());
//   sphere(radius);




  popMatrix();
  
  //mm.addFrame(); 

  if(mousePressed){
    velocityX += (mouseY-pmouseY) * 0.05;
    velocityY -= (mouseX-pmouseX) * 0.05;
    
  }
} 



void keyPressed()
{
    switch(key) {
    case 'i': 
    zCam = 400;
        break;
    
    case 'o': 
    zCam = 0;
        break;
    
    case 's': 
    saveFrame();
        break;

    case 'f': 
    //mm.finish();
        break;
    }  
}

void frc(float newMass) {
  cUniMass = newMass;
  cUni.setMass(cUniMass);
}


