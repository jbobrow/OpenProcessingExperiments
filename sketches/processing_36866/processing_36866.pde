
size(500, 500); 
background(#FF8000);
int spacePerFigureY = height/15;
int spacePerFigureX = width/15;
int WandHofFigures = spacePerFigureX/5 * 3;
float randomToAdd;
int currentX;
int currentY;

for (int row = 0; row <= height/spacePerFigureY; row++){
    for(int col = 0; col <= width/spacePerFigureX; col++){
      if(row % 2 == 0) randomToAdd = random(-10,10);
      else randomToAdd = 0;
      currentX = spacePerFigureX * row - spacePerFigureX/2;
      currentY = spacePerFigureY * col - spacePerFigureY/2;
      strokeWeight(random(1,3));
      if((col % 2 == 1) && (row % 2 == 0)) line(currentX, currentY, spacePerFigureX * (row+1) - spacePerFigureX/2, spacePerFigureY * (col+1) - spacePerFigureY/2);
      if((col % 2 == 0) && (row % 2 == 1)) line(currentX, currentY, spacePerFigureX * (row+1) - spacePerFigureX/2, spacePerFigureY * (col+1) + spacePerFigureY/2);
      fill(random(0,255));
      strokeWeight(1);
      ellipse(currentX, currentY, WandHofFigures+randomToAdd, WandHofFigures+randomToAdd);
    }
}

