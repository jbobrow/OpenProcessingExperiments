
class Ball{

  Point[] points;
  Constraint[] sticks;

  float airPressure;

  Ball(float x, float y, float rad, int pointCount, float pressure){

    points = new Point[pointCount];
    sticks = new Constraint[pointCount];

    airPressure = pressure;
    
    float theta = TWO_PI/pointCount;
    
    for(int i = 0; i < points.length; i++){
      points[i] = new Point(x+cos(theta*i)*rad, y+sin(theta*i)*rad);
      if(i > 0)
        sticks[i] = new Constraint(points[i], points[i-1]); 
    }

    sticks[0] = new Constraint(points[0], points[points.length-1]);
  } 


  void update(){

    float centroidX = 0;
    float centroidY = 0;

    for(int i = 0; i <  points.length; i++){
      centroidX += points[i].position.x;
      centroidY += points[i].position.y;
    }

    centroidX /= points.length;
    centroidY /= points.length;

    PVector cent = new PVector(centroidX, centroidY);


    for(int i = 0; i < points.length; i++){
      points[i].accelerate(new PVector(0, GRAVITY));
      
      float mDst = dist(mouseX, mouseY, points[i].position.x, points[i].position.y);
      if(mDst < INTERACT_DIST){
        PVector pressureForce = new PVector(mouseX, mouseY);
        pressureForce.sub(new PVector(pmouseX, pmouseY));
        pressureForce.mult(mDst*INTERACTON_FORCE);
        points[i].accelerate(pressureForce);
      }
      
      
      PVector pressureForce = new PVector(points[i].position.x, points[i].position.y, 0);
      pressureForce.sub(cent);
      pressureForce.mult(airPressure);
      
     // println(pressureForce);
      
      points[i].accelerate(pressureForce);

      points[i].simulate(1);
    } 

    for(int i = 0; i < sticks.length*ITERATIONS; i++){
      sticks[i%sticks.length].resolve(); 
    }

    for(int i = 0; i < points.length; i++){
      if(points[i].position.y >= height-5)
        points[i].correct(new PVector(0,points[i].previous.y-points[i].position.y));
        
      if(points[i].position.y <= 5)
        points[i].correct(new PVector(0,points[i].previous.y+points[i].position.y));
    
      if(points[i].position.x >= width-5)
        points[i].correct(new PVector(points[i].previous.x-points[i].position.x,0));
        
      if(points[i].position.x <= 5)
        points[i].correct(new PVector(points[i].previous.x+points[i].position.x,0));

    } 

  } 


  void draw(){

     beginShape();
     
    for(int i = 0; i <= points.length+2; i++){
      //sticks[i].draw();  
     curveVertex(points[i% points.length].position.x, points[i%points.length].position.y);

    }
    
    endShape();

  }



}


