
// ===================OBJECT   
class Circle { 
  PVector pos;
  float r;
//==================== Constructor, initialize the variables  
  Circle(float tempX,float tempY){
    
    // create new vector storing information about position
    pos = new PVector(tempX,tempY);
    r = random(10,height/8); 
  }
//==================== Methods and Functions   

void run(int i){
  CLines(i);
//  checkdistance(Circle.temp);
  display();
}

  void display (){ // displays the 
     ellipseMode(CENTER);
     noStroke();
     fill(140,40);
     ellipse(pos.x, pos.y, r*2, r*2);
 //    stroke(50);
  //   strokeWeight(2);
  //   point(pos.x, pos.y);
  }

//==========draw line function would find all the circles intersecting and draw line to their centers
  
  void CLines (int i){ // in order to make the algorithm run smoother and faster we pass the i value from run(i)
    Circle temp = new Circle (0,0);
    for (int j = i+1; j<CircleCollection.size(); j++){
      temp = (Circle) CircleCollection.get(j);
      if (checkdistance(temp)){
        stroke(20,50);
        strokeWeight(1);
        line(pos.x, pos.y, temp.pos.x, temp.pos.y);
      }
    }
  } 
  
   boolean checkdistance(Circle temp){
     float distance = PVector.dist(pos, temp.pos);
     if (distance < (r + temp.r) && distance > 0){
       return true;
     }else{
       return false;
     }
/*   void checkdistance(Circle.temp){ 
     
   for (int j = i+1 ; j < CircleCollection.size(); j++) {
   Circle temp = new Circle(0,0);//  
   temp = (Circle) CircleCollection.get(j);
      float distance = PVector.dist(pos, temp.pos);
      if (distance < r + temp.r && distance > 0){
        stroke(20,5);
        strokeWeight(1);
        line (pos.x,pos.y, temp.pos.x , temp.pos.y);
      } 
    
      
    }*/
    
     //loop through all circles in the circlecollection arraylist
     
     //find the distance from this circle to the other circle
     
     //if we arent checking this same circle then...
     
     //draw a line between the circles if they are within some set distance
     
     //recursive function call to find the next closest circle from this circle
     //we have just found...
     
     //define a stopping condition to   finish the loop
     
   }
}

