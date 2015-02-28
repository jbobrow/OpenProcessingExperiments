
size(800, 650);
background(255);
stroke(255);
strokeWeight(2);

int howManyDepts = 4;
int withinEachDept = 4;
int[][] barHeights = new int[howManyDepts][withinEachDept];
int k = 0;
int labelArea = 25;
int graphHeight = height-labelArea;

for(int i = 0; i < howManyDepts; i++) {
  for(int j = 0; j < withinEachDept; j++) {
    barHeights[i][j] = ceil(random(0, 600));
  }
}

for(int i = 0; i < howManyDepts; i++) {
    fill(0);
    text("Dept. "+ (i+1), i*(width/howManyDepts)+5, height-7);

  for(int j = 0; j < (withinEachDept/withinEachDept); j++) {

      float r = random(0, 255);
      float g = random(0, 255);
      float b = random(0, 255);

      fill(r, g, b);
            
      for(int l = 0; l < withinEachDept; l++){
        rect(k, graphHeight-barHeights[i][j], width/(howManyDepts*withinEachDept), barHeights[i][j]);
        k+=(width/(howManyDepts*withinEachDept));
        j++;
      }
  }
}



