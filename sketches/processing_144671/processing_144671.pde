

size(500, 500);
int i = 0;
int j = 500;
 
while (i <= 250) {
  
 noStroke();
 fill(i,125,125,i);
 ellipse(i,width/2,i,50);
 ellipse(height/2,i,50,i);
 i += 10;
 }
 
while (j >= 250) {
  noStroke();
  int c = int(map(j,250,500,250,0));
 fill(c,240,375,c);
 ellipse(j,width/2,c,50);
 ellipse(height/2,j,50,c);
 j -= 10;
}

