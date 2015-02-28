
// **Created by Aparna J. Nambiar
//Displays ripples


int bColor = 0; //background color
int number=20;
Ripple[] ripples = new Ripple[number];
  
void setup()
{
  //initialize the screen
  screenWidth=500;
  screenHeight=300;
  size(500, 300);
  background(bColor);
  smooth();
  noFill();
  //initialize ripples
  for(int i=0; i<number; i++){
    ripples[i] = new Ripple(int(random(25,screenWidth)),int(random(25,screenHeight)),int(random(25,50)),int(random(50,255)),5);
 }
    
}
 
void draw()
{
  background(bColor);
  //ripples
  for(int i=0; i<number; i++)
  { //ripples[i].fillColor=int(random(0,255));
//  print(innerDiameter+","+ripples[i].d+"  ");
    if(ripples[i].innerD==ripples[i].d){print("Inside");
      ripples[i].innerD=0;
      ripples[i].x=int(random(50,screenWidth));
      ripples[i].y=int(random(50,screenHeight));
      ripples[i].d=int(random(25,50));
      ripples[i].fillColor=255;
    }
      
    ripples[i].d+=1;
    ripples[i].innerD+=2;
//    strokeWeight(100);
    stroke(255);
    fill(255);
    ellipse(ripples[i].x,ripples[i].y,ripples[i].d,ripples[i].d);
    stroke(0);
    fill(0);
    ellipse(ripples[i].x,ripples[i].y,ripples[i].innerD,ripples[i].innerD);
//    print(ripples[i].x+"//");
    
   }
  delay(50); 
}
 
class Ripple
{
  int x,y,d,fillColor,innerD;
  //x: center X coordinate
  //y: center Y coordinate
  //d: diameter

  Ripple(int xCord, int yCord, int dia, int fillCol, int innerD){
    x=xCord;
    y=yCord;
    d=dia;
    fillColor=fillCol;
  }

}



