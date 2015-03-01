

      /** ** * ** ** ** ** * ** ** ** ** ** ** ** ** ** ** ** ** **\
     /**                         Spiderball                       **\
    /**                         Game Mechanics                     **\
   /**               500624614 - Nick Kortleve - IG203              **\
   \** ** ** ** ** ** ** ** ** ** ** * ** ** * ** ** ** ** ** ** ** **/ 
   
Player player1;
public PVector mouseLocation;
/* @pjs preload="level.png"; */
/* @pjs preload="instructions.png"; */

Level level1;
public PImage bg;
public PImage pixelmap;
        
      
      
boolean menu = true;
PFont font;
boolean firstTime = true;
boolean tempAccel;

void setup(){
    size(900,640);
    background(0);
    player1 = new Player();
    mouseLocation = new PVector(0,0);
    pixelmap = loadImage("level.png");
    level1 = new Level();
    font = createFont("Georgia",32);
    textFont(font);
    bg = loadImage("instructions.png");
    noCursor();
    
    tempAccel = false;
}

void update(){
    player1.update();
    level1.update();
}

void draw(){
    background(0);
    
    if(!menu){
        if(firstTime){
            image(bg,0,0);
        } else {
            player1.update();
            level1.update();
            level1.display();
            player1.display();
            
            strokeWeight(4);
            stroke(255);
            line(mouseX - 12, mouseY, mouseX + 12, mouseY);
            line(mouseX, mouseY - 12, mouseX, mouseY + 12);
            strokeWeight(2);
            stroke(0);
            line(mouseX - 12, mouseY, mouseX + 12, mouseY);
            line(mouseX, mouseY - 12, mouseX, mouseY + 12);
            noStroke();
            stroke(255);
        }
        
    } else {
        
        fill(255);
        textSize(48);
        text("Spiderball", width/2- 100, height/2 - 100);
        textSize(32);       
        text("Press spacebar to play", width/2- 140, height/2 + 200);
        
    }
}

void mousePressed(){
    if(mouseButton == LEFT)
        player1.shoot(new PVector(mouseX + level1.xview, mouseY));
    else if(mouseButton == RIGHT)
        player1.removeRope();
}

void keyPressed(){
    if(key == ' '){
        if(!menu && firstTime){
            firstTime = false;
        } else if(menu) {
         menu = !menu;
         level1.completed = false;
         player1.reset();
        } else {
            
        }
    }   
}

void keyReleased(){
    if(key == ' ') tempAccel = false;  
}

void keyDown(){
    if (key == CODED) {
        if (keyCode == LEFT) {
           // player1.velocity.x *= 1.5;
        }
        if(keyCode == RIGHT) {
           // player1.acceleration *= 1.5;
        }
        
    }
}
class Block{
     
    PVector position;
    PVector size;
    PVector collisionCord;
    float a;
    boolean lava, finish;
    
     public Block(int x, int y, int xSize, int ySize, boolean lava_, boolean finish_){
         position = new PVector(x, y);
         size = new PVector(xSize, ySize);
         collisionCord = new PVector(0,0);
         this.lava = lava_;
         this.finish = finish_;
     }
     
     boolean collision(PVector location){

         if(location.x >= position.x -16 && location.x  <= position.x + size.x + 16){
             
             if(location.y >= position.y - 16 && location.y <= position.y + size.y + 16){
                 collisionCord.x = location.x;
                 collisionCord.y = location.y + size.y/2;
                 
                 return true;
             }             
         }
         
         return false;

        
     }
     
     void display(int xviewer){
         if(finish){
             noStroke();
             fill(0,255,0);
             //strokeWeight(1);
             //stroke(0);
             rectMode(CORNER);
             rect(position.x - xviewer,position.y,size.x,size.y);            
         } else if(!lava){
             fill(255,255,255);
             //strokeWeight(1);
             //stroke(0);
             rectMode(CORNER);
             rect(position.x - xviewer,position.y,size.x,size.y);
         } else {
             fill(255,0,0);
             //strokeWeight(1);
             //stroke(0);
             noStroke();
             rectMode(CORNER);
             rect(position.x - xviewer,position.y,size.x,size.y);             
         }
     }
    
}
class Level {

