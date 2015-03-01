
class Rain {
float r = random(600);
float y = 0; 


void fall() {

 y = y + 7;
 fill(0,10,200,180);
 ellipse(r, y, 10, 10);

}}

Rain r1;

int numDrops = 10;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
 size(600,600);
 background(255);
 smooth();
 noStroke();
 //Loop through array to create each object
 for (int i = 0; i < drops.length; i++) {

   drops[i] = new Rain(); // Create each object
   r1 = new Rain();
 }
}

void draw(){
  fill(255,80);
 rect(0,0,600,600);
 //Loop through array to use objects.
 for (int i = 0; i < drops.length; i++) {
  
   drops[i].fall();
   
 }

}

