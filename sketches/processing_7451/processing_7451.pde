
void poly(float rad, int points, float theta){
 

 beginShape();
 for (int i=0; i<points; i++){
   //one way/bad form:
   //vertex(cos(theta)rad, sin(theta)rad);  
   float px = cos(theta)*rad;
   float py = sin(theta)*rad;
   vertex(px, py);
   theta += TWO_PI/points;
 }
 endShape(CLOSE); 
}


