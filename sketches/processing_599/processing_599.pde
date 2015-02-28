
//Matt Richard

//declare variables 
int totalDiceRolls = 400; // !! must be a square,  var for how many squares you want on the screen, 
int diceRollResult[][]; // create nested array that holds the rects alpha value
color color0 = color(0);
color color1 = color(255,0,0);
color color2 = color(255);
color color3 = color(0,0,255);
color color4 = color(255,255,0);
color color5 = color(200,0,255);

void setup () { 
  size(400,400);
  
  for(int i=0; i<6; i++){
   switch(i){
    case 0:
    color0 = color(random(255),random(255),random(255));
    break;
    case 1:
    color1 = color(random(255),random(255),random(255));
    break;
    case 2:
    color2 = color(random(255),random(255),random(255));
    break;
    case 3:
    color3 = color(random(255),random(255),random(255));
    break;
    case 4:
    color4 = color(random(255),random(255),random(255));
    break;
    case 5:
    color5 = color(random(255),random(255),random(255));
    break;
   } 
  }
  
  diceRollResult = new int[floor(sqrt(totalDiceRolls))][floor(sqrt(totalDiceRolls))];
  
  for(int x=0; x < sqrt(totalDiceRolls); x++){ 
    for(int y=0; y < sqrt(totalDiceRolls); y++){ 
         diceRollResult[x][y] = round(random(5));
      
      switch(diceRollResult[x][y]){
      case 0:
       fill(color0); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 1:
       fill(color1); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 2:
       fill(color2); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 3:
       fill(color3); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 4:
       fill(color4); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 5:
       fill(color5); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      default:             // Default executes if the case labels
       println("None");   // don't match the switch parameter
       break;
      }
  } 
} 
}

void draw (){
//  for(int x = 0; x < sqrt(totalDiceRolls); x++){ 
//    for(int y = 0; y < sqrt(totalDiceRolls); y++){
//      fill(diceRollResult[x][y]); 
//      rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
//    } 
//  } 
} 

void mousePressed() {
  for(int x = 0; x < sqrt(totalDiceRolls); x++){ 
    for(int y = 0; y < sqrt(totalDiceRolls); y++){ 
           diceRollResult[x][y] = round(random(5));
      
      switch(diceRollResult[x][y]){
      case 0:
       fill(color0); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 1:
       fill(color1); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 2:
       fill(color2); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 3:
       fill(color3); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 4:
       fill(color4); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      case 5:
       fill(color5); 
       rect(floor((x * (width/(sqrt(totalDiceRolls))))), floor((y * (height/(sqrt(totalDiceRolls))))), floor((width/(sqrt(totalDiceRolls)))), floor((height/(sqrt(totalDiceRolls))))); 
       break;
      default:             // Default executes if the case labels
       println("None");   // don't match the switch parameter
       break;
      }
    } 
  } 
}




