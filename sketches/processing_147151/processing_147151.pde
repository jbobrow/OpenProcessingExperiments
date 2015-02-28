
void setup(){
 size(400,400);
  //background(40,220,150);
   noStroke();
    noLoop();
    }
    
    void draw(){
     for(int i = 0; i < width ; i = i + 40){
        for(int j = 0 ; j < height ; j = j + 40){
             fill(i*i/-320 + 1.25*i + j*j/-320 + 1.25*j );
                  rect(i,j,40,40);
                     }
                      }
                       
                         
                         }
