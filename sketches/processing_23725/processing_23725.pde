
// Three Colour Web Mk-I
// By Traditum

// Based on the code from Mitchell Whitelaw's Harmony Web Remake:
// http://openprocessing.org/visuals/?visualID=8168

// Which in turn is based on mr doob's "harmony" procedural drawing app
// http://mrdoob.com/lab/javascript/harmony/#web

// At the moment this version of the app creates random points and lines, and joins them if they are close enough. It currently does it in three different colours (white, yellow and red). 
// In future versions I would like to try to get it to follow the colours of an imported image, by choosing pixels that contrast with each other and placing points on them


ArrayList Points = new ArrayList(); //Creates an arraylist which is like a bucket and holds all kinds of information
float maxdist = 100; // Set the maximum distance that points will join to 100, this can be increased or decrease to create different looking images

void setup(){
  size(900,600); // Set window size to 900pxls x 600pxls
  background(0); // Set background colour to black
  stroke(255,80); // Set initial stroke colour to white with an opacity of 80
  smooth(); // Turn on antialiasing
}

void draw(){ 
  PVector p = new PVector(int(random(width)),int(random(height))); // Create a new point
  Points.add(p); //Put the point in the arraylist or bucket
  
  for(int i=0;i<Points.size();i++){ // For loop, moves through each slot of the array list based on its size
    float rvalue = random(0,3); // Creates a random value between 0 and 3, used for selecting colour.
    if(rvalue<1){ // If rvalue is less than 1
      stroke(255,80); // Set line colour to white with an opacity of 80
    }else if(rvalue>1 && rvalue<2){ // Else if rvalue is >1 & <2 
      stroke(0,255,0,80); // Set line colour to green with an opacity of 80
    }else{ // If niether of these conditions are met...
      stroke(255,0,0,80); // set line coloour to red with an opacity of 80
    }
    PVector p2= (PVector) Points.get(i); // Create a new pVector variable called p2, it is equal to a point i in the arraylist
    float dist = p.dist(p2); // Determines the distance between p and p2
    float joinchance = dist/maxdist; // The chance of joining is equal to this distance devide by the maximum distance, i.e. lines won't always join but the closer they are the more likely it is
    if(joinchance < random(0.5)){ // if joinchance is less than a random value up to 0.5
      line(p.x,p.y,p2.x,p2.y); // Join a line between p and p2's x and y positions
     }
    }
}

void keyPressed(){ // when a key is pressed...
  save("3colourweb.jpg"); // save the current image as 3colourweb.jpg
}


