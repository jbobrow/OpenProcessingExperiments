
/* CA Color Texture por Marcos Frankowicz */

boolean[][] liga;
boolean[][] desliga;
PImage pimage;
int num = 600;
int num2 = 600;

int[][] corintX = new int[num][num2];
int[][] corintY = new int[num][num2];

Point[][] p = new Point[num][num2];

void setup(){
  size(num,num2,P2D);
  pimage = loadImage("flor2.png");
  liga = new boolean[num][num2];
  desliga = new boolean[num][num2];
  for(int i = 0; i<num; i++){
    for(int j = 0; j<num2; j++){
      liga[i][j] = false;
      p[i][j] = new Point();
    }
  }
}

void draw(){
  background(0);
  for(int i = 0; i<num; i++){
    for(int j = 0; j<num2; j++){
      
      if(liga[i][j] == true){
        color strokeColor = pimage.get(i,j);
        stroke(strokeColor);
        point(i,j);
       }
      
      color cor = color(110);

      if(pimage.get(i,j) < cor){
        p[i][j].setLocation(i,j);
      }
      
      
      corintX[i][j] = (int) p[i][j].getX();
      corintY[i][j] = (int) p[i][j].getY();
      
      int x = corintX[i][j];
      int y = corintY[i][j];
     
      liga[x][y] = true;
            
      int count = 0;
      for(int m = - 1; m <= 1; m++){
        for(int n = - 1; n <= 1; n++){
          if(!(m == 0 && n == 0)){
            if(liga[(i+m+num)%num][(j+n+num2)%num2] == true){
              count++;
            }
          }
        }
      }
      
      if(count < 0 || count > 2){
       if((count == 1)){
        liga[i][j] = false;
       }
      }
      else if(count == 1 || count == 2){
        desliga[i][j] = true;
      }
     
    }
  }

  for(int i = 0; i<num; i++){
    for(int j = 0; j<num2; j++){
      liga[i][j] = desliga[i][j];
    }
  }
}

void keyPressed(){
  for(int i = 0; i<num; i++){
    for(int j = 0; j<num2; j++){
      liga[i][j] = false;
      desliga[i][j] = false;
    }
  }
}
/
void mousePressed(){
  save("image.png");
}



