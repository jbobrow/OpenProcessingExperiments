
class Mover {

    PVector location;
    PVector velocity;
    
    Mover() {
        location = new PVector(random(width), random(height));
        velocity = new PVector(random(-2, 2), random(-2, 2));    
    }
    
    void update() {
        location.add(velocity);
    }
    
    void display() {
        stroke(0);
        fill(175);
        ellipse(location.x, location.y, 16, 16);
    }
    
    void checkEdges() {
        if (location.x > width) {
            location.x = 0;
        } else if (location.x < 0) {
            location.x = width;
        }
        
        if (location.y > height) {
            location.y = 0;
        } else if (location.y < 0) {
            location.y = height;
        }
    }

}

Mover mover;

void setup() {  //setup function called initially, only once
    size(640,360);
    mover = new Mover();  
}

void draw() {  //draw function loops 
    background(255);

    mover.update();
    mover.checkEdges();
    mover.display();  
}
