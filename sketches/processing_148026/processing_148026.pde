
//Constellations non-intéractives

ArrayList<points> Points;
ArrayList<points> PointsF;
int nbrPoints = 175;
int minDist = 80;



void setup() {
  size(800, 800); 

  Points = new ArrayList<points>();
  for (int i = 0; i < nbrPoints; i++) {
    Points.add( new points() );
  }
  
    PointsF = new ArrayList<points>();
  for (int i = 0; i < nbrPoints; i++) {
    PointsF.add( new points() );
  }
}


void draw() {
  background(0, 0, 0);

//Points du background
for(int i = 0; i < PointsF.size(); i++){
 PointsF.get(i).draw(175);
 PointsF.get(i).bouger(0.2); 
}

//Points créant des constellations
  for (int i = 0; i < Points.size() ; i++) {
    Points.get(i).draw(255);
    Points.get(i).bouger(0.5);

    points p1 = (points) Points.get(i);

    for (int j = 0; j < Points.size(); j++) {
      points p2 = (points) Points.get(j);

//Compare les points
      if (p1 != p2) {
        float distance = dist(p1.posX, p1.posY, p2.posX, p2.posY);
        
//Si la distance entre les points est inférieure à minDist, la constellation se crée
        if (distance <= minDist) {
          
          stroke(random(0, 255), random(0, 255), random(0, 255), 100);
          strokeWeight(0.5);
          line(p1.posX, p1.posY, p2.posX, p2.posY); 
          
          //Glow de la ligne
          stroke(255, 255, 255, 40);
          strokeWeight(1.5);
          line(p1.posX, p1.posY, p2.posX, p2.posY);
        }
      }
    }
  }
}

class points {
  float size = 1;
  float posX = random(50, width - 50);
  float posY = random(50, height - 50);
  float vX = random(-3, 3);
  float vY = random(-3, 3);
  float rotation;
  float horaire = round(random(0, 1));
  float diviseX = random(1000,3000);
  float diviseY = random(2000,3000);


  points() {
  }

  void draw(float opacite) {

    fill(255, 255, 255, opacite);
    noStroke();
    ellipse(posX, posY, size, size);
    fill(255, 255, 255, opacite/25);
    ellipse(posX, posY, size + 3, size + 3);
  }

  void bouger(float vitesse) {
      posX = posX + (vX * vitesse) * cos(millis()%140000 / diviseX );
      posY = posY + (vY * vitesse) * sin(millis()%140000 / diviseY );

  }
}



