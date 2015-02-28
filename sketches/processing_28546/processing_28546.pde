
char [] typing = {
  'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
}; 

int x=255;           // x is set to 0 when the pacman "eats" the ball. 
                     // this will make the ball transparent, so that it 
                     // appears that the ball has disappeared.

int progress=0;      // progress represents the active value
                     // in the array of letters shown above.\

int pos=100;         //player position.

int targetpos=300;   //enemy position.

int angleA=45;       // These two angles create pacman's mouth. The "mouth"
int angleB=315;

int difficulty=2;    //difficulty represents the "speed" at which the ball "moves"

void setup() {
  size(1440,300);
  noStroke();
  smooth();

  frameRate(60);
}

void draw() {
  background(0);
  if(keyPressed && key == typing[progress]) {     // when the correct letter is
    pos+=45;                                      // typed, progress will increase by one.
    progress++;
  }


  if((targetpos-pos)<=45)          // if the player's position is approximate
  {                            // to the enemy's position, the player
    angleA=1;                  // will consume the enemy. x is set to 0 to
    angleB=364;                // make the enemy disappear. 
    x=0;
  }
  else {
    angleA=45;
    angleB=315;
  }

  targetpos+=difficulty;   //target position will be increased by
                           // difficulty (60 times per second)


  fill(255,x);                              // enemy.
  ellipse(targetpos,height/2,100,100);      //

  fill(255);                                                     // player
  arc(pos,height/2,200,200,radians(angleA),radians(angleB));     //

  fill(0);
  text(typing[progress], pos-10,90); // letter to type next (shown where
                                     // pacman's eye would be.

  if(keyPressed == true && key == '1') {        // difficulty
    pos=100;
    targetpos=300;
    x=255;
    progress=0;
    ;
    difficulty=2;
  }

  if(keyPressed == true && key == '2') {
    pos=100;
    targetpos=300;
    x=255;
    progress=0;
    difficulty=3;
  }

  if(keyPressed == true && key == '3') {
    pos=100;
    targetpos=300;
    x=255;
    progress=0;
    difficulty=4;
  }

  if(keyPressed == true && key == '4') {
    pos=100;
    targetpos=300;
    x=255;
    progress=0;
    difficulty=5;
  }

  if(keyPressed == true && key == '5') {
    pos=100;
    targetpos=300;
    x=255;
    progress=0;
    difficulty=6;
  }

  if(keyPressed == true && key == ' ') {
    pos=100;
    targetpos=300;
    x=255;
    progress=0;
  }
}


