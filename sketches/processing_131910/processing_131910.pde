
float boxColor = random(100, 255);
float[] bg = {random(100, 150), random(100, 150), random(100, 150)};
final float GRAV = 0.2;
//ArrayList particles;

void setup(){
    size(200, 600, P3D);
}

void draw(){
    background(bg[0], bg[1], bg[2]);
//    for (int x = 0; x < particles.length(); x++) {
//      particle p = (particle) particles.get(x);
//      p.update();
//    }
}

//void mousePressed(){
//    particles.add(new particle());
//}

//class particle {
//    float lifeSpan = 255;
//    PVector pos = new PVector();
//    PVector vel = new PVector();
//
//    void particle() {
//        vel.y = random(-2, -5);
//        vel.x = random(-4, 4);
//        vel.z = random(-4, 4);
//        pos.x = mouseX;
//        pos.y = mouseY;
//        pos.z = 0;
//        pushMatrix();
//    }
//  
//    void update() {
//        fill(0, boxColor, 0, lifeSpan);
//        lights();
//        translate(0 + pos.x, 0 + pos.y, 0 + pos.z);
//        rotateY(vel.y / 2 + pos.y / width);
//        rotateX(vel.x / 2);
//        rotateZ(vel.z / 2);
//        box(20);
//       if(vel.y < 10) {
//            vel.y += GRAV;
//        }
//        pos.z += vel.z;
//        pos.x += vel.x;
//        pos.y += vel.y;
//        lifeSpan -= 1;
//        popMatrix();
//    }
//}
