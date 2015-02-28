
class alien {
  PVector position;
  PVector velocity;
  PVector acceleration;

  alien(int xpos, int ypos) {
    position = new PVector( xpos, ypos );
    velocity = new PVector( 0, 0 );
    acceleration = new PVector(0.0, 0.08);
  }
  
  void update() {
    if ((arrowPos-30) >= (position.y)) {
        velocity.add( acceleration );
        position.add( velocity );
    } else {    
        position.y = arrowPos-30;
        velocity.normalize();
    }
  }    
  void display() {
    stroke(1);
    fill(180,160,120);
    triangle(position.x-3, position.y-11, position.x+17, position.y-11, position.x+7, position.y+8);    //alien punta in basso
    fill(160,120,160);
    triangle(position.x-3, position.y+1, position.x+17, position.y+1, position.x+7, position.y-16);     //alien punta in alto
    fill(180,160,120);
    triangle(position.x+4, position.y-6, position.x+10, position.y-6, position.x+7, position.y-2);      //alien parte interno - punta in basso
    stroke(80);
  }
}


