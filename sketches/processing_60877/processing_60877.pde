
gameboard testGame;

void setup(){

  size(640,360,JAVA2D);
  frameRate(30);
  background(0);
  
  testGame = new gameboard(32,24,28);
  testGame.FillBoardRandomly();
  testGame.InvalidateEdges();
  testGame.AddTroops(32);
  testGame.TickBoardAttack();
  testGame.DisplayBoard((width/(float)testGame.dimX), (height/(float)testGame.dimY));
 
}
void draw(){
  background(0);
  testGame.AddTroops(1);
  testGame.TickBoardAttack();
  testGame.TickBoardMove();
  testGame.DisplayBoard((width/(float)testGame.dimX), (height/(float)testGame.dimY));
  
}

void mousePressed(){
  testGame = new gameboard(32,24,28);
  testGame.FillBoardRandomly();
  testGame.InvalidateEdges();
  testGame.AddTroops(32);

}

class gameboard {

  player[] players;
  spot[][] board;
  int dimX, dimY;

  gameboard(int x, int y, int numberOfPlayers) {
    dimX = x;
    dimY = y;
    CreatePlayers(numberOfPlayers);
    CreateBoard(dimX, dimY);
  }

  void CreatePlayers(int numberToCreate) {
    players = new player[numberToCreate];
    for (int i = 0; i < numberToCreate; i++) {
      players[i] = new player(i);
    }
  }

  void CreateBoard(int x, int y) {
    board = new spot[x][y];
    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        board[i][j] = new spot(0, 0);
      }
    }
  }

  void FillBoardRandomly() {
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        board[i][j].ownerID = (int)random(players.length);
        board[i][j].numberOfTroops = (int)random(255);
        if (random(1.0) < 0.00) {
          board[i][j].KillAll();
        }
        if (random(1.0) < 0.25) {
          board[i][j].MakeInvalid();
        }
      }
    }
  }

  void InvalidateEdges() {
    // top and bottom
    for (int i = 0; i < dimX; i++) {
      board[i][0].MakeInvalid();
      board[i][dimY-1].MakeInvalid();
    }
    // left and right    
    for (int i = 0; i < dimY; i++) {
      board[0][i].MakeInvalid();
      board[dimX-1][i].MakeInvalid();
    }
  }


  void DisplayBoard(float _scaleX, float _scaleY) {

    stroke(0);

    int spotOwner;
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        spotOwner = board[i][j].ownerID;
        
        if(board[i][j].AttackAction){stroke(255,0,0,255); board[i][j].AttackAction= false; }
        else if(board[i][j].MoveAction){stroke(0,255,0,255); board[i][j].MoveAction = false; }        
        else { stroke(0); }
        
        if (spotOwner != -1 && spotOwner != -2) {

          fill(players[spotOwner].colorR, players[spotOwner].colorG, players[spotOwner].colorB, max(64, board[i][j].numberOfTroops*44));
          rect((i*_scaleX)+1.0, (j*_scaleY)+1.0, _scaleX-1.0, _scaleY-1.0);
        }
        else if (spotOwner == -2) {
          strokeWeight(0.75);
          stroke(32,255);
          fill(255);
          rect((i*_scaleX)+1.0, (j*_scaleY)+1.0, _scaleX-1.0, _scaleY-1.0);
        }
      }
    }
  }

  void AddTroops(int numberToAdd) {
    for (int i = 0; i < dimX; i++) {
      for (int j = 0; j < dimY; j++) {
        if (board[i][j].ownerID >= 0) {
          if (board[i][j].numberOfTroops < 255) board[i][j].numberOfTroops += numberToAdd;
          else {
            //board[i][j].numberOfTroops = 255;
          }
        }
      }
    }
  }


  void TickBoardAttack() {
    int numberOfPlayers = players.length;
    for (int playerIndex = 0; playerIndex < numberOfPlayers; playerIndex++) {
      boolean doneAttacking = false;
      while (!doneAttacking) {
        doneAttacking = true;
        for (int i = 1; i < dimX-1; i++) {
          for (int j = 1; j < dimY-1; j++) {
            int spotOwner = board[i][j].ownerID;
            if ((spotOwner == players[playerIndex].playerID) && (board[i][j].numberOfTroops > 2)) {
              // do it!
              spot[] neighborsToCheck = new spot[4];
              neighborsToCheck[0] = board[i][j-1];  // top
              neighborsToCheck[1] = board[i+1][j];  // right
              neighborsToCheck[2] = board[i][j+1];  // bottom
              neighborsToCheck[3] = board[i-1][j];  // left

              int whoToAttack = players[playerIndex].EvaluatePositionAttack(board[i][j], neighborsToCheck);

              if (whoToAttack >= 0) {
                
                // attack sequence
                doneAttacking = false;
                board[i][j].AttackAction = true;
                
                if (random(neighborsToCheck[whoToAttack].numberOfTroops) > random(board[i][j].numberOfTroops)) {
                  // lose
                  board[i][j].numberOfTroops -= neighborsToCheck[whoToAttack].numberOfTroops;
                  board[i][j].numberOfTroops = max(2, board[i][j].numberOfTroops);
                  //println("lose");
                }
                else {
                  // win, move half
                  board[i][j].numberOfTroops = ceil(board[i][j].numberOfTroops/2);
                  //println("win");

                  if (whoToAttack == 0) {
                    //println("0");
                    board[i][j-1].set(board[i][j]);
                  }
                  if (whoToAttack == 1) {
                    //println("1");                  
                    board[i+1][j].set(board[i][j]);
                  }
                  if (whoToAttack == 2) {                
                    //println("2");                  
                    board[i][j+1].set(board[i][j]);
                  }
                  if (whoToAttack == 3) {
                    //println("3");                  
                    board[i-1][j].set(board[i][j]);
                  }
                }
              }
              else {
                //println("No Action");
              }
            }
            else {
              // not ours
            }
          }  // end of j
        }  // end of i
      }
    }  // end of playerIndex
  }  // end of TickBoardAttack()
  void TickBoardMove() {
    int numberOfPlayers = players.length;
    for (int playerIndex = 0; playerIndex < numberOfPlayers; playerIndex++) {
      for (int i = 1; i < dimX-1; i++) {
        for (int j = 1; j < dimY-1; j++) {

          int spotOwner = board[i][j].ownerID;
          if (spotOwner == players[playerIndex].playerID) {
            // do it!
            spot[] neighborsToCheck = new spot[4];
            neighborsToCheck[0] = board[i][j-1];  // top
            neighborsToCheck[1] = board[i+1][j];  // right
            neighborsToCheck[2] = board[i][j+1];  // bottom
            neighborsToCheck[3] = board[i-1][j];  // left

            int whoToAttack = players[playerIndex].EvaluatePositionMove(board[i][j], neighborsToCheck);

            if (whoToAttack >= 0) {

              // win, move half

              //println("win");
              board[i][j].numberOfTroops  = floor(board[i][j].numberOfTroops/ 2);
              board[i][j].MoveAction = true;                

              if (whoToAttack == 0) {
                //println("0");
                board[i][j-1].numberOfTroops += (board[i][j].numberOfTroops);
                board[i][j-1].MoveAction = true;                
              }
              if (whoToAttack == 1) {
                //println("1");                  
                board[i+1][j].numberOfTroops += (board[i][j].numberOfTroops);
                board[i+1][j].MoveAction = true;                
              }
              if (whoToAttack == 2) {                
                //println("2");                  
                board[i][j+1].numberOfTroops += (board[i][j].numberOfTroops);
                board[i][j+1].MoveAction = true;                
              }
              if (whoToAttack == 3) {
                //println("3");                  
                board[i-1][j].numberOfTroops += (board[i][j].numberOfTroops);
                board[i-1][j].MoveAction = true;                
              }
            }
            else {
              //println("No Action");
            }
          }
          else {
            // not ours
          }
        }  // end of j
      }  // end of i
    }  // end of playerIndex
  }  // end of TickBoardMove()
}    // end of class gameboard


