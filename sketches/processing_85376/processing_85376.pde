
abstract class GameObject {
  PVector position;
  PVector dimensions;
  PVector speed;
  PVector acceleration;
  
  World world;
  Sprite sprite;
  
  GameObject(PVector pos) {
    position = pos;
    dimensions = new PVector(0,0);
    speed = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void init(World w){
    world = w;
  }
  
  void kill(){
    world.remove(this);
  }
  
  //BEGIN Collision Detection
  int checkCollisions(){
    int count = 0;
    for(GameObject gameObject : world.gameObjects())
      if (gameObject != this && this.colliding(gameObject)){
        count++;
        this.onCollision(gameObject);
      }
    return count;
  }
  
  boolean colliding(GameObject other){
    //AABB
    return xOverlap(other) && yOverlap(other);
  }
  
  boolean xOverlap(GameObject other){
    return ! ((this.position.x > other.position.x + other.dimensions.x) ||
      (this.position.x + this.dimensions.x < other.position.x));
  }
  
  boolean yOverlap(GameObject other){
    return ! ((this.position.y > other.position.y + other.dimensions.y) ||
	(this.position.y + this.dimensions.y < other.position.y));
  }
  
  PVector center(){
    return new PVector((int)(position.x + .5 * dimensions.x), 
      (int)(position.y + .5 * dimensions.y));
  }
  //END Collision Detection
  
  //Sprite Stuff
  void setSprite(String spritepath, int frames){
    //We will use only CORNER sprites in this game.
    sprite = new Sprite(spritepath, frames, Sprite.CORNER);
    dimensions.x = sprite.width;
    dimensions.y = sprite.height;
  }
  
  void render() {
    //if(position.x + dimensions.x < 0)
      //this.kill();
    //System.out.println(speed);
    
    speed.add(acceleration);
    position.add(speed);
    sprite.render(position);
  }
  
  //BEGIN Sprite Stuff
  
  //BEGIN Abstract Functions
  abstract void onCollision(GameObject other);
  //END Abstract Functions
	
	
}

