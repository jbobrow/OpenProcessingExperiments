
import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PVector;

 class Main extends PApplet {
    ArrayList<Mover> moverss = new ArrayList<Mover>();
    Mover[] movers = new Mover[1000];
    // Liquid liquid;
    float yrotval, xrotval, zrotval;
    float fov = (float) (Math.PI / 3.0);
    float zval = (float) 0.04;
    float r, g, b;
    float cameraZ = (float) ((height / 2.0) / Math.tan(fov / 2.0));

    void setup() {
        size(1500, 1000, P3D);
        if (frame != null) {
            frame.setResizable(true);
        }
        for (int i = 0; i < 1000; i++) {
            moverss.add(new Mover(this, random(10) + 0.1, random(10000) + width
                    / 2 - 5000, random(10000) + height / 2 - 5000,
                    random(10000) + 1500 / 2 - 5000, i));
            // movers[i] = new Mover(this, random(10)+0.1, random(10)+width/2-5,
            // random(10)+height/2-5, random(10)+1500/2-5, i);
        }
        r = random(255);
        g = random(255);
        b = random(255);
    }

     void mouseDragged() {
        if (mouseButton == LEFT) {
            xrotval = (float) (xrotval + (pmouseY - mouseY) * 0.002);
            yrotval = (float) (yrotval - (pmouseX - mouseX) * 0.002);
        }
    }

     void draw() {
        background(0);
        // perspective(fov,(float)(width/height),(float)(cameraZ/10.0),(float)(cameraZ*10.0));
        
        translate(width / 2, height / 2, 1500 / 2);
        // System.out.println(-width/2);
        rotateY(yrotval);
        rotateX(xrotval);
        rotateZ(zrotval);
        scale(zval);
        translate(-width / 2, -height / 2, -1500 / 2);
        translate(width / 2, height / 2, 1500 / 2);
        noFill();
        stroke(0, 0, 50);
        sphere(10);
        translate(-width / 2, -height / 2, -1500 / 2);
        // camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2,
        // 0, 0, 1, 0);
        // liquid.display();
        float mouse3DX = 0;
        float mouse3DY = 0; 
        float mouse3DZ = 0;  
        boolean rtest;
        int rid = 0;
        PVector wind = new PVector((float) 0.0001, 0);
        PVector gravity = new PVector(0, (float) 1);
        rtest = true;
        boolean toadd=false;
        System.out.println(moverss.size());
        toadd=false;
        for (int i = 0; i < moverss.size(); i++) {
            for (int j = 0; j < moverss.size(); j++) {
                PVector force = moverss.get(j).attract(moverss.get(i));
                // PVector force = movers[j].attract(movers[i]);
                // movers[i].applyForce(force);

                moverss.get(i).applyForce(force);
//              if (random(1) == 0) {
//                  if (moverss.get(i).location.x <= moverss.get(j).location.x + moverss.get(j).mass && moverss.get(i).location.x >= moverss.get(j).location.x - moverss.get(j).mass) {
//                      if (moverss.get(i).location.y <= moverss.get(j).location.y + moverss.get(j).mass && moverss.get(i).location.y >= moverss.get(j).location.y - moverss.get(j).mass) {
//                          if (moverss.get(i).location.z <= moverss.get(j).location.z + 2*moverss.get(j).mass && moverss.get(i).location.z >= moverss.get(j).location.z - moverss.get(j).mass) {
                            
                if (random(1) == 0) {
                    if (moverss.get(i).location.x == moverss.get(j).location.x) {
                        if (moverss.get(i).location.y == moverss.get(j).location.y) {
                            if (moverss.get(i).location.z == moverss.get(j).location.z) {
                                moverss.get(i).mass += moverss.get(j).mass;
                                rid = j;
                                rtest = false;
                                background(255, 0, 0);
                            }
                        }
                    }
                }
                // if(i == 1){
                // stroke(movers[j].location.x-movers[i].r,movers[j].location.y-movers[i].g,
                // movers[j].location.z-movers[i].b);
                // line(movers[i].location.x,movers[i].location.y,movers[i].location.z,movers[j].location.x,movers[j].location.y,movers[j].location.z);
                //
                // }
                // if(i <= 6){
                // stroke(movers[j].r,movers[j].g,movers[j].b);
                // line(movers[i].location.x,movers[i].location.y,movers[i].location.z,movers[j].location.x,movers[j].location.y,movers[j].location.z);
                //
                // }
                // if(i <= 6){
                // stroke(255);
                // line(movers[i].location.x,movers[i].location.y,movers[i].location.z,movers[j].location.x,movers[j].location.y,movers[j].location.z);
                // }
                // line(movers[i].location.x,movers[i].location.y,movers[j].location.x,movers[j].location.y);
            }
            boolean froze = false;
            if (mousePressed) {
                if(mouseButton == RIGHT){
                stroke(0);
                strokeWeight(1);
                fill(255, 0, 0);
                mouse3DX = modelX(mouseX, mouseY, 0);
                mouse3DY = modelY(mouseX, mouseY, 0); 
                mouse3DZ = modelZ(mouseX, mouseY, 0);  
//              System.out.println(10/zval);
                translate(mouse3DX,mouse3DY,mouse3DZ);
                rect(0,0, 6, 6);
                translate(-mouse3DX,-mouse3DY,-mouse3DZ);
                moverss.get(i).applyMouse(mouse3DX,mouse3DY,mouse3DZ);
//              toadd = true; 
                }
                // System.out.println(zval);

                // rotateY((float)Math.PI/2);
            }
            // if(movers[i].isInside(liquid)){
            // movers[i].drag();
            // }
            // movers[i].applyForce(wind);
            // movers[i].applyForce(gravity);

            if (keyPressed) {
                if (key == 'd') {
                    yrotval += Math.PI / 50000;
                }
                if (key == 'a') {
                    yrotval -= Math.PI / 50000;
                }
                if (key == 'w') {
                    xrotval -= Math.PI / 50000;
                }
                if (key == 's') {
                    xrotval += Math.PI / 50000;
                }

                if (key == 'e') {
                    zrotval += Math.PI / 50000;
                }
                if (key == 'q') {
                    zrotval -= Math.PI / 50000;
                }
                if (key == 'x') {
                    if (zval < Math.abs(0.01)) {
                        zval -= 0.000001;
                    } else
                        zval -= 0.00001;
                }

                if (key == 'z') {
                    if (zval < Math.abs(0.01)) {
                        zval += 0.000001;
                    } else
                        zval += 0.00001;
                }
                if(key == ' '){
                froze = true;
                }
                zval = constrain(zval, 0, 10);
                // System.out.println(yrotval);
            }
            // overs[i].update();
            // movers[i].display(i);
            if(!froze){
            moverss.get(i).update();
            }
            moverss.get(i).display(i, xrotval, yrotval, zrotval);
        }
        if (!rtest) {
            moverss.remove(rid);
        }
        if(toadd){
            moverss.add(new Mover(this, random(10) + 0.1,mouse3DX,mouse3DY,mouse3DZ, moverss.size()));
        }
        // m
    }

}



 class Mover{
    PVector location;
    PVector velocity;
    PVector acceleration;
    int size;
    double mass,k, rx, ry,rz;
    PApplet p;
    float xdelta, ydelta,zdelta;
    float height, width, depth,r,g,b;
    float dset = 1500;
    int id;
     Mover(PApplet p, double d, float x, float y,float z, int id){

        velocity = new PVector(0,0,0);
        acceleration = new PVector(0,0,0);
        mass = d;
        this.p = p;
        size = (int)(mass);
        height = p.height;
        width = p.width;
        depth = dset;   
        r = p.random(255);
        g = p.random(255);
        b = p.random(255);
        if(id == 1){
            location = new PVector(width/2,height/2,depth/2);
        }else{
        location = new PVector(x,y,z);
        }
        this.id=id;
    }
    
     void update(){
        if(id != 1){
        velocity.add(acceleration);
        location.add(velocity);
        acceleration.mult(0);
        }
        height = p.height;
        width = p.width;
//      checkEdges();
    }
     PVector attract(Mover m){
        PVector force = PVector.sub(location,m.location);
        float distance = force.mag();
        distance = p.constrain(distance,5,25);
        force.normalize();
        float strength = (float) ((0.04*mass*m.mass)/(distance*distance));
        force.mult(strength);
        return force;
    }
    
     void display(int id,float xr, float yr, float zr){
        p.strokeWeight(1);  
//      if(id <= 6){
            if(id == 1){
                p.stroke(150,0,0);
                p.noFill();
                mass=3000;
                location = new PVector(width/2,height/2,depth/2);
                p.translate(location.x,location.y, location.z);
                p.sphere(3);
                p.translate(-location.x,-location.y, -location.z);
            }else{
//
//          p.stroke(150,0,0);
//          p.noFill();
//          mass=500;
//          p.translate(location.x,location.y, location.z);
//          p.sphere(3);
//          p.translate(-location.x,-location.y, -location.z);
//          }
//      }else{
        p.stroke(Math.abs(width/2-location.x)/4,Math.abs(height/2-location.y)/4,Math.abs(depth/2-location.z)/4);
//      p.fill(Math.abs(width/2-location.x)/2,Math.abs(height/2-location.y)/2,Math.abs(depth/2-location.z)/2);
        p.stroke(r,g,b);
//      p.fill(r,g,b);
//      p.stroke((float)(255-10*mass),(float)(255-10*mass),255);
        p.fill((float)(255-10*mass),(float)(255-10*mass),255);
        size = (int)(mass);
//      p.rotateY(yr);
//      p.rotateX(xr);
//      p.rotateZ(zr);
        p.translate(location.x,location.y, location.z);
        p.ellipse(0,0, size, size);
//      p.sphere((float) size);
        p.translate(-location.x,-location.y, -location.z);
//      p.rotateY(-yr);
//      p.rotateX(-xr);
//      p.rotateZ(-zr);
        }
    }
     void applyMouse(float mouseX, float mouseY,float mouseZ){
        ydelta = mouseY-location.y;
        xdelta = mouseX-location.x;
        zdelta = mouseZ-location.z;
        k = 1*Math.sqrt(Math.pow(2, 2)/(Math.pow(xdelta, 2)+Math.pow(ydelta, 2)+Math.pow(zdelta,2)));
        rx = xdelta*k;
        ry = ydelta*k;
        rz = zdelta*k;
        PVector wi = new PVector((float)rx,(float)ry,(float)rz);
        wi.div((float)mass*20);
        acceleration.add(wi);
    }
     void applyForce(PVector force){
        PVector f = force.get();
        f.div((float)mass);
        acceleration.add(f);
    }
     void checkEdges(){
        if(location.x + size >width){
            location.x = width-size;
            velocity.x *= -1;
        }else if (location.x -size < 0){
            location.x = size;
            velocity.x *= -1;
        }
        
        if(location.y + size/2 >= height) {
            velocity.y *= -1;
            location.y = height-size/2;
        }else if(location.y-size/2 < 0){
            velocity.y *= -1;
            location.y = size/2;
        }

        if(location.z + size/2 >= depth) {
            velocity.z *= -1;
            location.z = depth-size/2;
        }else if(location.z-size/2 < 0){
            velocity.z *= -1;
            location.z = size/2;
        }
    }

}
