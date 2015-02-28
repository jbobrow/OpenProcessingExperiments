
int counter;
float radius;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  radius = 10;
  

  float dx = 1;
  float dy = 1;
  
}

void draw() {  //draw function loops 
 background(255);

  int i = 0;
  line(0,0,width,height);
  while( i < height ){
 
     line( mouseX*mouseX,mouseY,i,i);
     //line(i,i,x,y);
     i +=5 ;
  }
   point(random(width),random(height));
}





public interface Motivator{

   public void updateCoordinates();
   

}



public class Coordinates{
   
   float xPosition;
   float yPosition;
   
}







public class Box{

   float topLeftCorner_xPosition;
   float topLeftCorner_yPosition;
   
   float sideLength;
   
   public Box(float topLeftCorner_xPosition, float topLeftCorner_yPosition, float sideLength){
      this.topLeftCorner_xPosition = topLeftCorner_xPosition;
      this.topLeftCorner_yPosition = topLeftCorner_yPosition;
      this.sideLength = sideLength;
   }
      


}



            
                                                
