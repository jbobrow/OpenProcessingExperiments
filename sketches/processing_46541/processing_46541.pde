
import processing.pdf.*;

void setup (){
  size(400, 400);
  background(46, 17, 28);
  
  
}

void draw (){
   for (int y=0; y <=1; y = y +=78 ){
  for (int x=67; x <=67; x = x +=2){
 
    
    rect(x+(random(1, 67)), y+3, width+45, height+100);
    stroke(60, 30, 20);

  }
  }

saveFrame("caca.jpg");
}

                
                
