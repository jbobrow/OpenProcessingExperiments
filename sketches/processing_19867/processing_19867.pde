
//2011 Wolfe
ArrayList projectiles;
Projectile bullet, bullet2;
int program=1, programs=3;
int colshifter=0, burst=30;

float angleToMouse;
void setup() {
  size(800, 600, P2D);


  projectiles = new ArrayList();
  projectiles.add (new Projectile(-10, 500, 0, 0));
}





void draw() {
  angleToMouse = degrees(atan2(height/2-mouseY, mouseX-width/2));

  background(0);

  textSize(20);
  text("Particles: "+projectiles.size(), 10, 60);
  text("FPS: "+round(frameRate), 10, 80);
  for (int i=projectiles.size()-1; i>=0; i--) {
    Projectile proj = (Projectile) projectiles.get(i);
    proj.update();
    //        proj.fillalpha=constrain(255-round(proj.t*21), 0, 255);
    proj.draw();
    if (proj.finished)
      projectiles.remove(i);
  }


  switch(program) { 
  case 1:
    render(1);
    break;
  case 2:
    render(2);
    break;
  case 3:
    render(3);
    break;
  case 4:
    render(4);
    break;
  }

  //  println(projectiles.size());
}

void render(int mode) {
  float ratioX, ratioY;

  switch (mode) {


  case 1:

    ratioX = map(mouseX, 0, width, 1, 45);
    ratioY = map(mouseY, 0, width, 120, -50); // invert

    noCursor();
    textSize(25);
    text("Fountain...", 10, 25);
    textSize(12);
    text("Move cursor on X and Y", 10, 100);
    text("coordinates (whole screen)", 10, 112);
    text("to change velocity (height)", 10, 124);
    text("and angle (spreading)", 10, 136);
    text("Mouse (X,Y): "+mouseX+","+mouseY, 10, 148);
    text("Angles: "+(round(90 - ratioX))+" - "+(round(90 + ratioX)), 10, 160);
    text("Spread: "+round((90 + ratioX) - (90 - ratioX)), 10, 172);
    text("Velocities: "+round(ratioY+50)+" - "+round(ratioY+90), 10, 184);
    fill(255, 200);
    stroke(0, 100);
    ellipse(mouseX, mouseY, 10, 10);


    for (int i = 0; i<burst;i++) {

      // velocity 40 rozdiel
      projectiles.add (new Projectile(width/2, height-height/6, random(90 - ratioX, 90 + ratioX), random(50+ratioY, 90+ratioY )));

      Projectile proj = (Projectile) projectiles.get(projectiles.size()-1);
      proj.cortex=false;
      colorMode(HSB, 360, 100, 100);
      proj.fillcol=color(207, random(90, 100), random(55, 90));
    }

    break;

  case 2:
    noCursor();
    textSize(25);
    text("Fountain rotating to mouse", 10, 25);
    fill(255, 200);
    stroke(0, 100);
    ellipse(mouseX, mouseY, 10, 10);
    for (int i = 0; i<burst;i++) {
      projectiles.add (new Projectile(width/2, height/2, random(angleToMouse-7.5, angleToMouse+7.5), random(100, 140)));

      Projectile proj = (Projectile) projectiles.get(projectiles.size()-1);
      proj.cortex=false;
      colorMode(HSB, 360, 100, 100);
      proj.fillcol=color(207, random(90, 100), random(55, 90));
//      proj.fillalpha=(240);
    }

    break;

  case 3:
    noCursor();
    textSize(25);
    text("Colorful fountain", 10, 25);


    for (int i = 0; i<burst;i++) {
      projectiles.add (new Projectile(width/2, height - height/3, random(80.5, 99.5), random(100, 150)));
      //      projectiles.add (new Projectile(mouseX, mouseY, random(80.5, 99.5), random(100, 150)));
      Projectile proj = (Projectile) projectiles.get(projectiles.size()-1);
      proj.cortex=false;
      colorMode(HSB, 360, 100, 100);
      proj.fillcol=color(colshifter, random(90, 100), random(55, 100));
      //      proj.fillcol=color(colshifter, random(50, 100), random(45, 100));
    }
    colshifter++;
    if (colshifter >360)
      colshifter=0;

    break;

    ////
  case 4:
    noCursor();
    for (int i = 0; i<30;i++) {
      projectiles.add (new Projectile(mouseX, mouseY, random(80.5, 99.5), random(100, 150)));
      Projectile proj = (Projectile) projectiles.get(projectiles.size()-1);
      proj.cortex=false;
      colorMode(HSB, 360, 100, 100);
      proj.fillcol=color(colshifter, random(90, 100), random(55, 100));
      //      proj.fillcol=color(colshifter, random(50, 100), random(45, 100));
    }
    colshifter++;
    if (colshifter >360)
      colshifter=0;

    break;
    ////
  case 5:
    println("5");
    break;
    ////
  }
}


