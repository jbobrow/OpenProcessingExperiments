
class Invader{
  int[][] rightSide;
  int[][] leftSide;
  final int ligne = 6;
  final int colonne = 3;
  Invader(){
    rightSide = new int[ligne][colonne];
    leftSide  = new int[ligne][colonne];
    generateRight();
    mirror();
  }
  void generateRight(){
    for(int i = 0;i < ligne;i++)
      for(int j = 0;j < colonne;j++)
      {
        int val;
        float r = random(0,1);
        if(r<=0.5)
          val = 0;
        else
          val = 1;
        rightSide[i][j] = val;
      }
  }   
  void mirror(){
    for(int i = 0;i < ligne;i++)
      for(int j = 0;j < colonne;j++)
        leftSide[i][j] = rightSide[i][(colonne-1)-j];      
  }
}


