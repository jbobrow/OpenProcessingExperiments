
float balle_ressort = 0.05;
float gravite = 0.03;
float balle_x = 10, balle_y = 10;
float balle_xref, balle_yref; // coordonnees de la balle sauvegardees quand la souris est pressee
float balle_diametre = 20;
float balle_varx = 0.5;
float balle_vary = 0;

boolean souris_sur_balle = false;  // true si la souris est sur la balle
boolean souris_bouge_balle = false;  // true si la souris est sur la balle et le bouton est pressé

void setup() 

{
  size(200, 200);
  noStroke();
  smooth();
}



void draw() 

{
  background(0);
  balle_collision();
  balle_move();
  balle_display();  
}

void balle_collision() {
  
} 

void balle_move() {
  if (!souris_bouge_balle) {  
    balle_vary = balle_vary+gravite;
    balle_x = balle_x+balle_varx;
    
    balle_y = balle_y+balle_vary;
    
    if (balle_x + balle_diametre/2 > width) {
    
      balle_x = width - balle_diametre/2;
    
      balle_varx = balle_varx*-0.9; 
    
    }

    else if (balle_x - balle_diametre/2 < 0) {
    
      balle_x = balle_diametre/2;
    
      balle_varx = balle_varx*-0.9;
    
    }
    
    if (balle_y + balle_diametre/2 > height) {
    
      balle_y = height - balle_diametre/2;
    
      balle_vary = balle_vary*-0.9; 
    
    } 
    
    else if (balle_y - balle_diametre/2 < 0) {
    
      balle_y = balle_diametre/2;
    
      balle_vary = balle_vary*-0.9;
    
    }
  }
  
  // vérifions si la souris est sur la  balle
  if((mouseX-balle_x)*(mouseX-balle_x)+(mouseY-balle_y)*(mouseY-balle_y) < balle_diametre) {

    souris_sur_balle = true;

  } else {

    souris_sur_balle = false;

  }
}

  

void balle_display() {

  fill(255, 204);

  ellipse(balle_x, balle_y, balle_diametre, balle_diametre);

}

// On s'occupe de la souris
void mousePressed() {
  if(souris_sur_balle) {
    souris_bouge_balle = true;
  }
  balle_x=10;
  balle_y=10;
  balle_varx=0.5;balle_vary=0.5;
}

void mouseReleased()
{
  if (souris_bouge_balle) {
    souris_bouge_balle = false;
  }
}

