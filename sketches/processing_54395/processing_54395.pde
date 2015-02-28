
float y = 250.0;//the begginning size of shape
float a = -100; // for opacity to be at 100%
void setup()
{


size(250, 250); //size of background
background (255); //background colour
smooth(); //used to smooth out circle
}




void draw() {


 background(#8b7d6b);
 noStroke(); // no stroke on circle
 ellipse(0,0,y,y); //circles position (x,y)corner
 fill(125-y,100-a); // colour starts off as white and opacity subtracts and then when growing again turns black
   
 

  if (y>700){ //Shape will STOP growing once it gets to 700 and then loop back to -125
  y=-125.0;

  }else{
   y+= 1.5; // y will grow at the speed of 1.5 until circle finishes growing
  }

}
    
    //Is not playing the way it does in proccessing program, but still the effect I wanted            
                
