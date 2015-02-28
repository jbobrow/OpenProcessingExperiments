
///////////////////////////////CLASS//////////////////////////////////////////////
///It customised the Agent behaviour, such as location, color, velocity and size//
/// for the purpose of to call in for array list in the setup ////////////////////
//////////////////////////////////////////////////////////////////////////////////
class Agent {
  //////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// GLOBAL VARIABLE.///////////////////////////////////////
  //////////// Declaring variable which can be access in different class////////////
  //////////////////////////////////////////////////////////////////////////////////
  PVector location;
  PVector velocity;
  float agentSize;
  int pointShape;
  float agentColor = 1;
  int col ;

  ////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// CONSTRUCTOR//////////////////////////////////////////////////////////
  //////////// The parenthesis of the agent tells how to construct individual Agent behaviour.////
  //////////// In this case, the parenthesis of Agent shall include a sequence of Location,///////
  //////////// Size, Color and Speed when the Agent is called in the setup. //////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////
  Agent (PVector LOCATION, float AGENTSIZE, int AGENTCOLOUR, PVector VELOCITY) {
    location = LOCATION;
    agentSize = AGENTSIZE;
    col = AGENTCOLOUR;
    velocity =  VELOCITY;
  }

  /* Run combine the two function (render and updatePos) into one, so it only
   need to be called once in the setup
   */
  void run() {
    render();

    updatePos();
    flock();
  }
  //////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////// RENDER DRAW THE OBJECT PHYSICAL SHAPE /////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////

  void render () {
    fill (2);
    //ellipse with location of PVector named location.x, location.y and sizes)
    polygon(pointShape, location.x, location.y, agentSize);
    pointShape = round(agentSize);
    // IF SHAPE HAS 3 POINT THEN STROKE = RED
    if (agentSize == 3) {
      stroke (255, 50, 100);
      // IF SHAPE HAS 10 POINT THEN STROKE = PURPLE
    }
    if (agentSize == 10) {
      stroke (255, 50, 255);
      noFill();
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  ////////////// POLYGON GIVE THE POLYGON DIFINITION TO CREATE DIFFERENT SHAPE////////////
  ////////////////////////////////////////////////////////////////////////////////////////
  void polygon(int n, float cx, float cy, float r)
  {
    float angle = 360.0 / n;

    beginShape();
    for (int i = 0; i < n; i++)
    {
      vertex(cx + r * cos(radians(angle * i)), 
      cy + r * sin(radians(angle * i)));
    }
    endShape(CLOSE);
  }
  ////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////// UPDATE THE POSITION OF AGENT /////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////

  void updatePos () {
    //This will add some velocity value to the object by increasing or decreasing
    //the location value.
    location.add(velocity);

    // This will make sure the object which hit the wall ( 0 OR most WIDTH AND 0 or
    // most HEIGHT) will be transfered to correspond side of the wall
    if (location.x < 0 ) {
      location.x=width;
    }

    if (location.x>width) {
      location.x = 0;
    }
    if (location.y <0) {
      location.y = height;
    }
    if (location.y> height) {
      location.y = 0;
    }
  }
  /////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////// DEFINE THE DISTANCE BETWEEN THE AGENTS AND HOW IT MOVES/////////
  ////////////////////////////////////////////////////////////////////////////////////////
  void flock() {

    float minDist = 1000000;

    for (int i = 0; i<agentPop.size(); i++) {
      // this creat 'agent a' which is a group consist of Agent and the number is define
      // by agentPop.get(j)
      Agent a = (Agent) agentPop.get(i);
      // agentDist calculate distance between points (in this case distance
      // between Agent created in Agent a
      float agentDist = location.dist(a.location);

      // check - if distance between points are more than 0
      if (agentDist>0) {

        // check - if agentDist less than 1000000
        if  (agentDist<minDist) {
          // then if less than 1000000 make agentDist equal to minDist
          minDist = agentDist;
        }
        // check - if agentDist less than 20
        if (agentDist < align) {

          // then a new assign PVector - addvVec get the a's velocity
          PVector addVec = a.velocity.get();


          addVec.mult(falloff/agentDist);


          velocity.add(addVec);


          velocity.normalize();

          agentSize = agentSize - 0.1;
        }
        if (agentDist <avoid) {

          PVector addVec = a.location.get();
          addVec.sub(location);
          addVec.mult(falloff/agentDist);
          velocity.sub(addVec);
          velocity.normalize();
        }
      }
    }
    ////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////// SET THE LIMIT SIZE OF THE AGENTS ////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////
    agentSize += 0.2;
    if (agentSize <3) {
      agentSize =3 ;
    }
    if (agentSize >10) {
      agentSize = 10;
    }
  }

  /* END OF CLASS AGENT*/
}


