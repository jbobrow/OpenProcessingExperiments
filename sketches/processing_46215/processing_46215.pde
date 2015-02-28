
float ellSize = 20 ;

void setup() {
    size(500,500) ;
    ellipse (100,100,ellSize, ellSize) ;
    println(areaCircle(ellSize));
   }
   
   float areaCircle (float dia){
   float rad = dia/2 ;
   float area = PI *rad *rad ;
   return area ;
   }
   
    
                
                
