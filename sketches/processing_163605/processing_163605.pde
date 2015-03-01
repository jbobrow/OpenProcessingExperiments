
Ball ball1;
Ball[] allBalls = new Ball[0];
double grav;
int theID;

void setup(){
    size(640,480);
    smooth();
    grav = 40;
    theID = 0;
}

class Ball{
    int id;
    float diam;
    PVector velocity;
    PVector location;
    PVector accel;

    Ball(int i, float initX, float initY, float initD, PVector initV){
        location    = new PVector(initX,initY);
        diam        = initD;
        velocity    = initV;
        id          = i;
    }

    void move(){
        accel       = new PVector(0,0);
        //Calculate force from all other balls
        for (int i = 0;i<allBalls.length; i++){
            if (i!=id){
                double distance = PVector.dist(location,allBalls[i].location);
                PVector thisAccel = PVector.sub(allBalls[i].location,location);
                thisAccel.normalize();
                double accelMag = grav/(10+distance);//added 10 here to prevent it from getting too close to dividing by 0.
                thisAccel.mult((float) accelMag);
                accel.add(thisAccel);
            }
        }
        velocity.add(accel);
        //asdf - give it walls
        // if (location.x < 0 || location.x > width){velocity.x = -velocity.x;}
        // if (location.y < 0 || location.y > height){velocity.y = -velocity.y;}
        location.add(velocity);
    }

    void display(){
        fill(255,200);
        ellipse(location.x,location.y,diam,diam);
    }
}

void mouseClicked(){
    Ball newBall = new Ball(theID, mouseX,mouseY,60,new PVector(0,0) );
    allBalls = (Ball[]) append(allBalls, newBall);
    theID+=1;
}

void draw(){
    background(0);
    for (int i = 0; i< allBalls.length; i++){
        allBalls[i].move();
        allBalls[i].display();
    }
    println(frameRate);
}

