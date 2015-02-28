
int startX=0;
int startY=0;
int endX=500;
int endY = 500;
int distance = 50;
int numLines = 10;

size(500, 500);
background (0, 0, 0);
smooth();

for(int i=1; i<=numLines; i++){
  stroke(0, 255, 255);
 
  line(i*distance, startX, endX, i*distance);
}
  

