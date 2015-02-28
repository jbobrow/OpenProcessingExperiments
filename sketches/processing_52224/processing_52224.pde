
//Kelly Fadem
//Assignemnt 3 Images

//
int x = 10;

//setup
void setup(){
  size(620,620);
  background (0);
  smooth();
  for(int i=30; i <height; i+= 70){
  for(int j=30; j <width; j+=70){
    
  ellipse(i, j, 60, 60);
//yellow dots      
      if(i%1 ==0 && j % 4==0){
       // fill(255, 232, 49);
        fill(255, 232, 49);
        noStroke();
        fill (255, 160, 170);
        ellipse(i,j, 40, 40);

      }
//white dots
        if(i%1 ==0 && j % 1==0){
        fill(255, 232, 49);
        noStroke();
        ellipse(i,j, 20, 20);
      }

     }
   }
}
//pink dot grid
void draw(){
  for(int i=30; i <height; i+= 70){
    for(int j=30; j <width; j+=70){
//interaction
        if(mouseX>i && mouseY < i+8 && mouseY > j & mouseY < j+8){
          fill(mouseX+i, mouseY+j, 20, 20);
      fill (255, 160, 170);
      ellipse(i, j, 60, 60);
//yellow dots      
      if(i%1 ==0 && j % 4==0){
        fill(75, 200, 200);
        noStroke();
        ellipse(i, j, 40, 40);

      }
//white dots
        if(i%1 ==0 && j % 1==0){
        fill(255);
        noStroke();
        ellipse(i,j, 20, 20);
      }
    }
    }
  }
}

