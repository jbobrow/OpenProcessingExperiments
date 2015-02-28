
Mat[][] mat;
int N=29;
int M=30;
float theta=0,phi=0;
float Radius=180;
float angleincrement_theta= PI/N;
float angleincrement_phi= TWO_PI/M;
void setup()
{size(700,700,P3D);
 smooth();
 mat=new Mat[N+1][M];
 for(int i=0;i<=N;i++)
 {
   for(int j=0;j<=M-1;j++)
   {
     mat[i][j]=new Mat(Radius * sin(theta)*cos(phi),Radius*sin(theta)*sin(phi),Radius*cos(theta));
     phi+=angleincrement_phi;
   }
   theta+=angleincrement_theta;
 }
 println(mat[1][1].x);
}


void draw()
{
  background(130);
  translate(width/2,height/2);
  rotateY(map(mouseX,0,width,0,PI));
  rotateZ(map(mouseY,0,height,0,-PI));
  drawSphere();
}


void drawSphere()
{
  for (int m=0;m<=M-1;m++)
  {
    if(m==M-1)
    {  for(int n=0;n<=N-1;n++)
       {
           beginShape(QUAD_STRIP);
           vertex(mat[n][m].x,mat[n][m].y,mat[n][m].z);
           vertex(mat[n][0].x,mat[n][0].y,mat[n][0].z);
           vertex(mat[n+1][m].x,mat[n+1][m].y,mat[n+1][m].z);
           vertex(mat[n+1][0].x,mat[n+1][0].y,mat[n+1][0].z);
           endShape();
       }
    }
    else
    {
       for(int n=0;n<=N-1;n++)
       {
           beginShape(QUAD_STRIP);
           vertex(mat[n][m].x,mat[n][m].y,mat[n][m].z);
           vertex(mat[n][m+1].x,mat[n][m+1].y,mat[n][m+1].z);
           vertex(mat[n+1][m].x,mat[n+1][m].y,mat[n+1][m].z);
           vertex(mat[n+1][m+1].x,mat[n+1][m+1].y,mat[n+1][m+1].z);
           endShape();
       }
    }
    
  }
}
public class Mat
{
  float x,y,z;
  Mat(float a,float b, float c)
  {x=a;
  y=b;
  z=c;
  }
  
}


