
int SCREENSIZE = 480;
int FPS = 60;
color BGCOLOR = color(0, 0, 0);

int MINSIZE = 5; //Toute forme plus petite est supprimée
int GROWTHSPEED = -150; //En pixels par secondes
float COVERSIZE = sqrt(pow(SCREENSIZE, 2) / 2); //Rayon assez grand pour qu'un cercle recouvre l'écran
class SquareCircle {
  float radius = COVERSIZE;
  float angle = 0;
  float x = SCREENSIZE/2;
  float y = SCREENSIZE/2;
  color sqColor = color(random(0, 255), random(0, 255), random(0, 255));
  color crColor = color(random(0, 255), random(0, 255), random(0, 255));
}

ArrayList<SquareCircle> circles = new ArrayList<SquareCircle>();

void setup() {
  size(SCREENSIZE, SCREENSIZE);
  noStroke();
  frameRate(FPS);
  
  SquareCircle sq = new SquareCircle();
  circles.add(sq);
}

void update() {    
  
  //Mettre à jour les dimensions
  float last_radius = 0.0;
  boolean first = true;
  for(SquareCircle c : circles) {
    if(first) {
      first = false;
      c.radius += (1.0/FPS) * GROWTHSPEED;
    } else {
      c.radius = last_radius / sqrt(2);
    }
    last_radius = c.radius;
  }
  
  //Enlever les cercles trop petits
  for(int ii = circles.size() - 1; ii >= 0; --ii) {
    SquareCircle c = circles.get(ii);
    
    if(c.radius < MINSIZE) {
      circles.remove(ii);
    }
  }
  
  //Si le dernier (le plus grand) des cercles est plus petit que l'écran,
  //ajouter un cercle plus grand
  SquareCircle biggest_c = circles.get(0);
  if(biggest_c.radius < COVERSIZE) {
    SquareCircle bigger_c = new SquareCircle();
    bigger_c.radius = biggest_c.radius * sqrt(2);
    bigger_c.angle = biggest_c.angle += PI/11;
    circles.add(0, bigger_c);
  }
}

void draw() {
  update();
  
  background(BGCOLOR); 
  translate(SCREENSIZE/2, SCREENSIZE/2);
  for(SquareCircle c : circles) {
    pushMatrix();
    rotate(c.angle);
    
    fill(c.sqColor);
    rect(-c.radius, -c.radius, c.radius*2, c.radius*2);
    fill(c.crColor);
    ellipse(0, 0, c.radius*2, c.radius*2);
    
    popMatrix();
  }
}
