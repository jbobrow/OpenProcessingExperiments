
// ===================OBJECT   
class Circle { 
  PVector pos;  //position
  float r;    //circle radius
  float stepSizeX;
  float stepSizeY;
  float[] colorRGB = new float[3];    //float array stored colour info
//==================== Constructor, initialize the variables  
  Circle(float tempX,float tempY){
    
    // create new vector storing information about position, moving direction & speed and colour
    r = random(30,height/8); //randomly generate a circle radius
    tempX = constrain(tempX,r,width-r);     // constrain the ciecle position within screen
    tempY = constrain(tempY,r,height-r);    // constrain the ciecle position within screen
    pos = new PVector(tempX,tempY);        // assign x,y
    stepSizeX = pow(-1,round(random(1,2))) * round(random(stepSizeMin,stepSizeMax)); //random number +/- stepSizeMin-Max
    stepSizeY = pow(-1,round(random(1,2))) * round(random(stepSizeMin,stepSizeMax)); //random number +/- stepSizeMin-Max
    for (int i = 0; i < 3; i++) {
      colorRGB[i] = round(random(0,i*60));    //generate color RGB value
    }
  }
//==================== Methods and Functions   

void run(int i){
  update();
  display();
  drawLines(i);
}
  //update the location of circle, moving according to the angle cotrolled by the perlin noise
  void update() {
    float angle = noise(pos.x/noiseScale,pos.y/noiseScale) * noiseStrength;
    pos.x += cos(angle) * stepSizeX;
    pos.y += sin(angle) * stepSizeY;
    // reverse direction while genereate random speed at the same time
    // little buggy here, sometimes circle stuck on the screen boundary
    // improve later
    if (pos.x < r || pos.x > width-r) stepSizeX = -1*stepSizeX/abs(stepSizeX)*round(random(stepSizeMin,stepSizeMax));  
    if (pos.y < r || pos.y > height-r) stepSizeY = -1*stepSizeY/abs(stepSizeY)*round(random(stepSizeMin,stepSizeMax));
    /*if (pos.x < r) stepSizeX = round(random(1,3));
    if (pos.x > width-r) stepSizeX = -round(random(1,3));
    if (pos.y < r) stepSizeY = round(random(1,3));
    if (pos.y > height-r) stepSizeY = -round(random(1,3));*/
  }



  // draw circles
  void display (){ 
     ellipseMode(CENTER);
     noStroke();
     fill(colorRGB[0],colorRGB[1],colorRGB[2],100);
     ellipse(pos.x, pos.y, r*2, r*2);
  }

//==========draw line function would find all the circles intersecting and draw line to their centers

  void drawLines(int i) {  // passing the i value to fuctions for optimizing the algorithm
                           // check the current circle with the ones after it, in order not to check many times
    Circle temp = new Circle(0,0); 
    for (int j = i+1; j < CircleCollection.size(); j++) {
      temp = (Circle) CircleCollection.get(j);
      if (checkDistance(temp)) {
        // line colour defined by the average value of two circle colours
        stroke((colorRGB[0]+temp.colorRGB[0])/2,(colorRGB[1]+temp.colorRGB[1])/2,(colorRGB[2]+temp.colorRGB[2])/2);
        strokeWeight(1);
        line(pos.x,pos.y,temp.pos.x,temp.pos.y);
      }
    } 
  }

  // find the distance from this circle to the other circle    
  boolean checkDistance (Circle temp){
    float distance = PVector.dist(pos, temp.pos);
    if (distance <= (r + temp.r) && distance > 0){    //if distance < sum of two radius and !=0, return true
      return true;
    }else{
      return false;
    }
  }
}

