
int numeroPelotas=3000;

float[] x=new float[numeroPelotas];
float[] y=new float[numeroPelotas];
float[] vx=new float[numeroPelotas];
float[] vy=new float[numeroPelotas];

float[] r=new float[numeroPelotas];

float[] colorpelotasX=new float[numeroPelotas];
float[] colorpelotasY=new float[numeroPelotas];
float[] colorpelotasZ=new float[numeroPelotas];

void setup()
{
    background(200);
    size(600,400);
   
    
    //declaramos valores para x,y
    for(int i=0; i<numeroPelotas; i++){
      
        //Y aquÃ­ se establece la velocidad
        vx[i]=random(1,5);
        vy[i]=random(1,5);
       
        //hacemos un random para que cada r sea diferente
        r[i]=random(10,30);
        
        //hacemos randoms para que cada color sea diferente = se puede modificar su valor para lograr tonalidades o gamas cromÃ¡ticas
        colorpelotasX[i]=random(50);
        colorpelotasY[i]=random(220);
        colorpelotasZ[i]=random(250);
      
        //establecemos donde queremos que empiecen las pelotas (o ramdom o un pto fijo)
        
        //pto fijo
        //x[i]=300;
        //y[i]=200;
        
        //random 
        x[i]=int(random(0,width));
        y[i]=int(random(0,height));
        
    }
}

void draw()
{
    //ponemos background para que no se vea la pelota "repetida"
        fill(200,200,200,50);
        rect(0,0,width,height);
        
   
   //establecemos rebotes
   
       for(int i=0; i<numeroPelotas; i++){
           x[i] += vx[i];
           y[i] += vy[i];
           
             if((x[i]<r[i]/2)||(x[i]>width-1-r[i]/2)) {
             vx[i]=-vx[i];
             }
             
             if((y[i]<r[i]/2)||(y[i]>height-1-r[i]/2)) {
             vy[i]=-vy[i];
             }
    }
    
        
    for(int i=0; i<numeroPelotas; i++){
    
    // el fill se ha de poner siempre antes de dibujar el objeto!!!!
        noStroke();
        fill(colorpelotasX[i],colorpelotasY[i],colorpelotasZ[i],100);
      
        ellipse(x[i],y[i],r[i],r[i]);
        
        }
   
}
