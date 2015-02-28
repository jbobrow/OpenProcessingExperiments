



World world = new World();

void setup() {
  size(640, 480);
  ellipseMode(CORNER);
  noSmooth();
  cursor(CROSS);
  world.render();
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  world.update(mouseX - width / 2, mouseY - height / 2); 
  world.render();
}

void mousePressed() {

}

class World {
  import traer.physics.*;


  Particle mouse, b, c;
  ParticleSystem physics;


  PVector isoMouse = new PVector();
  World() {
    physics = new ParticleSystem();
    
    physics.setIntegrator(ParticleSystem.MODIFIED_EULER);
    
    mouse = physics.makeParticle();
    mouse.makeFixed();
    b = physics.makeParticle( 1.0, 0, 100, 0 );
    c = physics.makeParticle( 1.0, 0, -100, 0 );

    physics.makeAttraction( mouse, b, 1000, 10 );
    physics.makeAttraction( mouse, c, 1000, 10 );
    physics.makeAttraction( b, c, -1000, 5 );

  }

  void update(int mouseX, int mouseY) {
    isoMouse = getRealPosition(new PVector(mouseX, mouseY));
    mouse.position().set( isoMouse.x, isoMouse.y, 0 );
      handleBoundaryCollisions( b );
  handleBoundaryCollisions( c );

    physics.tick();

  }

  PVector getScreenPosition(PVector loc) {

    PVector positionOnScreen = new PVector();

    positionOnScreen.x = (loc.x - loc.y) / 2.0;
    positionOnScreen.y = (loc.x + loc.y) / 4.0;

    return positionOnScreen;
  }

  PVector getRealPosition(PVector onScreenPoint) {
    PVector realPosition = new PVector();

    realPosition.x = onScreenPoint.x + 2.0 * onScreenPoint.y;
    realPosition.y = - onScreenPoint.x + 2.0 * onScreenPoint.y;

    return realPosition;   
  }
  static final int TILE_SIZE = 24;
  void renderTile(float x, float y) {
    line(x - (TILE_SIZE >> 1),y,x, y - (TILE_SIZE >> 2) );
    line(x + (TILE_SIZE >> 1),y,x, y - (TILE_SIZE >> 2) );
    line(x - (TILE_SIZE >> 1),y,x, y + (TILE_SIZE >> 2) );
    line(x + (TILE_SIZE >> 1),y,x, y + (TILE_SIZE >> 2) );
  }

  void render() {

/*    PVector brush;

    for (int i = -(TILE_SIZE * 9); i <= TILE_SIZE * 10; i += TILE_SIZE)
      for (int j = -(TILE_SIZE * 9); j <= TILE_SIZE * 10; j += TILE_SIZE) {

        PVector realTilePosition = new PVector(i, j);
        brush = getScreenPosition(realTilePosition);

        int intensity = int(realTilePosition.dist(isoMouse));

        if (intensity > 200)
          intensity = 200;

        brush.z = intensity;

        stroke(0, 128, 60, 200 - intensity);
        renderTile(brush.x, brush.y + 100 - (brush.z / 2));


        stroke(255, 0, 128, intensity);

        renderTile(brush.x, brush.y - 100 + (brush.z / 2));

      }
*/
    PVector isoMouseTile = getScreenPosition(new PVector(mouse.position().x(), mouse.position().y()));
    PVector isoB = getScreenPosition(new PVector(b.position().x(), b.position().y()));
    PVector isoC = getScreenPosition(new PVector(c.position().x(), c.position().y()));
    stroke(255, 255, 0, 128);
    renderTile(isoMouseTile.x, isoMouseTile.y);
    
    stroke(255, 128, 0, 128);
    renderTile(isoB.x, isoB.y);
        stroke(255, 255, 128, 128);
    renderTile(isoC.x, isoC.y);


  }
  
  void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < -500 || p.position().x() > 500 )
    p.velocity().set( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < -500 || p.position().y() > 500 )
    p.velocity().set( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.position().set( constrain( p.position().x(),-500, 500 ), constrain( p.position().y(),-500, 500 ), 0 ); 
}

  
}









