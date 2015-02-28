
Circle myCircle1 = new Circle(200,200,20); 
Circle myCircle2 = new Circle(200,200,30); 

void setup() { 
    size(400,400); 
    noStroke(); 
}

void draw() { 
    
    background(0); 
    
    myCircle1.x = mouseX; 
    myCircle1.y = mouseY; 
    
    // if the distance between the centre points of both circles is
    // less than the radius of the two circles added together, then
    // the circles must be overlapping. 
    
    if(dist(myCircle1.x, myCircle1.y, myCircle2.x, myCircle2.y) < myCircle1.r + myCircle2.r) { 
        fill(255,0,0); 
    } else { 
        fill(255); 
    }
   
    myCircle1.render(); 
    myCircle2.render(); 
    
}

class Circle { 

    float x; 
    float y; 
    // the Circle radius
    float r; 

    Circle(float xpos, float ypos, float radius) { 
        x = xpos; 
        y = ypos; 
        r = radius;
    
    
    }
    
    void render() { 
    
        ellipse(x,y,r*2, r*2); 
    }             
}               
