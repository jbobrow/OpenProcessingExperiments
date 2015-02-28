

float x=0;
float y=350;
float s=1;

void setup(){
  size (1300, 800);
}

void draw(){
  background ( 255, 204, 0);
 
 
 for (float i=100; i<800; i = i+100 ){
   ellipse (x, i , 80, 80);
   }
   
 for(float i=50 ; i<800 ; i += 100){
   ellipse (x + 100, i, 80, 80);
 }

    ellipse (x - 100, y, 80, 80);
    ellipse (x - 100, y + 100, 80, 80);
    ellipse (x - 100, y + 200, 80, 80);
    ellipse (x - 100, y + 300, 80, 80);
    ellipse (x - 100, y - 100, 80, 80);
    ellipse (x - 100, y - 200, 80, 80);
    
       ellipse (x - 200, y + 50, 80, 80);
       ellipse (x - 200, y + 150, 80, 80);
       ellipse (x - 200, y + 250, 80, 80);
       ellipse (x - 200, y - 50, 80, 80);
       ellipse (x - 200, y - 150, 80, 80);
       
          ellipse (x - 300, y, 80, 80);
          ellipse (x - 300, y + 100, 80, 80);
          ellipse (x - 300, y + 200, 80, 80);
          ellipse (x - 300, y - 100, 80, 80);
          
        ellipse (x - 400, y + 40, 80, 80);
        ellipse (x - 400, y + 140, 80, 80);
        ellipse (x - 400, y - 60, 80, 80);
        
                ellipse (x - 500, y + 69, 80, 80);
                        ellipse (x - 500, y + 169, 80, 80);










     








 
   /*
   ellipse (x + 100, y, 80, 80);
   ellipse (x + 100, y + 100, 80, 80);
   ellipse (x + 100, y + 200, 80, 80);
   ellipse (x + 100, y + 300, 80, 80);
   ellipse (x + 100, y + 400, 80, 80);
   ellipse (x + 100, y - 100, 80, 80);
   ellipse (x + 100, y - 200, 80, 80);
   ellipse (x + 100, y - 300, 80, 80);
*/




   
   
/* 
  ellipse (x, y , 80, 80);
  ellipse (x, y + 100 , 80, 80);
  ellipse (x, y - 100 , 80, 80);
  ellipse (x, y - 200 , 80, 80);
  ellipse (x, y + 200 , 80, 80);
  ellipse (x, y + 300 , 80, 80);
  ellipse (x, y + 400 , 80, 80);
  ellipse (x, y - 300 , 80, 80);
*/



 
  x = x+s;
  
  if (x > 1350)
  { 
   x = 0;
   s = random(5,40);
  }


}