/*

 Parameters for inputs to linear regression algorithm
 
 */

class player {

  int playerID;
  boolean isAlive;
  
  int colorR, colorG, colorB;

  // inputs for NN, environment stats
  int globalNumberOfFriendlyTroops;  // all troops held
  int globalNumberOfEnemyTroops;     // count of all enemy troops
  int globalNumberOfEnemies;         // count of all enemy players still alive
  float globalNumberOfHeldSpots;     // as a percentage of the game board
  float globalNumberOfEnemySpots;    // as a percentage of the game board

  int localNumberOfTroops;         // troops held at game position being evaluated
  int localNumberOfEnemyTroopsInNeighborhood;    // neighbors of spot being evaluated
  int localNumberOfFriendlyTroopsInNeighborhood; // neighbors
  int localNumberOfEnemyTroopsBeingEvaluated;    

  float[] inputVector;
  float[] hypothesis;
  
  player(int _id){
    
    playerID = _id;
    isAlive = true;
    
    colorR = (int)random(255);
    colorG = (int)random(255);
    colorB = (int)random(255);
    
    int inputVectorSize = 9;
        
    hypothesis = new float[inputVectorSize];
    inputVector = new float[inputVectorSize];
    
    for(int i = 0; i < 8; i++){
      hypothesis[i] = random(-10,10);
    }
        
  }
  
  void LoadInputVector(){
    inputVector[0] = (float)globalNumberOfFriendlyTroops;
    inputVector[1] = (float)globalNumberOfEnemyTroops;
    inputVector[2] = (float)globalNumberOfEnemies;
    inputVector[3] = (float)globalNumberOfHeldSpots;
    inputVector[4] = (float)globalNumberOfEnemySpots;
    inputVector[5] = (float)localNumberOfTroops;
    inputVector[6] = (float)localNumberOfEnemyTroopsInNeighborhood;
    inputVector[7] = (float)localNumberOfFriendlyTroopsInNeighborhood;
    inputVector[8] = 0.0;    
  }
  
