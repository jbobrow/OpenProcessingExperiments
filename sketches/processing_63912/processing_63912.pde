
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
  background(55,200,100);
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


  r = random(25);
  g = random(5);
  b = random(55);
  fill(r);
  noStroke();
        background(55,255,100);

  ellipse (x,y,kreisbreite,kreisbreite);

  
  kreisbreite += 1;
  if(kreisbreite == random(1500)); {
    kreisbreite = random(1500);

  }
 //void mousePressed (); 
  //saveFrame ("hoi.png");
   
}

void mousePressed() {

  fill(255,20,50);
  ellipse (x,y,kreisbreite,kreisbreite);


}

