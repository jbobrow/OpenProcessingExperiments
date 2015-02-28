
            
     




// pink knots





 
void setup() {
  size (500,500);

}

int x1 = 10;
int y1 = 40;
int spacing = 40;




void draw  () {
    background (0,255,249);
  for (int j = 0; j <= 500; j = j +spacing){
     fill (0 +j/2);
    for (int i = 0; i <= 500; i = i + spacing) {
      fill (20 + i/4);
      for ( int k = 0; k <= 25; k = k +5){
        //fill(#F6FF00);
        //ellipse (x1 + i, y1 - j, 40 -k,40-k); // yellow top circles
        fill (#FF00D5);
        ellipse ( x1 + i,y1 + j,10-k,10-k); // pink knots
        //fill(#FF90E4);
          // ellipse ( x1 + i,y1 + j,10-k,60-k);// links red/pink knots
           fill(#FC3340);
           ellipse ( x1 + i,y1 + j,30-k,7-k); //red interior of squished ellipses
          // fill (#F8FC33);
           // rect ( x1 + i,y1 + j,30-k,7-k); // yellow bars(rectangles)
        //  fill(#33FC7B);
        //  ellipse (x1 + i,y1 + j,30-k,3-k); // green slice in pink circle
      }
    }
  }
  
}