void keyPressed() {
  program++;
  if (program>programs)
    program=1;
}

////////////////////////////////////////
///////////////////////////////////////
class Projectile {               /////
  ///////////////////////////////////
  //////////////////////////////////
  // I could do it better, but I got too many ideas at once so I put everything into one class instead of extending one basic
  // for simplicity (for beginners as I am) I didn't use processing pvector class
  // but I did everything manually (and ugly)
  //
  // declare variables
  float startx, starty, vx, vy, x, y, dx, dy, lastx, lasty;
  float angle, velocity, shotangle;
  float t; // delta time
  color strokecol=0, fillcol=255;
  float   strokealpha = 255, fillalpha = 255;

  float size=10; // size of a projectile;
  float gravity = 9.80665; // Earth's free fall acceleration in 9.80665 m/s^2
  boolean finished, nose, cortex = true;
  // finished = out of screen
  ; // enable/disable calculations/drawing when projectile is out of screen

  ///////////////////////////////////////////////////////////////////////////
  Projectile(float startx, float starty, float angle, float velocity) {  ///
    ///////////////////////////////////////////////////////////////////////
    // init

    this.startx   = startx;
    this.starty   = starty;
    this.angle    = radians(angle);
    this.velocity = velocity;

    this.t = 1.0;          // Time (ticks)


    // initial velocity vector
    this.vx = cos(this.angle) * this.velocity; 
    this.vy = -1 * sin(this.angle) * this.velocity + this.gravity; 
    // "-1 *" = flip curve upside down
  }
  /////////////////////
  void update() {  ///
    /////////////////
    // calculations
    if (!finished) {
      if (x<0 || x>width || y>height || ((fillalpha == 0) && (cortex == false))) {
        finished = true;
      }

      this.lastx = x;
      this.lasty = y;
      // horizontal forces: just velocity
      x = cos(this.angle) * this.velocity * this.t; 
      // vertical forces: velocity and gravity
      y = -1 * sin(this.angle) * this.velocity * this.t + this.gravity * sq(this.t); 

      // translate

      //    y *= -1; // flip curve upside down (I suppose y = -y works too)
      //subtract initial vector
      x -= this.vx; 
      y -= this.vy;
      // translate to relationship to starting postition
      x += this.startx;
      y += this.starty;
      this.t += 0.1; // update time
    }
  }

  ////////////////////////////
  void draw() {           ///
    ////////////////////////
    // show on the screen
    if (!finished) {

      dx = x-lastx;
      dy = y-lasty;


      if (cortex) 
        stroke(strokecol, strokealpha);
      else
        noStroke();

      fill(fillcol, fillalpha);
      ellipse(x, y, size, size);

      stroke(0);
      fill(255);

      // show nose ?
      if (dx != 0 && dy != 0 && nose) {
        shotangle = atan2(y-this.lasty, x-this.lastx);
        line(x, y, size*cos(shotangle)+x, size*sin(shotangle)+y);
      }
    }
  }
}


/*void showdir(float startX, float startY, float Angle, float Velocity) {
 Angle *= -1;
 float hdx = 3*Velocity*cos(Angle)+startX;
 float hdy = 3*Velocity*sin(Angle)+startY;
 
 line(startX, startY, hdx, hdy); // smer
 ellipse(startX, startY, 3, 3);
 */

