

/*

Squarenail
Based on Alejandro Zahler and "StoryingInput" sketch from the examples 
Magali Jaume
May,2009
magali@magalijaume.com

*/

int num = 80;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  
  size(500,500);
  smooth();
};

void draw(){
   
  background(100,150,150);
  
  
  for (int i = 1; i < num; i ++) {
    mx[i-1] = mx[i];
    my[i-1] = my[i];
  }
    
    mx [num-1] = mouseX;
    my [num-1] = mouseY;
    
    for(int i = 0; i < num; i ++) {
      float inc=TWO_PI*0.05;
      float factorX = (num-i) + (mx[num-1]/width)*5;
      float factorY = (num-i) + (my[num-1]/height)*5;
      
      float squareX = mx[i]+factorX*sin(inc*i);
      float squareY = my[i]+factorY*cos(inc*i);
      
      int color1 = int(squareX/(width+30)*255 + random (-30, 30));
      int color2 = int(squareY/(height+30)*255 + random (-30,30));
      
      fill(color1, color2, (squareX + squareY)*0.5 + 150 + random(-50,50),80);
      rect(squareX,squareY, i/2, i/2);
      stroke(100,150,150);
       
    }
  };

 


