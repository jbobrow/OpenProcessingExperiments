
//ABRAHAM ALAVREZ VALLEJO
// MAC
void setup()
         {
          size(200,200); 
         }
 
  void draw(){
         background(255);
         noFill();
         strokeWeight(5);
         smooth();
         stroke(0,0,255);
         ellipse(30,30,40,40);
         stroke(255,255,0);
         ellipse(45,50,40,40);
         stroke(0,0,0);
         ellipse(60,30,40,40);
         stroke(0,255,0);
         ellipse(75,50,40,40);
         float x=int(random(20,300));
         float y=int(random(10,200));
         stroke(255,0,0);
                if ((x!=90) && (y!=30))
                   {
                       ellipse(x,y,40,40);          
                   } 
                    else
                  {
                   ellipse(90,30,40,40);
                   noLoop();
                  }          
        }