    // player decides who to attack
  int EvaluatePositionAttack(spot currentPosition, spot[] neighbors) {

    // evaluate each neighbor and assign a rank, 0.0 - 1.0
    int numberOfNeighbors = neighbors.length;
    float[] ranks = new float[numberOfNeighbors];

    // fill stats
    localNumberOfTroops = currentPosition.numberOfTroops;
    localNumberOfEnemyTroopsInNeighborhood = localNumberOfFriendlyTroopsInNeighborhood = 0;
    for (int i = 0; i < numberOfNeighbors; i++) {
      if (neighbors[i].ownerID == playerID) {
        localNumberOfFriendlyTroopsInNeighborhood += neighbors[i].numberOfTroops;
      } 
      else {
        if(neighbors[i].ownerID >= 0){
          localNumberOfEnemyTroopsInNeighborhood += neighbors[i].numberOfTroops;
        }
      }
    }
        
    LoadInputVector();
    
    // evaluate each neighbor
    for(int neighborIndex = 0; neighborIndex < numberOfNeighbors; neighborIndex++){
      ranks[neighborIndex] = 0;      
      if(neighbors[neighborIndex].ownerID == playerID){
        // nothing
      }
      else if (neighbors[neighborIndex].ownerID >= 0) {
        inputVector[8] = (float)neighbors[neighborIndex].numberOfTroops;        
        // guts
        for(int i = 0; i < inputVector.length; i++){
          ranks[neighborIndex] += sigmoid(inputVector[i] * hypothesis[i]);
        }
 
      }
      
    }
    
    //println(ranks);
    // evaluate the ranks
    // if 
    float largestRank = 0.0;
    int neighborToAttack = -1;
    
    for(int i = 0; i < ranks.length; i++){
      if(ranks[i] > largestRank){
        largestRank = ranks[i];
        neighborToAttack = i;
      }
    }
    
    //print(neighborToAttack+" ");
    
    return neighborToAttack;
  }
  int EvaluatePositionMove(spot currentPosition, spot[] neighbors) {

    // evaluate each neighbor and assign a rank, 0.0 - 1.0
    int numberOfNeighbors = neighbors.length;
    float[] ranks = new float[numberOfNeighbors];

    // fill stats
    localNumberOfTroops = currentPosition.numberOfTroops;
    localNumberOfEnemyTroopsInNeighborhood = localNumberOfFriendlyTroopsInNeighborhood = 0;
    for (int i = 0; i < numberOfNeighbors; i++) {
      if (neighbors[i].ownerID == playerID) {
        localNumberOfFriendlyTroopsInNeighborhood += neighbors[i].numberOfTroops;
      } 
      else {
        if(neighbors[i].ownerID >= 0){
          localNumberOfEnemyTroopsInNeighborhood += neighbors[i].numberOfTroops;
        }
      }
    }
        
    LoadInputVector();
    
    // evaluate each neighbor
    for(int neighborIndex = 0; neighborIndex < numberOfNeighbors; neighborIndex++){
      ranks[neighborIndex] = 0;      
      if(neighbors[neighborIndex].ownerID == playerID){
        // nothing
        inputVector[8] = (float)neighbors[neighborIndex].numberOfTroops;        
        // guts
        for(int i = 0; i < inputVector.length; i++){
          ranks[neighborIndex] += sigmoid(inputVector[i] * hypothesis[i]);
        }        
      }
      else if (neighbors[neighborIndex].ownerID >= 0) {
        ranks[neighborIndex] = -1;         
      }
      
    }
    
    //println(ranks);
    // evaluate the ranks
    // if 
    float largestRank = 0.0;
    int neighborToAttack = -1;
    
    for(int i = 0; i < ranks.length; i++){
      if(ranks[i] > largestRank){
        largestRank = ranks[i];
        neighborToAttack = i;
      }
    }
    
    //print(neighborToAttack+" ");
    
    return neighborToAttack;
  }  
  
}


class spot {

  int ownerID;  // associated player index
                // -1 = nobody
                // -2 = dead spot
  int numberOfTroops;
  boolean AttackAction;
  boolean MoveAction;
  
  spot(int id, int amountOfTroops){
    ownerID = id;
    numberOfTroops = amountOfTroops;    
  }
  
  void KillAll(){
    ownerID = -1;
    numberOfTroops = 0;    
  }
  
  void MakeInvalid(){
    ownerID = -2;
    numberOfTroops = 0;
  }
  
  void set(spot inputSpot){
    ownerID = inputSpot.ownerID;
    numberOfTroops = inputSpot.numberOfTroops;
  }
  
}


float sigmoid(float _input){
  float denominator = (1.0 + pow(2.7182818284, -_input));
  float returnValue = 1.0;
  if(denominator != 0.0){
    returnValue = (1.0 / denominator);   
  }
  return returnValue;  
}
