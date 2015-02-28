
int r;
int numeroPelotas=100;

float[] x=new float[numeroPelotas];
float[] y=new float[numeroPelotas];
float[] vx=new float[numeroPelotas];
float[] vy=new float[numeroPelotas];


void setup()
{
    background(0);
    size(600,400);
   
   //desde aquí podemos ir eligiendo/modificando el radio y numero de pelotas
   r=20;
    
    //declaramos valores para x,y
    for(int i=0; i<numeroPelotas; i++){
        
        //establecemos donde queremos que empiecen las pelotas (o ramdom o un pto fijo)
        
        //pto fijo
        //x[i]=300;
        //y[i]=200;
        
        //random
        x[i]=int(random(0,width));
        y[i]=int(random(0,height));
        
        //Y aquí se establece la velocidad
        vx[i]=random(1,5);
        vy[i]=random(1,5);
    }
}

void draw()
{
    //ponemos background para que no se vea la pelota "repetida"
        background(1);
        
   
   //establecemos rebotes
   
       for(int i=0; i<numeroPelotas; i++){
           x[i] += vx[i];
           y[i] += vy[i];
           
             if((x[i]<r/2)||(x[i]>width-1-r/2)) {
             vx[i]=-vx[i];
             }
             
             if((y[i]<r/2)||(y[i]>height-1-r/2)) {
             vy[i]=-vy[i];
             }
    }
    
    for(int i=0; i<numeroPelotas; i++){
        ellipse(x[i],y[i],r,r);
        }

}
