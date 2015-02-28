
int side = 50;
int cellSize;

float [][] a, newa, b, newb, c, newc;

int p = 0, q = 1;

void setup()
{   size(500, 500);
    a = new float[side][side];
    b = new float[side][side]; 
    c = new float[side][side]; 
    
    for(int i = 0; i<a.length; i++)
    {   for(int j = 0; j<a[i].length; j++)
        {   a[i][j] = 0;
            if(random(1)<0.33) a[i][j] = 1; //random placement in beginning of a
            b[i][j] = 0;
            if(random(1)<0.33) b[i][j] = 1; //random placement of b
            c[i][j] = 0;
            if(random(1)<0.33) c[i][j] = 1;
            
            if(a[i][j]+b[i][j]+c[i][j] == 3) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(a[i][j]==0)) 
            {   c[i][j] = 1;
                b[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(b[i][j]==0)) 
            {   a[i][j] = 1;
                c[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(c[i][j]==0)) 
            {   a[i][j] = 0;
                b[i][j] = 1;
            } 
            if(a[i][j]+b[i][j]+c[i][j] == 0) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }
        }
    } 
    cellSize = width/side;
    frameRate(5);
    noStroke();
}

void draw()
{
    background(0);
    updatea();
    updateb();
    updatec();
    iterate();
    drawCells();
}
  
void drawCells()
{   for(int i = 0; i<a.length; i++)
    {   for(int j = 0; j<a[i].length; j++)
        {   fill(0,0,a[i][j]*255, 100);
            rect(i*cellSize, j*cellSize, cellSize, cellSize);
           
            fill(0,b[i][j]*255,0, 100);
            rect(i*cellSize, j*cellSize, cellSize, cellSize);
            
            fill(c[i][j]*255,0,0, 100);
            rect(i*cellSize, j*cellSize, cellSize, cellSize);
        }
    }
}

void updatea()
{
    newa = new float[side][side];
    for(int i = 0; i<a.length; i++)
    {  
        for(int j = 0; j<a[i].length; j++)
        {
            float neighbours = 0;       
            if(i>0) 
            {
                neighbours +=  a[i-1][j] - b[i-1][j] ;
                if(j>0) neighbours += a[i-1][j-1] - b[i-1][j-1];
                if(j<a[i].length-1) neighbours += a[i-1][j+1]- b[i-1][j+1];
            }  
            if(i<a.length-1)
            {
              neighbours += a[i+1][j];
              if(j>0) neighbours += a[i+1][j-1];
              if(j<a[i].length-1) neighbours += a[i+1][j+1];
            }
            if(j>0) neighbours += a[i][j-1];
            if(j<a[i].length-1) neighbours += a[i][j+1];
            
            newa[i][j]=1;
            if(neighbours<=1) newa[i][j] = 0;
            if(neighbours==2) newa[i][j] = 1;
            //if(neighbours>=3) newa[i][j] = a[i][j];
//            if(neighbours>3) newa[i][j] = a[i][j];        
            
            if(a[i][j]+b[i][j]+c[i][j] == 3) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(a[i][j]==0)) 
            {   c[i][j] = 1;
                b[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(b[i][j]==0)) 
            {   a[i][j] = 1;
                c[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(c[i][j]==0)) 
            {   a[i][j] = 0;
                b[i][j] = 1;
            } 
            if(a[i][j]+b[i][j]+c[i][j] == 0) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }
        }
    }
}

void updateb() //predator movements
{
    newb = new float[side][side];
    for(int i = 0; i<b.length; i++)
    {  
        for(int j = 0; j<b[i].length; j++)
        {
            float neighbours = 0;       
            if(i>0) 
            {
                neighbours +=  b[i-1][j] - c[i-1][j] ;
                if(j>0) neighbours += b[i-1][j-1] - c[i-1][j-1];
                if(j<b[i].length-1) neighbours += b[i-1][j+1]- c[i-1][j+1];
            }  
            if(i<b.length-1)
            {
              neighbours += b[i+1][j];
              if(j>0) neighbours += b[i+1][j-1];
              if(j<b[i].length-1) neighbours += b[i+1][j+1];
            }
            if(j>0) neighbours += b[i][j-1];
            if(j<b[i].length-1) neighbours += b[i][j+1];
 
            newb[i][j]=1;
            if(neighbours<=1) newb[i][j] = 0;
            if(neighbours==2) newb[i][j] = 1;
            //if(neighbours>=3) newb[i][j] = b[i][j];
//            if(neighbours>3) newb[i][j] = b[i][j];  
            
            if(a[i][j]+b[i][j]+c[i][j] == 3) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(a[i][j]==0)) 
            {   c[i][j] = 1;
                b[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(b[i][j]==0)) 
            {   a[i][j] = 1;
                c[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(c[i][j]==0)) 
            {   a[i][j] = 0;
                b[i][j] = 1;
            } 
            if(a[i][j]+b[i][j]+c[i][j] == 0) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }      
        }
    }
}

void updatec() // c movements
{
    newc = new float[side][side];
    for(int i = 0; i<c.length; i++)
    {  
        for(int j = 0; j<c[i].length; j++)
        {
            float neighbours = 0;       
            if(i>0) 
            {
                neighbours += c[i-1][j]  - a[i-1][j];
                if(j>0) neighbours += c[i-1][j-1] - a[i-1][j];
                if(j<c[i].length-1) neighbours += c[i-1][j+1]- a[i-1][j];
            }  
            if(i<c.length-1)
            {
              neighbours += c[i+1][j];
              if(j>0) neighbours += c[i+1][j-1];
              if(j<c[i].length-1) neighbours += c[i+1][j+1];
            }
            if(j>0) neighbours += c[i][j-1];
            if(j<c[i].length-1) neighbours += c[i][j+1];
            
            newc[i][j]=1;
            if(neighbours<=1) newc[i][j] = 0;
            if(neighbours==2) newc[i][j] = 1;
            //if(neighbours>=3) newc[i][j] = c[i][j];
                          
            if(a[i][j]+b[i][j]+c[i][j] == 3) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(a[i][j]==0)) 
            {   c[i][j] = 1;
                b[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(b[i][j]==0)) 
            {   a[i][j] = 1;
                c[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(c[i][j]==0)) 
            {   a[i][j] = 0;
                b[i][j] = 1;
            } 
            if(a[i][j]+b[i][j]+c[i][j] == 0) 
            {   a[i][j] = 0;
                b[i][j] = 0;
                c[i][j] = 0; 
            }   
        }
    }
}

void iterate()
{  
    for(int i = 0; i<a.length; i++)
    {  
        for(int j = 0; j<a[i].length; j++)
        {
            a[i][j] = newa[i][j];
            b[i][j] = newb[i][j];
            c[i][j] = newc[i][j];
            
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(a[i][j]==0)) 
            {   c[i][j] = 1;
                b[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(b[i][j]==0)) 
            {   a[i][j] = 1;
                c[i][j] = 0;
            }
            if((a[i][j]+b[i][j]+c[i][j] == 2)&&(c[i][j]==0)) 
            {   a[i][j] = 0;
                b[i][j] = 1;
            } 
        }
    }
}
