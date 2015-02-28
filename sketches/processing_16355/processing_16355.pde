
// A code to draw 20 lama's who get angry when you click the left mouse button...
// Made by: Dmitri

// The number of lama's
int n = 20;

Lama[] Lamas = new Lama[n];

void setup() {
  size(500, 500);
  smooth();
   //Construct the lama's:
   for (int i=0;i<n;i++){
   Lamas[i] = new Lama
   (int(random(300,800)),int(random(300,800)),  random(0.2,0.5),int(random(1,4)),int(random(1,4)));
  //Lama(int xpos, int ypos, float bounce, int xs, int ys) 
}
}



void draw() {

    background(255);
    // Make lama half-sized
    scale(0.4);
    //Display and move the lama's
  for (int i=0;i<n;i++) {
   Lamas[i].move();
   Lamas[i].display(); 
   Lamas[i].collision();
  }

}



