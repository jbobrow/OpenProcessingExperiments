
/*   This is the solar system!! 

PLEASE MAKE SURE THAT STARFIELD.PDE IS DOWNLOADED AND
PLACED IN SAME FOLDER! STARFEILD SHOULD BE THE 2ND TAB ON THIS PROGRAM.

I couldnt get the planets to be non-coplanar. 
I also did not design the cool stars :( but i figured out how to incorporate 
them!!!! :D

MOUSE PRESSES and MOVEMENT= rotate around. its Tricky Maneuvering
though so watch out!

Let the program run for a few minutes for the best effect of the planets,
because they all start out in a line :/
*/

Starfield starfield;  //see Starfield Tab (i did not design the Starfield
Planet Mercury;
Planet Venus;
Planet Earth;
Planet Mars;
Planet Jupiter;
Planet Saturn;
Planet Uranus;
Planet Neptune;
Planet Pluto;

void setup(){
  size(900, 700,P3D);
 Mercury = new Planet(color(121, 63, 54), 40, 6); //setting up all my Planets
 Venus = new Planet(color(210, 178, 88), 60, 8);
 Earth = new Planet(color(30,94,191), 110, 14);
 Mars = new Planet(color(127, 32, 32), 160, 12);
 Jupiter = new Planet(color(169, 61, 7), 250, 28);
 Saturn = new Planet(color(210,178,88), 300, 18);
 Uranus = new Planet(color(74, 159, 225), 360, 15);
 Neptune = new Planet(color(6,105,181), 420, 14);
 Pluto = new Planet(color(181,216,243), 500,5);
 starfield = new Starfield(100);
 frameRate(60);
 smooth();
}
float rotX, rotY = 0.0;

void draw() {
  background(0);

  starfield.draw();    //puting the stars in first
  rotateX(rotX);
  rotateY(rotY);
  if (mousePressed){
 rotY += (pmouseX - mouseX)* -0.002;
 rotX += (pmouseY - mouseY)* -0.002;
  }
  rotY += 0.001;
  
  pushMatrix();            //Thise is
lights();                  // The SUN!!!
noStroke();
fill(180, 180,0);
translate(width/2, height/2);
sphere(25);
popMatrix();
Mercury.orbit();          //some nifty litte functions
Mercury.display();
Venus.orbit();
Venus.display();
Earth.orbit();
Earth.display();
Mars.orbit();
Mars.display();
Jupiter.orbit();
Jupiter.display();
Saturn.orbit();
Saturn.display();
Uranus.orbit();
Uranus.display();
Neptune.orbit();
Neptune.display();
Pluto.orbit();
Pluto.display();
}

class Planet{
  color c;
  float xpos;
  float ypos;
  float csize;
  float oradius;
  float vr;
  float theta;
  
  Planet(color tempC, float temporadius, float tempsize){     //Gotta tell ya
    c = tempC;                                              // what the planet
    oradius = temporadius;                                  // info means
    vr = sqrt(100*800/sq(oradius));                          
    xpos = (width/2);
    ypos = (height/2)-oradius;              // SUM PHYSICS WOO
    csize = tempsize;
    theta= (csize*PI/3);
  }
  void display(){
    pushMatrix();                    //This is so each planet knows 
    noStroke();                      //where is is supposed to be!
    fill(c);
    translate(xpos,ypos);            //YEAH
    sphere(csize);
    popMatrix();
  }
  void orbit(){
    
    theta = theta + vr/oradius;
    xpos = width/2 - oradius*sin(theta);      //THA REST OF THE PHYSICS
    ypos = height/2 - oradius*cos(theta);
  }
}
public class Starfield {
  private Star stars[];
  private int count;
  
  public Starfield (int count ) {
    this.count = count;
    stars = new Star[count];
    for (int i = 0; i < count; i++){
      stars[i] = new Star(random(width), random(height), random(10));
    }
  }
  public void draw() {
    frameRate(20);
    strokeWeight (2);
    for (int i = 0; i < count; i++){
      stroke( stars[i].z*25);
      point(stars[i].x, stars[i].y);
      stars[i].x -=stars[i].z;
      if (stars[i].x < 0){
        stars[i] = new Star(width, random(height), sqrt(random(50)));
      }
    }
  }
}

class Star {
  float x, y, z;
  Star(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z =z;
  }
}



