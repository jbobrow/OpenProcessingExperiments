



void setup() {

size(800,800);

}


void draw() {
 
for(int i = 10; i<800; i=i+15) { // Sets inicial squares location on the x axis to 10, and then to increase by 15 until reaching 800
 for(int j= 10; j<800; j=j+15) { // Sets inicial squares location on the y axis to 10, and then to increase by 15 until reaching 800
   rectMode(CENTER); //Sets rectangle mode to center
    rect(i,j,10,10); // Uses growing integers i and j as x and y coordinates, as well as sets the size of each square to 10,10
 }
}
}  

