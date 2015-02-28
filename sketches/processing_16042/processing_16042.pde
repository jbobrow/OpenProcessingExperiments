
/*
Orb 1.1
made by BlueThen on February 27, 2010
edited on the 28th of February.
www.bluethen.com

Uses Super Fast Blur v1.1 by Mario Klingemann <http: incubator.quasimondo.com="">
*/

boolean colored = false; // whether or not the orb is colored. Press 'z' to toggle this.
int bg = 0; // The color of the background. We start out with 100 (white), but it can be changed to 0 (black) by pressing 'x'.
int particleCount = 250; // Particle count.
Particle[] particles = new Particle[particleCount+1]; // Array of particles
PImage img; // Used for blurring.
void setup () { // Setup, everything is set up before the code actually runs.
  size (1000, 1000); // Size of the window.
  //colorMode(RGB, 100); // Color mode. We use HSB for if colored == true. This makes it easier to do a rainbow-like orb.
  for (int x = particleCount; x >= 0; x--) { // Loop through the particle array and create a new Particle
    particles[x] = new Particle();
  }
}
void draw () {
  translate(width/2, height/2); // Move the point of origin to the center of the window.
  background(#000000); // The screen is cleared, and the background is colored bg (white or black).

  /* Particle rendering */
  zBuffer(particles); // Sort the particles in order so that ones in the back are drawn first, and ones in front overlap them.
  for (int i = particleCount; i >= 0; i--) { // Loop through the particles to draw them.
    Particle particle = (Particle) particles[i];
    if (i == 100) { // We blur the screen at the 200th particle, that way, particles in the back are blurred.
       img = g.get();
       img.loadPixels();
       fastBlur(img, 2); // Use Mario Klingemann's fastBlur(), because filter(BLUR, n) is way too slow.
       image(img, -width/2,-height/2);
    }
    particle.update(i); // Run update() function found in the Particle class. This recalculates and draws the particle.
  }
}
class Particle { // The particle class, holds all the data and formulas for each particle.
  PVector location; // XYZ coordinates of the particle.
  float distance; // Distance from (0,0,0)
  float theta;    // Angle sideways
  float phi;      // Angle longways

  Particle () { // Particle constructor. This runs every time a new particle is created
    distance = random(50, (PI* 125)); // The distance is set randomly between 100 and 200
    theta = random(8.52); // The longways angle is randomly set
    phi = random(1.24); // The sideways angle is randomly set

    float DISTANCE_COS_THETA = distance * cos(theta); // Use a variable to hold data for distance * cos(theta), since it's used twice in the algorithm. This is just for sake of speed.
    location = new PVector(DISTANCE_COS_THETA * cos(phi),   // The formula used for calculating the particle's location.
                           distance * sin(theta),           // This simply acts as if the particle is a spot along the sphere, and uses
                           DISTANCE_COS_THETA * sin(phi));  // a formula for converting Spherical Coordinates (rho, phi, theta) to Cartesian Coordinates (x, y, z)
  }
  void update (int number) { // Update the particle. Its number is used as a parameter to tell how far it is from the camera in relation to the other particles.
    phi += (150 - distance) * 0.00017; // Increase the phi (sideways angle) according to its distance from the center. Particles farther out are faster.
    float DISTANCE_COS_THETA = distance * cos(theta);
    location = new PVector(DISTANCE_COS_THETA * cos(phi),
                           distance * sin(theta),
                           DISTANCE_COS_THETA * sin(phi)); // Same as in the Particle constructor

   
      float angle = atan2(location.z, location.x); // Calculate the particle's angle from the center.
      smooth();
      //stroke(50, (200 - number) * 0.2, 50 * (1 + cos(angle)), (100-number)); 
      stroke(72, random(128,238), 255,(255-number)*.5);
      fill(89, 180, random(105165),random(75,150));
     
    
    ellipse (location.x, location.y, (1600- (this.added() + 1000)) * 0.04, (1600- (this.added() + 1000)) * 0.04);
    
    smooth();
      noStroke();
      fill(89, 180, random(105165),random(75,150));
    
     ellipse (location.x/3, location.y/3, (1600- (this.added() + 1000)) * 0.04, (1600- (this.added() + 1000)) * 0.04);
    
    
    
    //ellipse (location.y, location.x, (1600- (this.added() + 1000)) * 0.03, (1600- (this.added() + 1000)) * 0.03);
    // Draw the particle.
                                                                                                                  // It takes into account the distance of the particle from the camera
                                                                                                                  // So particles farther are smaller.
                                                                                                                  // This, along with the spherical calculation and xyz sorting, creates the 3D effect
  }
  float added () {
    return location.y + location.z + location.x; // Calculate their distance from the camera by adding all the coordinate values.
  }
}
// For zBuffering. This sorts the particle array so the particles in front are rendered last, and they can overlap particles in the back.
Particle[] zBuffer (Particle[] particles) {
  Arrays.sort(particles, new ZComparator());
  return particles;
}
//Comparator for sorting objects
class ZComparator implements Comparator {
  int compare(Object o1, Object o2) {
    Float item1 = ((Particle) o1).added();
    Float item2 = ((Particle) o2).added();
    return item1.compareTo(item2);
  }
}


// The rest isn't made by me:

// Super Fast Blur v1.1
// by Mario Klingemann <http: incubator.quasimondo.com="">
//
// Tip: Multiple invovations of this filter with a small
// radius will approximate a gaussian blur quite well.
void fastBlur(PImage img,int radius){

  if (radius<1){
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw;
  int vmin[] = new int[max(w,h)];
  int vmax[] = new int[max(w,h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++){
     dv[i]=(i/div); 
  }
  
  yw=yi=0;
 
  for (y=0;y<h;y++){
    rsum=gsum=bsum=0;
    for(i=-radius;i<=radius;i++){
      p=pix[yi+min(wm,max(i,0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
   }
    for (x=0;x<w;x++){
    
      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if(y==0){
        vmin[x]=min(x+radius+1,wm);
        vmax[x]=max(x-radius,0);
       } 
       p1=pix[yw+vmin[x]];
       p2=pix[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }
  
  for (x=0;x<w;x++){
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if(x==0){
        vmin[y]=min(y+radius+1,hm)*w;
        vmax[y]=max(y-radius,0)*w;
      } 
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }

}


