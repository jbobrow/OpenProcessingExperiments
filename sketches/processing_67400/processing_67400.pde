
// ===================OBJECT   
class Circle { 
  PVector pos;
  float r;
//==================== Constructor, initialize the variables  
  Circle(float tempX,float tempY){
    
    // create new vector storing information about position
    pos = new PVector(tempX,tempY);
    r = random(30,height/8); 
  }
//==================== Methods and Functions   

void run(int i){
  display();
  drawLines(i);
}

  // draw circles
  void display (){ 
     ellipseMode(CENTER);
     noStroke();
     fill(200,150);
     ellipse(pos.x, pos.y, r*2, r*2);
  }

//==========draw line function would find all the circles intersecting and draw line to their centers

  void drawLines(int i) {  // passing the i value to fuctions for optimizing the algorithm
                           // check the current circle with the ones after it, in order not to check many times
    Circle temp = new Circle(0,0); 
    for (int j = i+1; j < CircleCollection.size(); j++) {
      temp = (Circle) CircleCollection.get(j);
      if (checkDistance(temp)) {
        stroke(255);
        strokeWeight(3);
        line(pos.x,pos.y,temp.pos.x,temp.pos.y);      //draw lines if two circle intersecting
      }
    }
  
  }

  //find the distance from this circle to the other circle    
  boolean checkDistance (Circle temp){
    float distance = PVector.dist(pos, temp.pos);
    if (distance <= (r + temp.r) && distance > 0){    //if distance < sum of two radius and !=0, return true
      return true;
    }else{
      return false;
    }
  }

}
   
   
   
   
   
    
     
     
     
 
    
     
     
    //draw a line between the circles if they are within some set distance
     
    //recursive function call to find the next closest circle from this circle
    //we have just found...
     
    //define a stopping condition to   finish the loop