    int xview;
    int tileCount;
    PVector collisionCord;
    ArrayList<Block> levelTiles;     
    ArrayList<Gold> itemList; 
    boolean completed;
    
    public Level(){
        
        collisionCord = new PVector(0,0);
        levelTiles = new ArrayList<Block>();
        itemList = new ArrayList<Gold>();
        createLevel();
        completed = false;
        load();
    }

    void createLevel() {
    
      final int sizeY = 600;
      final int tileSize = 32;

      pixelmap.loadPixels();
      for (int iY = 0; iY < pixelmap.height; iY++) {
        for (int iX = 0; iX < pixelmap.width; iX++) {
          int spawnX = iX * tileSize, spawnY = iY * tileSize;
          if (pixelmap.get(iX, iY) == color(255, 255, 255)) levelTiles.add(new Block(spawnX, spawnY, tileSize, tileSize, false, false));
          if (pixelmap.get(iX, iY) == color(255, 0, 0)) levelTiles.add(new Block(spawnX, spawnY, tileSize, tileSize, true, false));
          if (pixelmap.get(iX, iY) == color(0, 255, 0)) levelTiles.add(new Block(spawnX, spawnY, tileSize, tileSize, false, true));
          if (pixelmap.get(iX, iY) == color(255, 255, 0)) itemList.add(new Gold(spawnX, spawnY, tileSize/2, tileSize/2));
        }
      }
      pixelmap.updatePixels();
    }
    
    void load(){
        tileCount = 0;
        xview = 0;
    }
    
    boolean collision(PVector location){
        boolean returnTrue = false;
        for(Block j : levelTiles){
            if(j.collision(location)) { collisionCord = j.collisionCord; returnTrue =  true; if(j.finish) completed = true; }
        } 
        if(returnTrue) return true;
        return false;
    }

    boolean collisionGold(PVector location){
        boolean returnTrue = false;
        for(Gold j : itemList){
            if(j.collision(location) && !j.caught) { returnTrue =  true; j.caught = true; }
        } 
        if(returnTrue) return true;
        return false;
    }
    
    void update(){
        xview = (int)player1.position.x - width/2;
    }
    
    void display(){
        for(Block j : levelTiles){
            j.display(xview);
        }
        for(Gold j : itemList){
            j.display(xview);
        }
    }
    
    
}
class Player {
    
    PVector position;
    PVector velocity;
    
    
    
    float acceleration;
    float yPrevious;
    float accelerationY;
    boolean InverseVelocityXL;
    boolean InverseVelocityXR;
    int score;

    Rope hook;    
    
    public Player(){
        position = new PVector(500, 100);
        velocity = new PVector(1, 1);
        acceleration = 4.0 / 60.0;
        hook     = new Rope();
        yPrevious = 0;
        InverseVelocityXL = false;
        InverseVelocityXR = false;
        accelerationY = 0;
        score = 0;
    }
    
    void reset(){
        score = 0;
        
        for(Gold j : level1.itemList) j.caught = false;
        
        if(level1.completed){
            menu = true;            
        } else {
           position = new PVector(500, 100);
           velocity = new PVector(0, 1);
           acceleration = 4.0 / 60.0;
           hook.hooked = false;
           hook.ropeActive = false;
           level1.completed = false;
        }
    }
    
    void shoot(PVector position){
        hook.createRope(position);
    }

    void removeRope(){
        hook.removeRope();
    }
    
    void update(){

        if(level1.collisionGold( new PVector(position.x, position.y)))
            score++;

        if(level1.collision( new PVector(position.x, position.y))){
            reset();
        }
        if(hook.hooked){

            hook.update();
            acceleration = 0.02 * sqrt(hook.Length/3 * constrain( (1.0 - cos(hook.angle)), 0.1, 1.0) );
            constrain(acceleration, -4.0,4.0);

            if(position.x > hook.position.x) velocity.x -= acceleration;
            else velocity.x += acceleration;
            yPrevious = position.y;
            
            position.x += velocity.x; 
            
            position.y = sqrt( constrain( (hook.Length * hook.Length) - (hook.distanceMiddle * hook.distanceMiddle), 0.0, hook.Length * hook.Length) ) + (float) hook.position.y;
                       
            velocity.y = (position.y - yPrevious)*1.28;
            
        } else {
            acceleration = 4.0 / 60.0;
            velocity.y = velocity.y + acceleration;
            position.add(velocity);
            hook.update();
        }

        if (position.y > height || position.x > width + level1.xview){
            reset();
        }
        
    }
    
