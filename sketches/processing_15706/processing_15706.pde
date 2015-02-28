
float[] pointx = new float[50];
float[] pointy = new float[50];
boolean[] square = new boolean[50];
float[] scolor = new float[50];
int num = 0;
int num1 = 0;

float c;

float detdir = 0;
float detsquare = 0;
float randCount = 0;

boolean det = false;


void setup()
{
  size(640,480);
  
  pointx[0] = random(50);
  pointy[0] = random(200);
  pointy[pointy.length-1] = -1000;
  for(int a = 1; a < pointx.length-1; a++){pointx[a] = width+10;pointy[a] = 1000;square[a] = false;}
  
  
}

void draw()
{
  background(255);
  
  drawline();
  
  
  //draw "trunk"
  strokeWeight(5);
  line(0,height/2,mouseX,height/2);
  strokeWeight(3);
  

  
  
  
  if((mouseX > pointx[num]))
  {
    detdir = random(2);
    detsquare = random(3);
    
    pointx[num+1]=max(20+pointx[num],random(75)+pointx[num]);
    pointy[num] = max(random(200),random(100)+20);
    
    if(detdir < 1){pointy[num]= -pointy[num];};
    if(detsquare < 1){square[num] = true;scolor[num] = random(3);}else{square[num] = false;}
    num++;
  }
  
  if(num > 0){if(mouseX < pointx[num-1]){num = max(0,num-1);pointx[num+1] = width+10;}}
  
  

  drawsquare();
 
 

 println(detsquare+" "+square[0]+" "+square[1]);
}


void drawline()
{
  for(int a = 0; a < pointx.length-1; a++)
  {
    float b;
    float d;
    
 
    
    if(pointy[a]>0){b = min(pointy[a],pointy[a]*((mouseX-pointx[a])/(pointx[a+1]-pointx[a])));}
    else{b = max(pointy[a],pointy[a]*((mouseX-pointx[a])/(pointx[a+1]-pointx[a])));}
    
    
    
    d = max(pointy.length-a,c);
    
    
    if(pointy[a] > 0)
    {
      if((pointy[a+1] > 0)&&(a < pointy.length-2)){c=1;}
      else if((a < pointy.length-3)&&(pointy[a+2] > 0)){c=2;}
      else if((a < pointy.length-4)&&(pointy[a+3] > 0)){c=3;}
      else if((a < pointy.length-5)&&(pointy[a+4] > 0)){c=4;}
      else {c=0;}
    }
    if(pointy[a] < 0)
    {
      if((pointy[a+1] < 0)&&(a < pointy.length-2)){c=1;}
      else if((a < pointy.length-3)&&(pointy[a+2] < 0)){c=2;}
      else if((a < pointy.length-4)&&(pointy[a+3] < 0)){c=3;}
      else if((a < pointy.length-5)&&(pointy[a+4] < 0)){c=4;}
      else {c=0;}
    }
    

    if(mouseX > pointx[a])
    {
      
      if((square[a] == true)&&(num >= a+c))
      {
        noStroke();
        if(scolor[a] < 1){fill(200,0,0);}else if(scolor[a] > 2){fill(0,0,200);}else{fill(200,200,0);}
        rect(pointx[a],height/2,(pointx[a+int(c)]-pointx[a]),-(b*.8));
        stroke(0);
      }
      
      line(pointx[a],height/2,pointx[a],height/2-b);
    }
    
    fill(0);
    if((mousePressed == true)&&(a<pointy.length-2)){text(pointy[a],pointx[a],height/2-pointy[a]);}
    
  }
}

void drawsquare()
{

}


