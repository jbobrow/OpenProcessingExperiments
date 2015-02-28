
class Hunter{
  //game vals
  float speed=0.2;
  float hitRad=30;  //hit circle

float yPicAdjust=-30;
  
  //loaciton
  float x,y;  //position 
  
  PImage pic;
  boolean flip;
  
  int frozen = 0;
  int freezeTime = 50;
  
  Player player;
  
  //ArrayList<Hunter> hunters;
  
  Hunter(float _x, float _y) {
    this(_x,_y,null);
  }

  Hunter(float _x, float _y, Player _player) {
    this(_x, _y, null, _player, null);
  }

  Hunter(float _x, float _y, PImage _pic, Player _player, ArrayList<Hunter> _hunters) {
    x=_x;
    y=_y;
    pic = _pic;
    setPlayer(_player);
    //setHuntersList(_hunters);
  }
  
  void setPlayer(Player _player) {
    player = _player;
  }
  
  void update() {
    //Update must be the entry-point for Hunter logic.
    //Any calls to update(x,y) will be redirected here
    
    if(player == null) {
      System.err.println("Don't have Player to lock onto!");
      return;
    }
    
    if(freezeCheck() == true) {
      //get the angle to the player
      float a=atan2(player.y-y,player.x-x);
      //move the hunter
      x+=cos(a)*speed;
      y+=sin(a)*speed;
      
    //if flip the image if the player is to the right
    if (player.x>x)  flip=true;
    else            flip=false;
      
      aiTick();
    }
  }
  
  void aiTick() {
    for (int i=hunters.size()-1; i>=0; i--){
      if (dist(player.x,player.y,hunters.get(i).x,hunters.get(i).y)<player.hitRad/2+hunters.get(i).hitRad/2){
        player.hit();    //stop the player
        
        fightSound.rewind();
        fightSound.play();
        for (int k=0; k<3; k++){
            dust.add(new Dust(hunters.get(i).x,hunters.get(i).y, k*(TWO_PI/3), 1, dustPic));
            dust.add(new Dust(player.x,player.y, k*(TWO_PI/3), 1, dustPic));
        }
        hunters.get(i).kill();
        swarmBlast();
        return;
      }
    }
  }
  
  void swarmBlast() {
    for (int i=hunters.size()-1; i>=0; i--) {
      //if, and only if, hunter is within 20 of the player
      if(dist(player.x,player.y,hunters.get(i).x,hunters.get(i).y) < 100) {
        hunters.get(i).hit();
      }
    }
  }
  
  void hit() {
        freeze();
        //if hunter is above player, move further up, if below, move further down, and so on.
        if(y < player.y)
          y -= (30 + random(10));
        else
          y += (30 + random(10));
        //Further left and right, etc
        if(x < player.x)
          x -= (30 + random(10));
        else
          x += (30 + random(10));
  }
  
  void freeze() {
    if(frozen < freezeTime)
      frozen = freezeTime;
  }
  
  void kill() {
    //Iterate through list and remove myself...
    for (int i=hunters.size()-1; i>=0; i--) {
      if(hunters.get(i) == this)
        hunters.remove(i);
    }
    fightSound.rewind();
    fightSound.play();
  }
  
  boolean freezeCheck() {
    if(--frozen < 1) {
      frozen = 0;
      return true;
    } else
      return false;
  }
  
//  void setHuntersList(ArrayList _hunters) {
//    hunters = _hunters;
//  }
  
  void update(float playerX, float playerY){
    // Please do not use this method anymore.
    // use plain update() instead, since I'd like to encapsualte Hunter logic in each hunter object.
    update();
  }
  
  void draw(){
    fill(0,0,0,100);
    noStroke();
    ellipse(x,y,hitRad,hitRad); 
    pushMatrix();
    translate(x,y+yPicAdjust);
    if (flip)  scale(-1,1);
    image(pic,-10,0);
    popMatrix();
  }
  
  
  
  
}

