
//*************Drop***********************//

class Drop {
  float x,y;

  
 void display() {  
    noStroke();

     for( int i= 0; i < r.length; i++)
   {
     if(r[i]< rain[i]) {
       r[i] = r [i] + 0.02;
       float x = map(i, 0, r.length, leftEdge, rightEdge);
       float y = map( r[i], maxValue, minValue, topEdge, bottomEdge);
       fill(180,225,0);
       ellipse(x, y, 10, 10);
  
       }
    }
 }


}


