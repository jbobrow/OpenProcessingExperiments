
float speed = .1;

void setup () {
  size(1000, 400);
  smooth();
  strokeCap(ROUND);
  
}

void draw() {
  
  background(204);
  randomSeed(0);
  speed -= 1;
  for (int i=35; i<5000; i+=40) {
    int grey = int(random(0, 102));
    float scalar = random (0.25, 1);//**
    blob(i + speed, 110, grey, scalar);
    
  }
  
  //for (int b=35; 1<5000-; b +=40){
    
}

void blob (float x, int y, int g, float s) {
  pushMatrix();
  translate (x, y);
  scale(s);
  stroke (g);
  strokeWeight (70);
  //strokeCap(ROUND);
  line(50, 40, 50, 200);// body 
  noStroke();
  fill(255-g);
  ellipse (20, 65, 50, 50);//head
  fill(g);
  ellipse(10, 58, 10, 10);
  quad(0, 0, 4, 12, 0, 20, 30, 60);
  stroke(255-g);
  strokeWeight(3);
   
 //  rotate(1) ;
   line(55, 90, 55, 150);//arm


  line(55, 240, 55, 300);//leg
  line(35, 300, 55, 300);// foot right
  if (keyPressed= true) {
    //line(35,300,55,300);
    int a =35;
    int b=130;
  }


  popMatrix();
}



