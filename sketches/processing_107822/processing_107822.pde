
final int x = 600;
final int y = 600;
final int max_ptn = 8;

int tmp_y = 0;
int[] tmp_cell = new int[x+2];
int[] cell = new int[x];
int[] cellPtn = new int[max_ptn];

void setup() 
{
  size(x, y);
  initCell();
}

void initCell(){
  background(255);

  tmp_y = 0;

  for(int i=0; i<x+2; i++){
    tmp_cell[i]=((int)random(2)+1)%2;
  }

  for(int i=0; i<max_ptn; i++){
    cellPtn[i]=((int)random(2)+1)%2;
  }
}

void draw(){
  drawCell();
}

void drawCell(){
  for(int i=1; i<x+1; i++){
    int cell_value = 0;
    cell_value +=  tmp_cell[i-1]*4;
    cell_value +=  tmp_cell[i]*2;
    cell_value +=  tmp_cell[i+1];

    switch(cell_value){
      case 0:
        cell[i-1]=0;
      break;
      case 1:
        cell[i-1]=cellPtn[1];
      break;
      case 2:
        cell[i-1]=cellPtn[2];
      break;
      case 3:
        cell[i-1]=cellPtn[3];
      break;
      case 4:
        cell[i-1]=cellPtn[4];
      break;
      case 5:
        cell[i-1]=cellPtn[5];
      break;
      case 6:
        cell[i-1]=cellPtn[6];
      break;
      default:
        cell[i-1]=cellPtn[7];
      break;
    }

    if(cell[i-1]==1){
      point(i-1, tmp_y);
    }
  }

  for(int i=0; i<x; i++){
    tmp_cell[i] = cell[i];
  }
  tmp_cell[x]=cell[0];
  tmp_cell[x+1]=cell[1];  

  if(tmp_y < y){
    tmp_y++;
  }
}

void mousePressed(){
  initCell();
}
