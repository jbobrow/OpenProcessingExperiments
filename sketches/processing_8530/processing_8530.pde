



// define the initial start board.
// p is for pawn etc. 
// big letters are black, 
// small  letters are white 
// figures. 



String [][]SetField () {

  String[][] Buffer = new String[8][8]; 

  // pre-init
  for (int i = 0; i < 8; i = i+1) {
    for (int j = 0; j < 8; j = j+1) {
      Buffer [i][j]  = " ";
    }
  }

  // pawns
  for (int i = 0; i < 8; i = i+1) {
    Buffer [i][6]  = "p"; 
  }  
  for (int i = 0; i < 8; i = i+1) {
    Buffer [i][1]  = "P";
  }    

  // others
  Buffer [3][0] = "Q"; //   queen 
  Buffer [3][7] = "q"; //   queen 
  Buffer [4][0] = "K"; //   king
  Buffer [4][7] = "k"; //   king

  Buffer [0][0] = "R"; //   rook
  Buffer [7][7] = "r"; //   rook

  Buffer [7][0] = "R"; //   rook
  Buffer [0][7] = "r"; //   rook

  Buffer [2][0] = "B"; //   bishop 
  Buffer [5][7] = "b"; //   bishop 

  Buffer [5][0] = "B"; //   bishop 
  Buffer [2][7] = "b"; //   bishop 

  Buffer [1][0] = "N"; //   knight 
  Buffer [6][7] = "n"; //   knight 

  Buffer [6][0] = "N"; //   knight 
  Buffer [1][7] = "n"; //   knight 

  return (Buffer); 

}      




