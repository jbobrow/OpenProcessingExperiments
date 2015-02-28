
Rain r1; //código adaptado, retirado de http://processing.org/discourse/beta/num_1275997615.html


int numDrops = 10;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
  size(600,600);
  smooth();
  noStroke();
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
}

void draw(){
 
  fill(0);
  rect(0,0,600,600);
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
  for (int i = 0; i < 600; i = i+8) {
    fill(mouseX+random(255),+random(mouseY),random(mouseX));
bezier(width, 700, i, mouseY, mouseX*2, i, 0, 700);
rotate(mouseY);
}
}

class Rain {
  float r = random(600);
  float y = random(600);
  void fall() {
    y = y + 15;
    fill(255);
    ellipse(r, y, 3, 3);

   if(y>height){
   r = random(mouseX);
   y = random(mouseY);
   }

  }
}
