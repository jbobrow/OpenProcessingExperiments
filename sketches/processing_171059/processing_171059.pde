
int mx = 50;
int my = 50;
int xspeed = 1;
int yspeed = 1;
// Smiley mySmiley;
void setup(){
    size(300,300); // Set the size of the window 
    background(255); // Draw a black background 
    smooth();
//    mySmiley = new Smiley;
 ellipseMode(CENTER); 
 rectMode(CENTER); 
 }
 
void draw(){
background(255);
display();
}

void display() {
    stroke(0); 
    fill(255);
    ellipse(mx+50,my+60,60,60);
    noFill();
    arc(mx+50,my+50,50,50,PI/4,3/4*PI);
    fill(0);
    ellipse(mx+40,my+50,5,5);
    ellipse(mx+60,my+50,5,5);
    if (mouseX < width/2) {
        mx = mx + xspeed;
        my = my + yspeed;
    }
    if ((mx > width-100) || (mx < 0)) {
        xspeed = xspeed*-1;
    }
    if ((my > width-100) || (my < 0)) {
        yspeed = yspeed*-1;
    }
}
