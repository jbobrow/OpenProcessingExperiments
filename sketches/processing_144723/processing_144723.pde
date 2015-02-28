
//Carter Hanson
//Art 3001 Let It Grow Project
//Galaxies Over Time
//4-15-14
//Based off works from Collin Mitchell, Kevin Ballon, Abel Jnsm, Daniel Shiffman, Jared Counts 



int pCount = 1800;     //particle count
particle[] p;       //set up array

void setup() {
  size(900,800);        //display size
  p = new particle[pCount];    //new array within particle datatype
  for(int i=0; i<pCount; i++)  //for loop initializations
    p[i] = new particle();   //new array within particle datatype
  background(0);             
  fill(0,40);                //background color added for the for loop
}

void draw() {
  rect(0,0,width,height);      //full sketch rectangle that displays the checkbox function 
  for(int i=0; i<pCount; i++)    //for loop initializations
    p[i].checkbox();              //run checkbox function from particle class for the particle array
}

class particle {             //set up particle class
  PVector location = new PVector(random(900)-450+width/2, random(900)-400+height/2); //location vector setup and function that produces the particles at random locations within the confined area
  PVector speed = new PVector(0,0);     //speed vector setup 
  int mode = int(random(3))-1;        //set up "mode" int with a random 1-3 function minus 1
  float mass = random(pow(200,mode*-1+1.05));   //set up a function of mass. takes 200 to the power of the "mode" outcome minus 1 add 1.05 
  void checkbox() {                      //set up "checkbox" function
    float r=0;                        //set up a float for r equals zero
    location.add(speed);                     //combines location vector to the assignment of speed vector
    for(int i=0; i<pCount; i++){        //for loop initializations
      if (p[i] != this && mode != p[i].mode) {   //if both p[i] and "mode" int are true then run p[i] with mode function
        PVector d = PVector.sub(p[i].location, location);  //subracts the two vectors and returns PVector value
        float distance = d.mag();         //declare distance float--check magnitude of "d" function
        if (mode == 1) r = constrain((p[i].mass*mass) / (distance*distance),0,2);  //if "mode" function result is 1 then don't let "r" exceed the result of (p[i].mass*mass) / (distance*distance),0,2) 
        else r = constrain((p[i].mass*mass) / (distance*distance*distance*distance),0,1);  //if "mode" function result is NOT 1 then don't let "r" exceed the result of (p[i].mass*mass) / (distance*distance*distance*distance),0,1)
        d.normalize();   //make it a unit vector--binds vectors together more
        d.mult(r);       //multiply the vector by the "r" scalar (0)
        speed.add(d);      //add "d" function to speed vector
        speed.mult(.998);  //multiply the speed vector by .998 scalar
      }
    }
      stroke(color(0,200,0));   //color of vector points
      point(location.x, location.y);      //draws a point of one pixel at the x,y coordinates of location vector
    }
 }

