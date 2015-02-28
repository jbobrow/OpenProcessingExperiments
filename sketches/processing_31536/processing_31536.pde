
void setup (){
  size (283,567); //width and height
  background (0); //background colour
  stroke(255);//colour of line
  strokeWeight(0.5);//thickness of line

int xAmount =5;
int yAmount = 4;

for(int i = 0; i < width; i = i+5){
      for(int j = height; j >0; j = j-4){
       float choice = random (2);
        if(choice<=1){
        stroke(255);
          point(i,j);
        }
        else {
        stroke(0);
         point(i,j);
        }
     }
  }

}

void draw(){
  int xAmount =5;
int yAmount = 4;

for(int i = 0; i < width; i = i+5){
      for(int j = height; j >0; j = j-4){
       float choice = random (2);
        if(choice<=1){
        stroke(255);
          point(i,j);
        }
        else {
        stroke(0);
         point(i,j);
        }
     }
  }
}

void myStructure(int x1, int y1, int x2, int y2){
  line (x1,y1,x2,y2);
}

