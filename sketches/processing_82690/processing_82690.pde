
/* @pjs pauseOnBlur="true"; */  

int pednumber = 100;
Pedestrian[] ped = new Pedestrian[pednumber];
Graph g;

void setup(){
    size(500, 500);
    smooth(3);

    g = new Graph(200,40);
    PVector location;
    float age;
    for (int i = 0; i<ped.length-1; i++){
        location = new PVector(random(80, width-80),random(80, height-80));
        age = random(0.01, 0.1);
        ped[i] = new Pedestrian(location.x,location.y,age);
    }
}

void draw(){
    background(230);
    fill(255,100);
    noStroke();
    rect(80, 80, width-(2*80), height-(2*80));
    PVector target = new PVector(float(mouseX),float(mouseY));
    for (int i = 0; i<ped.length-1; i++){   
    ped[i].update();
    ped[i].seek(target);
    ped[i].represent();
    }
    noFill();
    strokeWeight(2);
    ellipse(mouseX, mouseY, 100, 100);
    g.display();
}
/*
// Create a population graph using age data from pedestrian.
*/

class Graph
{
    PVector loc;
    float gLength, maxX; 
    int ageRem, gRes;
    int[] values;

    //Constructor
    Graph(float _gLength, int _gRes){
        gRes = _gRes;
        gLength = _gLength;
        loc = new PVector(20,height-gLength-40);
        maxX = gLength/4;
        
        //Creating an array of values to store graph coordinates.   
        values = new int[gRes+1];
    }

    void display()
    {
        strokeWeight(2);
        line(loc.x, loc.y, loc.x, loc.y+gLength);
        float mean = 0.0;
        //Filling matrix with values.
        for (int i = 0; i<ped.length-1; i++)
        {// Looping through all pedestrians.
            //Remapping maxforce to "values" length domaint and using to increase values.
            ageRem=int(map(ped[i].maxForce,0.01,0.309,0,values.length));
            values[ageRem] += 1;

            
            mean += ped[i].maxForce;

            //Remapping "values" to 0-1 range. 
            //float valuesRem = map(values[ageRem],0,ped.length-1,0,10);
            //values[ageRem] = int(valuesRem*maxX);
            //println(values[ageRem]);
        }

        fill(255,100);
        //noFill();
        strokeWeight(1);
        beginShape();
        vertex(loc.x,loc.y);
        for (int i = 0; i<values.length-1; i++)
        {// This loop creates graph vertex.
            // Scaling values.
            values[i]=values[i]*3;
            //println(values[i]);
            vertex(values[i]+loc.x, loc.y+(i*gLength/gRes)+gRes/gLength);
        }
        vertex(loc.x,loc.y+gLength);
        endShape(CLOSE);

        //Displaying information.
        mean = mean/ped.length;
        fill(0);
        textSize(10);
        text("Mean Age: "+mean, loc.x, loc.y+gLength+20);

        //Reset value[]
        for (int i = 0; i<values.length-1; i++){
            values[i]=0;
        }
    }

}
/*
// Pedestrian class inspired in Daniel Shiffman interpretation over Reynold's theories.
// NHIU.2012, Ángel Linares García.
*/

class Pedestrian 
{
//Vector variables. 
    PVector loc, vel, acc, desiredVel, steer, fleeV;
    Float maxForce, prevMaxForce, maxSpeed, maxSpeedFlee, r, wanderVal, circle, h, margins;

    Pedestrian (float x, float y, float _maxForce)
    {//Constructor.
        acc = new PVector (0,0);
        vel = new PVector (0,0);
        loc = new PVector (x,y);    
        r = 10.0;
        maxForce = _maxForce;
        prevMaxForce = maxForce;
        maxSpeed = 1.0;
        maxSpeedFlee = maxSpeed*2;
        wanderVal = 0.0;
        margins = 80.0;
    }

