
int x1 = 250;
int y1 = 250;
int x2 = x1+30;
int y2 = y1+30;
int x3 = x2+30;
int y3 = y2+30;
int x4 = y3+30;
int i=0;

float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];

void setup() {
  size (400,400);
  stroke(0);
  background(0);
}
void draw() {
  
      if(mousePressed)
    {
      
      i++;
      if(i==1)
      {
        fill(5,50,150,50);
      triangle(mouseX,mouseY,mouseX,20,mouseY,mouseX);
      }
      
      if(i==2)
      {
        fill(50,100,5,50);
         rect(mouseX,mouseY,50,50) ;
      }


      if(i==3)
      {
        fill(250,0,0,100);
        ellipse(mouseX,mouseY,20,20) ;
        i=0;
      }
     

      

    }



}





