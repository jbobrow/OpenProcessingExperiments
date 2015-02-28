
size(500, 500);
smooth();

float x = width/2;
float y = height/2;

int d = 10;

noFill();
for ( int k=0;k<width;k+=d){
  strokeWeight(k*0.002);
  ellipse(x,y,k,k);
}

strokeWeight(0.2);

for (int j=0;j<height;j+=d) {
 for (int i=0;i<width;i+=d) {
   if (i%3 == 0)
   {
     stroke(200);
   }
   else
   {
     stroke(0);
   }
   line(i, j, x, y);
  }
}



