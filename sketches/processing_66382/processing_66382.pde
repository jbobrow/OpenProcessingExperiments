
//---------------------- Global Variables

// declare global variables


// declare objects
ArrayList boids;// declare array list object (container)




// ---------------------Setup 
void setup() {
  size(1000,300);
  smooth();
  frameRate(20);
  boids = new ArrayList(); //create an empty array list

}


// ---------------------Draw

void draw() {
  background(0);
   boids.add(new Boid());
  
  
 
 // With an array, we say balls.length, with an ArrayList, we say balls.size()
  // The length of an ArrayList is dynamic
  // Notice how we are looping through the ArrayList backwards
  // This is because we are deleting elements from the list  
 
 //create for loop for array list 
 
for (int i = 0; i < boids.size(); i++) { 
  Boid b= (Boid) boids.get(i); // need to create a new name for boids that you cast out
  b.display();
  b.bounce();
  if (boids.size() > 100) {
    boids.remove(0); 
 }
}

if (keyPressed) {
  if (key =='s' || key == 'S') {
  saveFrame("randomboxspread-###.jpeg"); }
}
 
 

 

} 


//----------------------Additional Variables

