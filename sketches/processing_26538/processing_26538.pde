
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

    PVector cent = centroid();


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

  PVector centroid(){
    float centroidX = 0;
    float centroidY = 0;

    for(int i = 0; i <  points.length; i++){
      centroidX += points[i].position.x;
      centroidY += points[i].position.y;
    }

    centroidX /= points.length;
    centroidY /= points.length;

    return new PVector(centroidX, centroidY); 


  }


  boolean inPolygon(float xIn, float yIn){

    int intersections = 0;

    for(int i = 0; i < points.length; i++){
      if(max(points[i].position.y,  points[(i+1)%points.length].position.y) > yIn && min(points[i].position.y,  points[(i+1)%points.length].position.y) < yIn ){

        float m = (points[i].position.y-points[(i+1)%points.length].position.y)/(points[i].position.x-points[(i+1)%points.length].position.x);
        float c = points[i].position.y-(points[i].position.x*m);

        float xPos = (yIn-c)/m;
        //  ellipse(xPos, yIn, 5, 5);

        if(max(points[i].position.x,  points[(i+1)%points.length].position.x) > xPos && min(points[i].position.x,  points[(i+1)%points.length].position.x) < xPos && xPos < xIn ){
          intersections++;
          fill(255,0,0);

        }

      }
    }

    return intersections > 0 && intersections%2 != 0;  
  }

  void draw(){

   // if(inPolygon(mouseX, mouseY))
     // fill(150);
    //else
      fill(255);

    beginShape();

    for(int i = 0; i <= points.length+2; i++){
      //sticks[i].draw();  
      curveVertex(points[i% points.length].position.x, points[i%points.length].position.y);

    }

    endShape();

  }

  void testBall(Ball other){
    if(other == this)
      println("BANG");
    
   
    
    for(int i = 0; i < points.length; i++)
    {
      int count = 0;
      
      
      if(other.centroid().dist(this.centroid())<90 && SECONDARY_DRAW){
        line(points[i].position.x, points[i].position.y, other.centroid().x, other.centroid().y);
                line(centroid().x, centroid().y, other.centroid().x, other.centroid().y);
        
      }
        
      
      while(other.inPolygon(points[i].position.x, points[i].position.y) && count < 10){
        
        PVector cent = centroid();
        cent.sub(points[i].position);
        cent.div(10);
        points[i].correct(cent);
        count++;
      } 
    }

  } 

}








