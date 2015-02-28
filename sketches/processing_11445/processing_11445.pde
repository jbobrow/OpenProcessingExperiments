
 ArrayList intersections;
 ArrayList roads;
 ArrayList cars;
 boolean roadStarted = false;
 int lastTime = 0;
 
void setup() {
  background(240);
  size(500,500);
  smooth();
  //Eventually this should scan an input file
  intersections = new ArrayList();
  roads = new ArrayList(); 
  cars = new ArrayList();
}

void draw() {
  
  if( millis() - lastTime > 1000){
    //move cars
      for(int i = 0; i < cars.size() ; i++)
  {
    Car car = (Car) cars.get(i);
    car.takeBestRoad();    
  }
    lastTime = millis();
  }
  
  background(240);
  
  //Highlight closest intersection if it exists
  if (intersections.size() > 0) {
  Intersection closest_intersection =  getClosestIntersection();
  float distance = dist(mouseX,mouseY, closest_intersection.xpos, closest_intersection.ypos);
  if( distance < 40 )
   {
     noFill();
     stroke(0);
     ellipse(closest_intersection.xpos, closest_intersection.ypos, 20,20);
   } 
  }
  
  //Draw intersections
  for(int i = 0; i < intersections.size() ; i++)
  {
    Intersection location = (Intersection) intersections.get(i);
      //If mouse is near intersection, highlight the intersection
    fill(255,0,0);
    ellipse( location.xpos, location.ypos, 10, 10);
  }
  
  //Draw roads
  for(int i = 0; i < roads.size() ; i++)
  {
    Road road = (Road) roads.get(i);
    stroke(0);
    line(road.start_intersection.xpos, road.start_intersection.ypos, road.destination_intersection.xpos, road.destination_intersection.ypos);
  }
  
  //Draw cars
    for(int i = 0; i < cars.size() ; i++)
  {
    Car car = (Car) cars.get(i);
    stroke(100,100,255);
    fill(0);
    rect(car.location.xpos-7.5, car.location.ypos-12.5, 15,25);
  }
  
  //Draw user aid
  if (roadStarted)
  {
   Road road = (Road) roads.get(roads.size() - 1);
   Intersection closest_intersection =  getClosestIntersection();
   line(road.start_intersection.xpos,road.start_intersection.ypos,closest_intersection.xpos,closest_intersection.ypos);
  }
}

void mouseClicked() {
  if (mouseButton == LEFT)
  {
     //Highlight closest intersection if it exists
  if (intersections.size() > 0) {
  Intersection closest_intersection =  getClosestIntersection();
  float distance = dist(mouseX,mouseY, closest_intersection.xpos, closest_intersection.ypos);
  if( distance > 25 )
   {
    intersections.add(new Intersection( mouseX, mouseY)); 
   } 
  }
  else
  {intersections.add(new Intersection( mouseX, mouseY));}
    
  }
  else {
     if (intersections.size() > 0) {
  Intersection closest_intersection =  getClosestIntersection();
  float distance = dist(mouseX,mouseY, closest_intersection.xpos, closest_intersection.ypos);
  if( distance < 15 )
   {
     //If a road is already being created, finish it
   if (roadStarted)
   {
   Road road = (Road) roads.get(roads.size() - 1);
   road.destination_intersection = closest_intersection;
   roadStarted = false;
   }
   else//If a road is not yet started, start one at this intersection
    {
     roads.add( new Road(closest_intersection) );
     roadStarted = true;
    }
   } 
  }
    
  }
}

void keyPressed() {
  if ( key == 'c' && intersections.size() >= 2) {
  Intersection first = (Intersection) intersections.get(0);
  Intersection last = (Intersection) intersections.get(intersections.size()-1);
    cars.add( new Car(first,last));
  }
}

Intersection getClosestIntersection() {
  
  //Find closest intersection. If distance is less than 40, highlight it. 
  Intersection closest_intersection = (Intersection) intersections.get(0);
  float distance = 1000;
  for(int i=0; i < intersections.size(); i++) {
  Intersection comparison_intersection = (Intersection) intersections.get(i);
  float comparison_distance =  dist(mouseX, mouseY, comparison_intersection.xpos, comparison_intersection.ypos) ;
  if ( comparison_distance < distance) {
  distance = comparison_distance;
  closest_intersection = comparison_intersection;
  }
  }
  return closest_intersection;
}

class Car {
  
  Intersection location;
  Intersection destination;
  
  Car(Intersection new_location, Intersection new_destination) {
  location = new_location;
  destination = new_destination;
  }
  
  void takeBestRoad() {
  //Calculate vector between location and destination
  PVector target = new PVector(destination.xpos - location.xpos,destination.ypos - location.ypos);
  Intersection next_intersection = location;
  //Find all roads with either endpoint equal to current location
  float distance = target.mag();
  PVector candidate = target;
  for(int i = 0; i < roads.size() ; i++)
  {
    Road road = (Road) roads.get(i);
    if ((road.start_intersection == location && road.destination_intersection.occupied == false) || (road.destination_intersection == location && road.start_intersection.occupied == false))
    {
    Intersection candidate_intersection;  
      if( road.start_intersection == location)
      { 
      candidate = new PVector(destination.xpos - road.destination_intersection.xpos,destination.ypos - road.destination_intersection.ypos); 
      candidate_intersection = road.destination_intersection; 
      }
      else
      { 
      candidate = new PVector(destination.xpos - road.start_intersection.xpos, destination.ypos - road.start_intersection.ypos); 
      candidate_intersection = road.start_intersection; 
      }
       
      if ( candidate.mag() < distance)
      {
       distance = candidate.mag();   
       next_intersection = candidate_intersection;
      }
     }
    }
   location.occupied = false;
   location = next_intersection;
   location.occupied = true;
  }
}

class Road {
  Intersection start_intersection;
  Intersection destination_intersection;
  
  Road(Intersection new_start, Intersection new_destination) {
    start_intersection = new_start;
    destination_intersection = new_destination;
  }
  
    Road(Intersection new_start) {
    start_intersection = new_start;
    destination_intersection = new_start;
  }
}

class Intersection {
  float xpos;
  float ypos;
  boolean occupied;
  
  Intersection(float new_xpos, float new_ypos) {
    xpos = new_xpos;
    ypos = new_ypos;
    occupied = false;
  }
}


