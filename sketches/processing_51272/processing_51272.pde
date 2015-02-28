
//A game of FreezeTag.
int NUM_PLAYERS = 1;
float PLAYER_SIZE = 8;
float MAX_SPEED = 4;
float MIN_SPEED = 2;
boolean cornerTeleport = true;
boolean mousePlay = false;

Player it;
ArrayList normals;
ArrayList frozens;

void setup() {
  size(850,200);
  background(255);
  
  it = new Player(color(0));
  it.speed = MAX_SPEED;
  
  frozens = new ArrayList();
  normals = new ArrayList();
  for (int i=0; i<NUM_PLAYERS-1; i++)
    normals.add(new Player());
}

void draw() {
  if (normals.size()<=0)
  {
    noLoop();
    background(255);
    for(int i=0; i<frozens.size(); i++)
      ((Player)(frozens.get(i))).display();
    it.display();
   }
  else
  {
    fill(255,70); //gives the players a tail :)
    noStroke();
    rect(0, 0, width, height);
    
    if(mousePlay){it.chaseMouse();}
    else{it.takeStep(normals, null);}
    it.display();    
    
    for (int i=normals.size()-1; i>=0; i--)
    {
      Player p = (Player) normals.get(i);
      p.takeStep(frozens, it);
      if (p.isTaggedBy(it))
      {
        normals.remove(i);
        p.freeze();
        frozens.add(p);
      }
      p.display();
    }
    for (int i=frozens.size()-1; i>=0; i--)
    {
      Player p = (Player) frozens.get(i);
      if (p.isTagged(normals))
      {
        frozens.remove(i);
        p.unfreeze();
        normals.add(p);
      }
      p.display();
    }
  }
  if(cornerTeleport)
  {
    fill(255,0,0);
    rect(0, 0, PLAYER_SIZE, PLAYER_SIZE);
    rect(0,height-PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE);
    rect(width-PLAYER_SIZE, 0, PLAYER_SIZE, PLAYER_SIZE);
    rect(width-PLAYER_SIZE, height-PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE);
  }
}
void mousePressed(){ 
  Player newPlayer = new Player();
  newPlayer.loc = new PVector(mouseX, mouseY);
  normals.add(newPlayer);
  loop();
}

