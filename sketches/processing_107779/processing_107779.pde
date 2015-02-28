
ArrayList<Mover> movers;
ArrayList<Atractor> atractors;

int MOVERS_NUMBER = 2500;
int atractors_number = 1;
boolean artMode = false;
boolean debug = false;
boolean colored = false;

void setup(){
    size(512, 512);
    movers = new ArrayList();
    atractors = new ArrayList();

    Mover n;
    for (int i = 0; i< MOVERS_NUMBER; i++){
        n = new Mover(new PVector(random(width), random(height)), 100);
        movers.add(n);
    }

    Atractor a;
    for (int i = 0; i< atractors_number; i++){
        a = new Atractor(new PVector(random(100,width - 100), random(100, height - 100)), random(500,1000));
        atractors.add(a);
    }

    background(0);
}

void draw(){

    if(artMode){
        strokeWeight(1);
        stroke(255,20);
    }else{
        strokeWeight(1);
        stroke(255,200);
        fill(0, 50);
        rect(0, 0, width, height);
    }

    
    
    PVector force;
    Atractor a;

    beginShape(POINTS);
    
    for (int i = 0; i<movers.size(); i++){
        Mover m = movers.get(i);

        for (int j = 0; j< atractors.size(); j++){
            a = atractors.get(j);
            force = a.atract(m);
            m.applyForce(force);
        }
        
        if(colored){
            float r = map(m.location.x, 0, width, 100, 255);
            float g = map(m.location.y, 0, height, 100, 255);
            float b = map(m.mass, 0, 200, 100, 255);
            stroke(r,g,b);
        }

        m.update();
        vertex(m.location.x,m.location.y);
    }


    if(debug){
        fill(255);
        text("Atractors: "+atractors_number, 10, height-10);

        fill(255, 0, 0);
        stroke(255,0,0);
        for (int j = 0; j< atractors.size(); j++){
            a = atractors.get(j);
            ellipse(a.location.x, a.location.y, 4, 4);
            text(a.mass,a.location.x, a.location.y );
        }
    }
    endShape();
}

void mousePressed(){
    atractors_number++;
    PVector mouse = new PVector(mouseX, mouseY);
    Atractor a = new Atractor(mouse, random(500,1000));
    atractors.add(a);
}

void keyPressed(){
    switch (key){
        case 'a' :
            artMode = !artMode;
            setup();
            debug = false;
        break;
        case 'd' :
            debug = !debug;
        break;  

        case 's' :
            atractors_number = 1;
            setup();
        break;  

        case 'c' :
            colored = !colored;
        break;  

        default : break;        
    }
}

/*
============================
|   Classes
============================
*/

class Object{
    float mass;
    PVector location;
    float angle = 0;
    float angularVelocity = 0;
    float angularAcceleration = 0;

    Object(PVector _location, float _mass){
        location = _location;
        mass = _mass;
    }
}

class Mover extends Atractor{
    PVector velocity;
    PVector acceleration;
    
    Mover(PVector position, float _mass){
        super(position, _mass);
        velocity = new PVector(random(2),0);
        acceleration = new PVector(0,0);
    }

    void applyForce(PVector force){
        force.div(mass);
        acceleration.add(force);
    }

    void update(){
        velocity.add(acceleration);
        location.add(velocity);

        angularVelocity += angularAcceleration;
        angle += angularVelocity;

        acceleration.mult(0);
    }

    void display(){
        // Style
        fill(0);
        stroke(0);
        strokeWeight(1);

        // Displaying
        pushMatrix();

        translate(location.x, location.y);
        rotate(angle);
        ellipse(0, 0, mass*10, mass*10);

        popMatrix();
    }

    void checkEdges() {
        if (location.x > width) {
          location.x = width;
          velocity.x *= -1;
          this.applyForce(new Friction(10, velocity));
        } else if (location.x < 0) {
          velocity.x *= -1;
          location.x = 0;
          this.applyForce(new Friction(10, velocity));
        }
     
        if (location.y > height) {
            velocity.y *= -1;
            location.y = height;
            this.applyForce(new Friction(10, velocity));
        }

        if(location.y < 0){
            velocity.y *= -1;
            location.y = 0;
            this.applyForce(new Friction(10, velocity));
        }
    }

    boolean isInside(Liquid l) {
      if (location.x>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h)
      {
        return true;
      } else {
        return false;
      }
    }

    void drag(Liquid l){
        float speed = velocity.mag();
        float dragMagnitude = l.c * speed * speed;

        PVector drag = velocity.get();
        drag.mult(-1);
        drag.normalize();

        drag.mult(dragMagnitude);

        applyForce(drag);
    }
}

class Atractor extends Object{
    private static final float G = 0.2; // Gravitation constant

    Atractor(PVector position, float _mass){
        super(position, _mass);
    }

    PVector atract(Object o){
        PVector force = PVector.sub(location, o.location);
        float distance = force.mag();
        distance = constrain(distance,5,25);

        force.normalize();
        float strength = ( G * mass * o.mass) / (distance* distance);
        force.mult(strength);

        return force;
    }

    void display(){
        pushMatrix();
        fill(255,0,0, 200);
        stroke(0);
        strokeWeight(1);
        ellipse(location.x, location.y, mass*0.1, mass*0.1);
        popMatrix();
    }
}


