
class Thingy {
 
 //Properties
 float x;
 float y;
 float w;
 float h;
 color c;
 float sizex;
 float distance;
 float speed;
 
 //Constructor
 Thingy (float x, float y, color c) {
   this.x = x;
   this.y = y;
   this.c = c;
 }
 
 // Method or Function
 void drawThingy(float xPos, float yPos) {
  distance = dist(mouseX, mouseY, xPos, yPos);
  sizex = map(distance, width, 0, 10, 50);
  pushMatrix();
  translate(xPos, yPos);
  fill(this.c);
     rotate(angle);
     ellipse( -this.x, -this.y, sizex, sizex );
     ellipse( this.x, -this.y, sizex, sizex );
     ellipse( this.x, this.y, sizex, sizex );
     ellipse( -this.x, this.y, sizex, sizex );
  popMatrix();   
  }
  
  float addspeed(){
      this.speed += radians(sizex); 
      return this.speed;   
  }
 
}