    void update()
    {//Euler integration method adaptation.
        vel.add(acc);
        vel.limit(maxSpeed);
        loc.add(vel);
        acc.mult(0);
    }

    void applyForce (PVector force)
    {//Applying Newtons second law.
        acc.add(force); 
    }


    void seek(PVector target)
    {//target seek algorithm
        desiredVel = PVector.sub(target,loc);
        // Decreasing desired vector length.
        float d = desiredVel.mag();
        desiredVel.normalize();
        chekwalls();// This functions is repeated and has no sens. Check where to put it.
        //flee();

        if (d<100)
        {//Detects if pedestrian is near its target and slowdown.
            float m = map (d,0,100,0,maxSpeed); // Inside 100 units circle velocity decrease from 100 to 0.
            desiredVel.mult(m);
        }
        // else 
        // {
        //  //chekwalls();
        //  // desiredVel.mult(maxSpeed);   //Otherwise, run at max speed.
        //  // wander();    // Wander function.
        //  flee();
        // }
        
        desiredVel.mult(maxSpeed);
        steer = PVector.sub(desiredVel,vel);
        steer.limit(maxForce);

        if (mousePressed == true){
            steer.mult(-1);
        }
        //Inserted flee function 
         // It's a little bit stupid to keep this function here...perhaps send to Draw.

        //applyForce(fleeV);
        applyForce(steer);       
    }

    void flee()
    {//Runaway if mouse is pressed
        if (mousePressed == true)
        {//Flee behavior
            chekwalls();
            desiredVel.mult(maxSpeed);
            steer = PVector.sub(desiredVel,vel);
            steer.limit(maxForce);

            wanderVal = 0.0;
            wanderVal += random(-2, 2);
            steer.mult(-1);
            fleeV = steer;
            maxSpeed = maxSpeedFlee;
        }
        else 
        {
            chekwalls();
            desiredVel.mult(maxSpeed);
            steer = PVector.sub(desiredVel,vel);
            steer.limit(maxForce);

            maxSpeed = 1.0;
            fleeV = new PVector (0,0);
        }
    }

        void wander()
    {
        //wanderVal algorithm.
        wanderVal += random(-0.1, 0.1);
        circle = desiredVel.mag();
        h = desiredVel.heading2D();
        desiredVel.normalize();
        desiredVel.x = (circle*cos(wanderVal+h));
        desiredVel.y = (circle*sin(wanderVal+h));
    }

    void chekwalls()
    {
        if (loc.x < margins || loc.x > width-margins || loc.y < margins || loc.y > height-margins)
        {
            maxForce = 0.3;
        }else 
        {
            maxForce = prevMaxForce;
        }

        PVector xLimit = new PVector (0,0);
        if (loc.x < margins)
        {
            xLimit = new PVector(maxSpeed,0);
        }
        else if (loc.x > width-margins) 
        {   
            xLimit = new PVector(-maxSpeed,0);
        }
        else
        {       
            desiredVel.mult(maxSpeed);  //Otherwise, run at max speed.
            wander();
        }

        PVector yLimit = new PVector (0,0);
        if (loc.y < margins)
        {
            yLimit = new PVector(0, maxSpeed);
        }
        else if (loc.y > height-margins) 
        {
            yLimit = new PVector(0, -maxSpeed);
        }
        else
        {       
            desiredVel.mult(maxSpeed);  //Otherwise, run at max speed.
            wander();
        }
        PVector chekwallsV = PVector.add(xLimit,yLimit);
        chekwallsV = PVector.add(vel,chekwallsV);
        desiredVel.add(chekwallsV);
        desiredVel.normalize();
    }

    void represent()
    {//Drawing pedestrian form
        stroke(0);
        strokeWeight(2);
        int ageColor = int(map(maxForce, 0.01, 0.1, 25, 255));
        fill(ageColor,ageColor,ageColor);
        ellipse(loc.x, loc.y, r, r);
    }


}
