
int vx,vy,x,y,numdibuix;
int estado=1;
void setup() {
  size(500,500);
  smooth();
  rectMode(CORNER);
   noStroke();
  numdibuix=10;
  vx=width/numdibuix;
  vy=height/numdibuix;
}
  void draw()
  {
     background(#7DA5CB);
     if (estado ==1)
     {
      for(int i=0; i<numdibuix; i++)
        {
         for(int j=0; j<numdibuix; j++)
          {
       
        
         fill (#2390FA);        
        rect(i*vx, j*vy, vx, vy, vx*0.1, vx*0.1, vx*0.4, vx*0.4);
        fill (#2083E3);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx, vx*0.1, vx*0.1, vx*0.5, vx*0.5);
         fill(#1C74C9);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/8), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
        fill(#1661AA);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/5), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
         fill(#105190);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/3), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
       fill(#09345D);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/2.5), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
          }
        }
     }
  
  
   

        else 
        {
          background(#FCBD5E);
          for (int j=0; (j<numdibuix); j++)
          {
            for (int i=0; i<=j; i++)
            {
              
              noStroke();
        fill(#FFAB2C);        
        rect(i*vx, j*vy, vx, vy, vx*0.1, vx*0.1, vx*0.4, vx*0.4);
        fill(#EDA02B);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx, vx*0.1, vx*0.1, vx*0.5, vx*0.5);
         fill(#C6831C);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/8), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
        fill(#A56C17);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/5), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
         fill(#865813);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/3), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
       fill(#67430E);
        rect(i*vx+vx*0.08, j*vy, vx*0.85, vx-(vx/2.5), vx*0.1, vx*0.1, vx*0.5, vx*0.5);
            }
          }
        }
  }
        
        void keyPressed ()
        {
          if (key == 'q')
          estado =1;
        
          else
          {
          estado=2;
          }
          }
          
 
