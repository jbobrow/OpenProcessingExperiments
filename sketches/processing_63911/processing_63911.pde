
float x = 150;
float y = 150;
float kreisbreite = 60;
float geschwindigkeitx = random (5);
float geschwindigkeity = random (5);
float r;
float g;
float b;

 
void setup() {
  
  size(500, 500);
  background(255);
}
void draw() {
  
  smooth();
  
  x = x + geschwindigkeitx;
  y = y + geschwindigkeity;
  
  if ((x > height) || (x < 0)) {
    geschwindigkeitx = geschwindigkeitx * -1;
  }
  
  if ((y > width) || (y < 0)) {
    geschwindigkeity = geschwindigkeity * -1;
  }


  r = random(255);
  g = random(0);
  b = random(0);
  fill(r);
  noStroke();

  ellipse (x,y,kreisbreite,kreisbreite);
  
  
  kreisbreite += 1;
  if(kreisbreite == 110) {
    kreisbreite = 60;
  }
 //void mousePressed (); 
  //saveFrame ("hoi.png");
   
}

void mousePressed() {

  fill(100,200,200);
  ellipse (x,y,kreisbreite,kreisbreite);


}