    void display(){
        stroke(255);
        strokeWeight(1);
        hook.display(position.x - level1.xview, position.y);    
        fill(0,0,255);
        //stroke(255);
        ellipse(position.x - level1.xview, position.y, 32, 32);
        rectMode(CORNER);
        
        for(int i = 0; i < score; i++){        
             noStroke();
             fill(255,255,0);
             ellipse(20 + i * 32,20, 16,16);
        }

    }
    
}
class Rope {
    
    PVector position;
    PVector directionRope;
    boolean ropeActive;
    float Length;
    float distanceMiddle;
    float angle;
    boolean hooked;
    
    public Rope(){
        position= new PVector(0,0);
        ropeActive = false;
        Length = 0.0;
        distanceMiddle = 0.0;
        angle = 0.0;
        hooked = false;
        directionRope = new PVector(0,0);
    }
    
    void createRope(PVector mousePos){
        ropeActive = true;
        hooked = false;
        Length = 100.0;
        if(mousePos.y < player1.position.y) {
            ropeActive = true;
            directionRope.set( PVector.sub(mousePos, player1.position) );
            //directionRope.setMag(Length);
             directionRope.normalize();
            directionRope.mult(Length); 
            //println(directionRope.x + "  " + directionRope.y);
        }        
    }
    
    void removeRope(){
        ropeActive = false; 
         hooked = false;       
    }
    
    void update(){
        
        if(hooked){
            
            distanceMiddle = abs(this.position.x - player1.position.x);
            if(Length != 0.0)
                angle = (float) distanceMiddle / (player1.position.y - position.y);
            else angle = 0.0;  
            
        } else if (ropeActive) {
           
            Length += 12.0;
           // directionRope.setMag(Length); 
           directionRope.normalize();
          directionRope.mult(Length); 
            if(level1.collision(new PVector(directionRope.x + player1.position.x, directionRope.y + player1.position.y) ) ){
               this.hooked = true;
            }
            
            if(hooked) {
                if(player1.velocity.x < 0.0 && player1.position.x < this.position.x)
                    player1.velocity.x = 0.0;
                else if(player1.velocity.x > 0.0 && player1.position.x > this.position.x)
                    player1.velocity.x = 0.0;
                    
                player1.velocity.x *= 1.0-( cos(angle) );
                player1.velocity.y = 0;
                
                position.set(level1.collisionCord);
                position.y -= 16;
                Length = player1.position.dist(position);
                
                update();
            }
            
        }
        
    }
    
    void display(float playerX, float playerY){
        if(ropeActive){
            if(hooked){
               strokeWeight(2);
                line(playerX, playerY, position.x - level1.xview-8, position.y-14);
                //ellipse(position.x - level1.xview, position.y-14,4,4);
                fill(255,255,255,100);
                fill(255,255,255,255);
            } else {
               strokeWeight(2);
                line(playerX, playerY, directionRope.x + playerX, directionRope.y + playerY);
                ellipse(directionRope.x + playerX, directionRope.y + playerY,4,4);
                fill(255,255,255,100);
                fill(255,255,255,255);                
            }
            
        }
    }
    
}
class Gold {
    
    PVector position;
    PVector size;
    boolean caught;
    
    public Gold(int x, int y, int sizeX, int sizeY){
         position = new PVector(x, y);
         size = new PVector(32, 32);
         caught = false;
    }

    boolean collision(PVector location){
        
         if(location.x >= position.x - 12 && location.x  <= position.x + size.x + 12){
             if(location.y >= position.y - 12 && location.y <= position.y + size.y + 12){
                 return true;
             }             
         }
         return false;
         
    }
    
    void display(int xviewer){
        if(!caught){
             noStroke();
             fill(255,0,0);
             ellipse(position.x - xviewer,position.y,size.x,size.y);
        }         
    }
    
    
}


