
/**

 Cloud Bank

 */

color COLOR_SKY = color(0, 4, 16);
color COLOR_PARTICLE = color(128, 120, 104, 8);
int NUM_PARTICLES = 800;
int PARTICLE_RADIUS = 30;
float PARTICLE_RADIUS_W = PARTICLE_RADIUS * 1.6;
int NUM_STARS = 30;

PImage mySprite;
PImage mySky;

Point3D myParticles[];

void setup() {
    size(400, 300, P3D);
    frameRate(30);
    textureMode(NORMALIZED);
    fill(COLOR_PARTICLE);
    noStroke();

    //mySprite = loadImage("http://opencode.media.mit.edu/files/resource/50/oc_cloudlet_40.png");
    mySprite = loadImage("http://opencode.media.mit.edu/files/resource/50/oc_cloudlet_40_fill.gif");
    mySprite.mask(loadImage("http://opencode.media.mit.edu/files/resource/50/oc_cloudlet_40_mask.gif"));

    myParticles = new Point3D[NUM_PARTICLES];
    for (int i = 0; i < myParticles.length; i++) {
        myParticles[i] = new Point3D(random(0, 2 * width) - width, random(0, height / 2) + height / 3, random(0, 3 * height));
    }

    mySky = createImage(int(1.5 * width), int(1.5 * height), RGB);
// for(int i = 0; i < mySky.pixels.length; i++) {
//   mySky.pixels[i] = color(255, 16, 16, i / mySky.height);
// }
    for (int i = 0; i < NUM_STARS; i++) {
int p = int(random(0, mySky.pixels.length));
mySky.pixels[p] = color(255);
if (p + 1 < mySky.pixels.length) {
mySky.pixels[p + 1] = color(255);
}
if (p - 1 > 0) {
mySky.pixels[p - 1] = color(255);
}
if (p + mySky.width < mySky.pixels.length) {
mySky.pixels[p + mySky.width] = color(255);
}
if (p - mySky.width > 0) {
mySky.pixels[p - mySky.width] = color(255);
}
    }
}

void draw() {
    float mx;

    background(COLOR_SKY);
//    image(mySky, 0, 0);
    beginShape();
    texture(mySky);
    vertex(-4 * width, -4 * height, 3 * height, 0, 0);
    vertex(4 * width, -4 * height, 3 * height, 1, 0);
    vertex(4 * width, 4 * height, 3 * height, 1, 1);
    vertex(-4 * width, 4 * height, 3 * height, 0, 1);
    endShape();

    for (int i = 0; i < myParticles.length; i++) {
        beginShape();
        texture(mySprite);
        vertex(myParticles[i].x - PARTICLE_RADIUS_W, myParticles[i].y + PARTICLE_RADIUS, myParticles[i].z, 0, 0);
        vertex(myParticles[i].x + PARTICLE_RADIUS_W, myParticles[i].y + PARTICLE_RADIUS, myParticles[i].z, 1, 0);
        vertex(myParticles[i].x + PARTICLE_RADIUS_W, myParticles[i].y - PARTICLE_RADIUS, myParticles[i].z, 1, 1);
        vertex(myParticles[i].x - PARTICLE_RADIUS_W, myParticles[i].y - PARTICLE_RADIUS, myParticles[i].z, 0, 1);
        endShape();
    }

    beginCamera();
//    camera();
    mx = ((pmouseX + mouseX) / 2.0 / width) - 0.5;
    camera(width / 2.0, height / 2.0, -height / 2.0, mx * width, height / 2.0, 3 * height, 0, 1, 0);
    translate(0, ((pmouseY + mouseY) / 2.0 - height / 2) / 2.0, 0);
    rotateZ(mx / 2);
//    rotateY((1.0 - mx) / 4);
    endCamera();

}


class Point3D {

    float x, y, z;
    float rx, ry, rz;

    Point3D(float ix, float iy, float iz) {
        this(ix, iy, iz, 0, 0, 0);
    }

    Point3D(float ix, float iy, float iz, float irx, float iry, float irz) {
        x = ix;
        y = iy;
        z = iz;
        rx = irx;
        ry = iry;
        rz = irz;
    }

}



