
void setup(){
    size(500,500);
    background(255);
}

//this is how we CREATE a variable.
int x = 95;
int y = 50;
int vx = 3; 
int vy = 2;
int g = -2;
void draw(){
    //choose color based on x and y values:
    
    fill(255,255,255,10);
    rect(-1,-1,501,501);
    //draw the ellipse at the x and y variables:
    fill(x/2, 150, y/2);
    ellipse(x, y, 25, 25);
    
    //if the x value is off the right or left sides, we should 
    //makes it's CHANGE (velocity) negative, so that it will "bounce"
    if(x > 500 || x <0){
        vx = -vx;
    }
    
    //same thing for y:
    if(y > 500 || y < 0){
        vy = -vy;
    }
    
    //update the position of our ellipse:
    x = x + vx;
    y = y + vy;
    vy = vy + g;
    
    
    //here's a bonus concept, making the ball move in a random direction when you click:
    if(sqrt(pow(mouseX-x,2)+pow(mouseY-y,2))<12.5){
        vx = random(-5,5);
        vy = random(-5,5);
    }
}
