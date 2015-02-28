
 
 void makeShape(int x, int y, int points, float r, int strokeCol, 
      float strokeWt){
       float px=0, py=0;
      float angle =0;
     stroke(strokeCol);
   strokeWeight(strokeWt);
  beginShape();
 for(int i=0; i<points; i++){
   px= x+cos(radians(angle))*r;
   py=y+sin(radians(angle))*r;
   vertex(px,py);
   angle+=360/points;
 } 
 endShape(CLOSE);
      }
      

