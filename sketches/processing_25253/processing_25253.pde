
PVector vertices[][];
int pts,k=1;
float angle = 0;
float radius = 1;
void setup()
{
size(800,800);
background(0);

}

void draw()
{
  
  if(pts < 20)
 { float m = map(k, 1,1000,0,255);
  fill(255,255-k,k+255,50);
translate(width/2, height/2);
rotate(radians (k));
translate(width/5, height/5);
rotate(radians (k));
vertices = new PVector[2][pts];// intialization


    
     for(int i=0;i<2;i++)  
     {
    for(int j = 0; j <pts; j++)
    {
    vertices[i][j] = new PVector();
    
     vertices[i][j].x = cos(radians(angle)) * radius*k;
          vertices[i][j].y = sin(radians(angle)) * radius*k;
          angle += 360.0/pts;

    }
    }
  
beginShape();
         
     for(int i=0;i<2;i++)
     { 
    for(int j=0;j<pts;j++)
    
    {
      vertex( vertices[i][j].x ,vertices[i][j].y );
   
       }
     }
endShape();
k=k+10;
pts=pts+1;
delay(500);
 }

}

