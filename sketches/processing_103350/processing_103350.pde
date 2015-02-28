
//first k at 3d
float x,y,dim;
void setup()
{
  size( 1500, 750, OPENGL );
  noStroke();
 
}
void draw()
{
  background( 75, 2, 25);

  noFill();
  box(200);
  fill( 0,200,0);
  //ellipse(0,0,100,100);
  translate( width/2, height/2, 0);
  directionalLight( 0, 200, 250, mouseX, -1, 0);
  directionalLight( 255, 105, 180, 1, mouseY, 0);
  directionalLight( 0, 255, 10, 0,0,1);
  spotLight( 100, 100, 75, width/4, height/4, 400, 0, 0, 1, PI/8, 3);
  rotateX( radians(mouseX));
  rotateY( radians( frameCount/2));
  box(100, 50, 75);
  fill( 50, 34, 245);
  box( 75, 75, 300);
  translate( mouseX*0.05, mouseY*.02, mouseY);
  rotateX( radians(45));
  rotateY( radians(45));
  fill( 150, 105, 180, 10);
  box( 75);
  fill(152, 250, 250);
  sphere( 90);
  sphere( 75);
  translate( width/3, height/3, mouseX);
  sphere( 50);
  translate( width/7, height/7, 0);
  box( 46);
  fill( mouseX, mouseY, mouseX);
  rotateX( radians(35));
  rotateY( radians(35));
  sphere( 110);
  translate(width/2, height/2, 0);
  rotateX(45);
  rotateY(120);
  scale(100);
  beginShape();
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 0,  0,  1);

  vertex( 1, -1, -1);
  vertex( 1,  1, -1);
  vertex( 0,  0,  1);

  vertex( 1, 1, -1);
  vertex(-1, 1, -1);
  vertex( 0, 0,  1);

  vertex(-1,  1, -1);
  vertex(-1, -1, -1);
  vertex( 0,  0,  1);
  endShape();
  translate( -200, -250, 0);
  box(300);

 
  //sphere (155);
  
}



