
// object and class testt

float time = 0;
int id = 1;
Sphere sph1;
Sphere sph2;

void setup(){
    size(400, 400, P3D);
    colorMode(RGB);
    background(100, 200, 200);
    sph1 = new Sphere();
    sph2 = new Sphere(100,100,20,100, 40);
}

void draw(){
    drawNoise();
    sph1.draw();
    sph2.draw(time);
    update();
}

void drawNoise(){
    background(100, 200, 200);
    float x = 0;
    for(int i=0; i<width; i++){
        
        stroke(0);
        line(x,20+50*noise(x/100, time),x ,150+20*noise(x/10, time));
        stroke(70);
        line(x,(height/2)+noise(x/10, time)*300, x, height/4);  
        x += 1;
    }

}

void update(){
    time += 0.02;
}

void mousePressed(){
    
}

class Sphere{
     float rot, size;
     float x, y, z;
     Sphere(){
         rot = 45;
         size = 30;
         x = width/2;
         y = height/2;
         z = 0;
     }
     Sphere(float x, float y, float z, float rot, float size){
         this.rot = rot;
         this.size = size;
         this.x = x;
         this.y = y;
         this.z = z;
     }
     void draw(){
         pushMatrix();
         translate(x, y, z);
         rotate(rot+time*2);
         sphere(size);
         popMatrix();
     }
     void draw(float i){
         pushMatrix();
         translate(x+i, y, z);
         rotate(rot);
         sphere(size);
         popMatrix();
     }
}
