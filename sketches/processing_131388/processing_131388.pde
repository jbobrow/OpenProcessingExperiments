
final float GRAV = 0.2;
float[] bg = {random(100, 150), random(100, 150), random(100, 150)};
float time = 0;
ArrayList p;
boolean pause = false;

void setup(){
    size(600, 600, P3D);
    background(bg[0], bg[1], bg[2]);
    p = new ArrayList();
    textSize(24);
    noStroke();
    cursor(HAND);
}

void draw(){
    if(focused && !pause){
        background(bg[0], bg[1], bg[2]);
        lights();        
        for(int i=0; i<p.size(); i++){    
            p.get(i).draw();
        }
        optimize(); 
    }
}

void optimize(){
    if(p.size()>=20){
        p.remove(p.size-1);
    }  
}

void mousePressed(){
   p.add(new Particles());
}

void keyPressed(){
    if(key == CODED && keyCode == UP){
        pause = !pause;
        text("paused", width/2-24, height/2-24);
    }
}

class BoxParticle{
    PVector pos = new PVector();
    PVector vel = new PVector();
    float boxColorR, boxColorG, boxColorB;
    float life;
    float size;
    
    BoxParticle(){
        boxColorR = random(50, 200);
        boxColorG = random(50, 200);
        boxColorB = random(50, 200);
        life = 255;
        pos.x = mouseX;
        pos.y = mouseY;
        pos.z = 0;
        size = random(5,20);
        vel.y = random(-0.1, -6);
        vel.x = random(-3, 2);
        vel.z = random(-1, 12);
    }
    
    void update(){
        if(vel.y < 10){
            vel.y += GRAV/2;
        }
        pos.z += vel.z;
        pos.x += vel.x;
        pos.y += vel.y;
        life -= 1;
    }
    
    void draw(){
        pushMatrix();
        fill(boxColorR, boxColorG, boxColorB, life);
        translate(0 + pos.x, 0 + pos.y, 0 + pos.z);
        rotateY(vel.y/2+pos.y/width);
        rotateX(vel.x/2);
        rotateZ(vel.z/2);
        box(size);
        popMatrix();
    }
}

class Particles{
    BoxParticle[] bp;
    
    Particles(){
        bp = new BoxParticle[10];
        for(int i=0; i<bp.length; i++){
          bp[i] = new BoxParticle();
        }
    }
    
    void draw(){
         for(int i=0; i<bp.length; i++){
          bp[i].update();
          bp[i].draw();
        }
    }
}
