
/*  Elo Competition
 *
 *  Inspired by Mark Zuckerberg's use of the Elo ranking system in "The Social Network"
 *  this program automates a competition with all players starting at the average rating
 *  randomly pairing up for competition and then winning or losing based on their likeliness
 *  to win, and then having their scores adjusted for the results using the ELO algorithm
 *  Simply a test of the ELO rating algorithm and maintaining a database of rankings
 *
 *  The system starts with 20 players and every player starts with a rating of 1500
 *  The max rating is 3000 and the lowest is 0, but neither is achievable, since few points
 *  are awarded for a likely victory.
 *
 *  Click to add a new competetor 
 *
 *
*/

ArrayList objects;               // an array of competitors to be objectified
int numObjects = 20;             // number of initial competitors
int padding = 5;                 // space between competitor bars
int contenderOne, contenderTwo;  // two players of the current game
int[] K = {64,32,16};            // A tiered system so more novice players can improve quicker. actually {32, 24, 16} in chess
int initRank = 1500;             // the rank to start a competitor with

float gameplay;                  // variable used to determine the outcome of each game

void setup(){
  size(800,400, P2D);
  smooth();
  noCursor();
  noStroke();
  //frameRate(30);
  
  objects = new ArrayList();
  for(int i=0; i<numObjects; i++){
    objects.add( new Objectified(i, initRank));    //initialize the objects
  }
}

void draw(){
  background(51);
  //fill(51,5);
  //rect(0,0,width,height);
  
  //choose contender 1
  contenderOne = contenderTwo = int(random(0, objects.size()));
  //choose contender 2
  while(contenderTwo == contenderOne)
  {
    contenderTwo = int(random(0, objects.size()));
  }
  
  //determine winner automated
  gameplay = random(1);
  
  Objectified c1 = (Objectified) objects.get(contenderOne); 
  Objectified c2 = (Objectified) objects.get(contenderTwo);
  if(gameplay > c1.expectedScore(c2.rank))
    pickOne(c1,c2);
  else
    pickTwo(c1,c2);
  
  for(int i = 0; i<objects.size(); i++){  
    Objectified bar = (Objectified) objects.get(i);
    //fill(204);
    
    // Color the highest ranked player green
    for(int j = 0; j<objects.size(); j++){
      Objectified vs = (Objectified) objects.get(j);
      if(bar.rank<vs.rank){
        fill(204);
        break;
      }
      else
        fill(102,204,153);      
    }
    bar.drawToScreen();
  }
   
   fill(153);   
   ellipse(mouseX, mouseY, 5, 5);    // replace the cursor with a dot
}

// adjust the ranks when object 1 wins the game
void pickOne(Objectified o1, Objectified o2) {
  o1.computeRank(o2.rank, true);
  o2.computeRank(o1.rank, false);
}

// adjust the ranks when object 2 wins the game
void pickTwo(Objectified o1, Objectified o2) {
  o1.computeRank(o2.rank, false);
  o2.computeRank(o1.rank, true);
}

void mousePressed() {
  // A competitor enters the competition
  objects.add(new Objectified(numObjects++, initRank));
}

