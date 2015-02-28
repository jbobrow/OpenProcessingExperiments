
//the Mondrian painting, practice
//Stella Wang, Tainan

void setup() {
 size(800, 784);
 background(240); 
}

void draw() {
 noStroke();
 fill(230, 5, 3);
 rect(0, 0, 367, 315);
 fill(252, 215, 4);
 rect(0, 507, 79, 784);
 noStroke();
 fill(27, 25, 100);
 rect(365, 509, 250, 240);
 
 stroke(0);
 strokeWeight(11);
 line(79, 507, 79, 784);
 line(367, 0, 367, 784);
 line(614, 507, 614, 784);
 line(367, 749, 614, 749);
 
 strokeWeight(15);
 line(0, 317, 800, 317);
 line(0, 508, 800, 508);

}


