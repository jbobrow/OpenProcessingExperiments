
//Hello World! created by Uttam Grandhi during Fall-2013 for the course Introduction to Computation Media (ICM) taught by Prof. Daniel Shiffman at the Interactive Telecommunications Program (ITP), NYU.
//Overwhelmed by an inspiring talk by Carter Emmart

int a = 200;
int b = 100;
float theta = 0;
float x,y,p1,p2,q;

PImage earth;

void setup(){
size(640,360);
background(0);
earth = loadImage("earth.png");
//earth = loadShape("earth.svg");
}

void draw(){
    //Setting Background
    background(0);

    //Writing Title
    fill(255,255,255);
    text("Hello World!", width/2, height/2 + 50);
    textAlign(CENTER);

    //Drawing Sun
    fill(#ffd900);
    ellipse(width/2, height/2, 50, 50); //Sun background
    fill(#ffffff);
    ellipse(width/2-10, height/2-10, 10, 10); //Left eye
    ellipse(width/2+10, height/2-10, 10, 10); //Right eye
    fill(#ab0735);
    arc(width/2, height/2+2, 20, 20, 0, PI); //Mouth

    //Drawing Orbit
    noFill();
    stroke(#3a87ad);
    strokeWeight(2);
    ellipse(width/2, height/2, 400, 200);

    //Importing Earth Image
    noStroke();
    x = width/2 + a*cos(theta) - 15;
    y = height/2 + b*sin(theta) - 15;
    image(earth, x, y, 30, 30); //Earth

    //Rotating Eyes
    p1 = width/2-10+(2.5*cos(theta)); //X Co-ordinate of the left eye
    p2 = width/2+10+(2.5*cos(theta)); //X Co-ordinate of the right eye
    q = (height/2-10)+(2.5*sin(theta)); //Y Co-ordinate of both the eyes
    
    //Drawing Pupils
    fill(#000000);
    ellipse(p1, q, 5, 5); //Left pupil
    ellipse(p2, q, 5, 5); //Right pupil

    theta = theta+0.01;
}

