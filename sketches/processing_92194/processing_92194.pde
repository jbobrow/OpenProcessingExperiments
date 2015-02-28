
float gray = 0.0;
int[] x = {50, 61, 83, 69, 71, 50, 29, 31, 17, 39};
int[] y = {18, 37, 43, 60, 82, 73, 82, 60, 43, 37};
//if not typing array numbers, must type (new)
int[] x2 = new int[5];
int[] y2 = new int[5];

int[] x3 = new int[5];
int[] y3 = new int[5];


void setup(){
  size(600,600);
   background(255);
   
   for(int i=0; i< 5; i++)
   {
    x2[i] = (int)random(1, 300);
    y2[i] = (int)random(20, 300);
   }
   
      for(int i=0; i< 5; i++)
   {
    x3[i] = (int)random(300, 600);
    y3[i] = (int)random(300, 600);
   }
}

void draw(){
  //gradient shift
  for(int i =0; i < 600; i++)
  {
    float percent = (float) i/400;
    //stroke(random(0,255), random(0,255), random(0,255));
    stroke(255 * percent); 
    line(0, i, 600, i);
  }

  //vert lines
  for(int i =0; i <600; i += 60)
  {
    stroke(255);
    stroke(random(0,255), random(0,255), random(0,255));
    line(0, i, 600, i);
  }
  
  //horiz lines
   for(int i =0; i <600; i += 60)
  {
    stroke(255);
    stroke(random(0,255), random(0,255), random(0,255));
    line(i, 0, i, 600);    
  }
  
 drawShape(0);
 drawShape(100);

}

void drawShape(float Xoffset){
    
  beginShape();
  for(int i = 0; i < x.length; i++)
  {
    vertex(x[i] + Xoffset, y[i]);
  }
  endShape();
  
  
  beginShape();
  for(int i =0; i < x2.length; i++)
  {
    vertex(x2[i] + Xoffset, y2[i]);
  }
  endShape();
  
  beginShape();
  for(int i =0; i < x3.length; i++)
  {
    vertex(x3[i], y3[i]);
  }
  endShape();
  
}


