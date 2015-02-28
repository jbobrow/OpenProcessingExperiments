
Circle[] myCircles = new Circle[20];
Circle mainCircle = new Circle(200,200,20);
 
void setup() {
    size(400,400);
    noStroke();
    
    // populate array with random circles
    for(int i=0; i<myCircles.length;i++) {
        myCircles[i] = new Circle(random(0,width), random(0,height), 10); 
    }
}
 
void draw() {
     
    background(0);
     
    // set the main circle to follow the mouse
    mainCircle.x = mouseX;
    mainCircle.y = mouseY;
    
    // and reset its colour to white
    mainCircle.c = color(255);
    
    // now iterate through all the other circles
    for(int i = 0; i < myCircles.length; i++) {
        
        // and put the current one in a temporary local
        // variable
        
        Circle currentCircle = myCircles[i]; 
        
        // if the distance between the centre points of both circles is
        // less than the radius of the two circles added together, then
        // the circles must be overlapping.
     
        if(dist(mainCircle.x, mainCircle.y, currentCircle.x, currentCircle.y) < mainCircle.r + currentCircle.r) {
        
            // so we set both circle colours to be red
            mainCircle.c = color(255,0,0);
            currentCircle.c = color(255,0,0); 
            
        } else {
            // otherwise we set the current circle to be white   
            currentCircle.c = color(255); 
        }
        
        // and render it
        currentCircle.render();
    }
    
    // finally render the main circle
    mainCircle.render();
     
}
 
class Circle {
 
    float x;
    float y;
    // the Circle radius
    float r;
    color c = color(255); 
    
    Circle(float xpos, float ypos, float radius) {
        x = xpos;
        y = ypos;
        r = radius;
     
     
    }
     
    void render() {
        fill(c); 
        ellipse(x,y,r*2, r*2);
    }            
}

