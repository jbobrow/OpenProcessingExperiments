
  Beary scary;
  Beary serious;

color b_red = color (222,0,0,100);
color b_blue = color (0,40,230,60);

int mx, my, px, py;

void setup() {
background(255);
  size(  800,800 );
  
  scary = new Beary("scary", 200, 450, b_red );
  serious = new Beary("serious", 600, 350, b_blue );
  
}

void draw (){
  


smooth();

 if ( mousePressed && ( mouseButton == LEFT)) {
 serious.reposition( mouseX,mouseY); 
 }
  if ( mousePressed && ( mouseButton == RIGHT)) {
   scary.reposition (mouseX,mouseY);
 }
 
 scary.move (); 
 serious.move();
 
 scary.display ();
 serious.display ();
 
 mx = mouseX;
 my = mouseY;
 px = pmouseX;
 py = pmouseY;
}
void mousePressed () {
  scary.select( mouseX, mouseY );    // when a mouse button is pressed, 
  serious.select( mouseX, mouseY );  //   let each check to see if it's selected
}

void mouseReleased() {
  
  float dx = mx-px;
  float dy = my-py;
  
  scary.deselect (dx, dy);
  serious.deselect (dx, dy);;
}

