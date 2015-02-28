


// v.02 - Fem circular la bola per la trajectoria


float b1X, b1Y; 
float b2X, b2Y;
float b3X, b3Y;
float b4X, b4Y;
float b5X, b5Y;
float b6X, b6Y;
float b7X, b7Y;
float b8X, b8Y;
float b9X, b9Y;
float b10X, b10Y;
float b11X, b11Y;   
float b12X, b12Y;
float b13X, b13Y;
float b14X, b14Y;
float b15X, b15Y;
float b16X, b16Y;
float b17X, b17Y;
float b18X, b18Y;
float b19X, b19Y;
float b20X, b20Y;
float b21X, b21Y;
float b22X, b22Y;
 
float[] t1X = new float[4]; // punts de control de la trajectoria
                  // de la primera bola - coordenada x.
float[] t1Y = new float[4]; // punts de control de la trajectoria
                  // de la primera bola - coordenada y.
                  
float[] t2X = new float[4];
float[] t2Y = new float[4];

float[] t3X = new float[5];
float[] t3Y = new float[5];

float[] t4X = new float[5]; 
float[] t4Y = new float[5];

float[] t5X = new float[6];
float[] t5Y = new float[6];

float[] t6X = new float[6];
float[] t6Y = new float[6];

float[] t7X = new float[7];
float[] t7Y = new float[7];

float[] t8X = new float[7];
float[] t8Y = new float[7];

float[] t9X = new float[8];
float[] t9Y = new float[8];

float[] t10X = new float[8];
float[] t10Y = new float[8];

float[] t11X = new float[4]; 
float[] t11Y = new float[4];
                  
float[] t12X = new float[4];
float[] t12Y = new float[4];

float[] t13X = new float[4];
float[] t13Y = new float[4];

float[] t14X = new float[4]; 
float[] t14Y = new float[4];

float[] t15X = new float[4];
float[] t15Y = new float[4];

float[] t16X = new float[4];
float[] t16Y = new float[4];

float[] t17X = new float[4];
float[] t17Y = new float[4];

float[] t18X = new float[4];
float[] t18Y = new float[4];

float[] t19X = new float[4];
float[] t19Y = new float[4];

float[] t20X = new float[4];
float[] t20Y = new float[4];

float[] t21X = new float[4];
float[] t21Y = new float[4];

float[] t22X = new float[4];
float[] t22Y = new float[4];
                  
int target1;  // target1 pren valors 0,1,2 i 3.
  // p. ex. target1 == 2 significa 'la bola va cap al punt de control 2 de la trajectoria'

color c1;   // color de la primera bola
// el radi de totes les boles = 40

float step=0.01;

PFont f;


void setup()
{
  size(600,600);
  background(245,255,250);
 // f=loadFont("Broadway-48.vlw");  // nomes ho carreguem un cop
 f=loadFont("UniversLTStd-Light-48.vlw");
  frameRate(50);
  iniTraject();
  iniBoles();
  
}

void draw ()
{
  
 //background(245,255,250);

background(0);  //  1er -  background del mateix color de les lletres

 // 2on - dibuixem les boles
 
  mouBoles();
 
 //  3er - les lletres


fill(0,0,0);
// PFont f=loadFont("UniversLTStd-Light-48.vlw");   // mogut a setup()
  textFont (f,100);
  text("E",76, 200);
  text("T",168,200);
  text("S",260,200);
  text("A",352,200);
  text("V",444,200);
  
  
//  mouBoles();  mogut a dalt
 


    
}


void iniTraject()
{
  t1X[0] = 200;  // primer punt de control
  t1Y[0] = 40;
  t1X[1] = width - 40;  // segon punt de control
  t1Y[1] = 120;
  t1X[2] = 200;  // tercer punt de control
  t1Y[2] = height - 40;
  t1X[3] = 116;  // quart punt de control
  t1Y[3] = 200;
  
  t2X[0] = 500;  // primer punt de control
  t2Y[0] = 40;
  t2X[1] = width - 40;  // segon punt de control
  t2Y[1] = 500;
  t2X[2] = 80;  // tercer punt de control
  t2Y[2] = height - 40;
  t2X[3] = 116;  // quart punt de control
  t2Y[3] = 200;
  
  t3X[0] = 400;  
  t3Y[0] = 40;
  t3X[1] = 560;
  t3Y[1] = 200;
  t3X[2] = 350;  
  t3Y[2] = 560;
  t3X[3] = 40;  
  t3Y[3] = 400;
  t3X[4] = 208;
  t3Y[4] = 200;
 
  t4X[0] = 280;
  t4Y[0] = 560;
  t4X[1] = 560;
  t4Y[1] = 380;
  t4X[2] = 200;
  t4Y[2] = 40;
  t4X[3] = 40;
  t4Y[3] = 130;
  t4X[4] = 208;
  t4Y[4] = 200;
  
  t5X[0] = 40;
  t5Y[0] = 550;
  t5X[1] = 560;
  t5Y[1] = 250;
  t5X[2] = 310;
  t5Y[2] = 40;
  t5X[3] = 170;
  t5Y[3] = 560; 
  t5X[4] = 560;
  t5Y[4] = 350;
  t5X[5] = 300;
  t5Y[5] = 200;
  
  t6X[0] = 560;
  t6Y[0] = 560;
  t6X[1] = 40;
  t6Y[1] = 110;
  t6X[2] = 215;
  t6Y[2] = 40;
  t6X[3] = 560;
  t6Y[3] = 200;
  t6X[4] = 280;
  t6Y[4] = 560;
  t6X[5] = 300;
  t6Y[5] = 200;
  
  t7X[0] = 560;
  t7Y[0] = 210;
  t7X[1] = 300;
  t7Y[1] = 560;
  t7X[2] = 40;
  t7Y[2] = 220;
  t7X[3] = 100;
  t7Y[3] = 40;
  t7X[4] = 560;
  t7Y[4] = 380;
  t7X[5] = 110;
  t7Y[5] = 560;
  t7X[6] = 392;
  t7Y[6] = 200;
  
  t8X[0] = 210;
  t8Y[0] = 40;
  t8X[1] = 40;
  t8Y[1] = 350;
  t8X[2] = 270;
  t8Y[2] = 560;
  t8X[3] = 560;
  t8Y[3] = 440;
  t8X[4] = 480;
  t8Y[4] = 40;
  t8X[5] = 360;
  t8Y[5] = 560;
  t8X[6] = 392;
  t8Y[6] = 200;
  
  t9X[0] = 200;
  t9Y[0] = 40;
  t9X[1] = 560;  
  t9Y[1] = 80;
  t9X[2] = 40; 
  t9Y[2] = 210;
  t9X[3] = 560; 
  t9Y[3] = 300;
  t9X[4] = 40;
  t9Y[4] = 410;
  t9X[5] = 560;
  t9Y[5] = 500;
  t9X[6] = 150;
  t9Y[6] = 500;
  t9X[7] = 484;
  t9Y[7] = 200;
  
  t10X[0] = 560;
  t10Y[0] = 120;
  t10X[1] = 500;
  t10Y[1] = 40;
  t10X[2] = 40;
  t10Y[2] = 370;
  t10X[3] = 410;
  t10Y[3] = 560;
  t10X[4] = 560;
  t10Y[4] = 290;
  t10X[5] = 40;
  t10Y[5] = 290;
  t10X[6] = 170;
  t10Y[6] = 40;
  t10X[7] = 484;
  t10Y[7] = 200;
  
  t11X[0] = 40;
  t11Y[0] = 110;
  t11X[1] = 560;
  t11Y[1] = 170;
  t11X[2] = 500;
  t11Y[2] = 560;
  t11X[3] = 40;
  t11Y[3] = 300;
  
  t12X[0] = 40;
  t12Y[0] = 300;
  t12X[1] = 260;
  t12Y[1] = 40;
  t12X[2] = 360;
  t12Y[2] = 560;
  t12X[3] = 560;
  t12Y[3] = 370;
  
  t13X[0] = 40;
  t13Y[0] = 90;
  t13X[1] = 250;
  t13Y[1] = 300;
  t13X[2] = 400;
  t13Y[2] = 90;
  t13X[3] = 560;
  t13Y[3] = 300;
  
  t14X[0] = 40;
  t14Y[0] = 200;
  t14X[1] = 560;
  t14Y[1] = 250;
  t14X[2] = 40;
  t14Y[2] = 400;
  t14X[3] = 560;
  t14Y[3] = 560;
  
  t15X[0] = 560;
  t15Y[0] = 100;
  t15X[1] = 300;
  t15Y[1] = 370;
  t15X[2] = 100;
  t15Y[2] = 100;
  t15X[3] = 500;
  t15Y[3] = 200; 
  
  t16X[0] = 40;
  t16Y[0] = 560;
  t16X[1] = 400;
  t16Y[1] = 40;
  t16X[2] = 560;
  t16Y[2] = 560;
  t16X[3] = 300;
  t16Y[3] = 200;
  
  t17X[0] = 40;
  t17Y[0] = 300;
  t17X[1] = 500;
  t17Y[1] = 500;
  t17X[2] = 470;
  t17Y[2] = 200;
  t17X[3] = 100;
  t17Y[3] = 70;
  
  t18X[0] = 560;
  t18Y[0] = 40;
  t18X[1] = 100;
  t18Y[1] = 200;
  t18X[2] = 280;
  t18Y[2] = 360;
  t18X[3] = 100;
  t18Y[3] = 500;
  
  t19X[0] = 250;
  t19Y[0] = 40;
  t19X[1] = 40;
  t19Y[1] = 380;
  t19X[2] = 390;
  t19Y[2] = 560;
  t19X[3] = 560; 
  t19Y[3] = 300;
  
  t20X[0] = 200;
  t20Y[0] = 300;
  t20X[1] = 400;
  t20Y[1] = 110;
  t20X[2] = 560;
  t20Y[2] = 400;
  t20X[3] = 300;
  t20Y[3] = 560;
  
  t21X[0] = 560; 
  t21Y[0] = 560;
  t21X[1] = 40;
  t21Y[1] = 190;
  t21X[2] = 560;
  t21Y[2] = 300;
  t21X[3] = 40;
  t21Y[3] = 560;
  
  t22X[0] = 100;
  t22Y[0] = 300;
  t22X[1] = 250;
  t22Y[1] = 560;
  t22X[2] = 250;
  t22Y[2] = 300;
  t22X[3] = 560;
  t22Y[3] = 300;
  
  
  



  stroke(0);   // dibuixem la trajectoria
  for(int i=0; i<3; i++)
  {
    line(t1X[i],t1Y[i],t1X[i+1],t1Y[i+1]); 
  }
  
  line(t1X[3],t1Y[3],t1X[0],t1Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t2X[i],t2Y[i],t2X[i+1],t2Y[i+1]); 
  }
  
  line(t2X[3],t2Y[3],t2X[0],t2Y[0]);
 
  for(int i=0; i<3; i++)
  {
    line(t3X[i],t3Y[i],t3X[i+1],t3Y[i+1]); 
  }
  
  line(t3X[4],t3Y[4],t3X[0],t3Y[0]); 
  
   for(int i=0; i<3; i++)
  {
    line(t4X[i],t4Y[i],t4X[i+1],t4Y[i+1]); 
  }
  
  line(t4X[4],t4Y[4],t4X[0],t4Y[0]);
  
   for(int i=0; i<3; i++)
  {
    line(t5X[i],t5Y[i],t5X[i+1],t5Y[i+1]); 
  }
  
  line(t5X[5],t5Y[5],t5X[0],t5Y[0]);
  
   for(int i=0; i<3; i++)
  {
    line(t2X[i],t2Y[i],t2X[i+1],t2Y[i+1]); 
  }
  
  line(t6X[5],t6Y[5],t6X[0],t6Y[0]);
  
   for(int i=0; i<3; i++)
  {
    line(t7X[i],t7Y[i],t7X[i+1],t7Y[i+1]); 
  }
  
  line(t7X[6],t7Y[6],t7X[0],t7Y[0]);
  
   for(int i=0; i<3; i++)
  {
    line(t8X[i],t8Y[i],t8X[i+1],t8Y[i+1]); 
  }
  
  line(t8X[6],t8Y[6],t8X[0],t8Y[0]);
  
   for(int i=0; i<3; i++)
  {
    line(t9X[i],t9Y[i],t9X[i+1],t9Y[i+1]); 
  }
  
  line(t9X[7],t9Y[7],t9X[0],t9Y[0]);
  
   for(int i=0; i<3; i++)
  {
    line(t10X[i],t10Y[i],t10X[i+1],t10Y[i+1]); 
  }
  
  line(t10X[7],t10Y[7],t10X[0],t10Y[0]);
  
  for(int i=0; i<3; i++)
  {
    line(t11X[i],t11Y[i],t11X[i+1],t11Y[i+1]); 
  }
  
  line(t11X[3],t11Y[3],t11X[0],t11Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t12X[i],t12Y[i],t12X[i+1],t12Y[i+1]); 
  }
  
  line(t12X[3],t12Y[3],t12X[0],t12Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t13X[i],t13Y[i],t13X[i+1],t13Y[i+1]); 
  }
  
  line(t13X[3],t13Y[3],t13X[0],t13Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t14X[i],t14Y[i],t14X[i+1],t14Y[i+1]); 
  }
  
  line(t14X[3],t14Y[3],t14X[0],t14Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t15X[i],t15Y[i],t15X[i+1],t15Y[i+1]); 
  }
  
  line(t15X[3],t15Y[3],t15X[0],t15Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t16X[i],t16Y[i],t16X[i+1],t16Y[i+1]); 
  }
  
  line(t16X[3],t16Y[3],t16X[0],t16Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t17X[i],t17Y[i],t17X[i+1],t17Y[i+1]); 
  }
  
  line(t17X[3],t17Y[3],t17X[0],t17Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t18X[i],t18Y[i],t18X[i+1],t18Y[i+1]); 
  }
  
  line(t18X[3],t18Y[3],t18X[0],t18Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t19X[i],t19Y[i],t19X[i+1],t19Y[i+1]); 
  }
  
  line(t19X[3],t19Y[3],t19X[0],t19Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t20X[i],t20Y[i],t20X[i+1],t20Y[i+1]); 
  }
  
  line(t20X[3],t20Y[3],t20X[0],t20Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t21X[i],t21Y[i],t21X[i+1],t21Y[i+1]); 
  }
  
  line(t21X[3],t21Y[3],t21X[0],t21Y[0]); 
  
  for(int i=0; i<3; i++)
  {
    line(t22X[i],t22Y[i],t22X[i+1],t22Y[i+1]); 
  }
  
  line(t22X[3],t22Y[3],t22X[0],t22Y[0]); 
}

void iniBoles()
{
 
 b1X=t1X[0];  // posicio inicial - coincideix amb
 b1Y=t1Y[0];  // el primer punt de control (es pot canviar) 
 target1=1;  // avança cap al seguent punt de control
 
 b2X=t2X[0]; 
 b2Y=t2Y[0];   
 target1=1;

 b3X=t3X[0]; 
 b3Y=t3Y[0];   
 target1=1; 
 
 b4X=t4X[0]; 
 b4Y=t4Y[0];   
 target1=1;
 
 b5X=t5X[0]; 
 b5Y=t5Y[0];   
 target1=1;
 
 b6X=t6X[0]; 
 b6Y=t6Y[0];   
 target1=1;
 
 b7X=t7X[0]; 
 b7Y=t7Y[0];   
 target1=1;
 
 b8X=t8X[0]; 
 b8Y=t8Y[0];   
 target1=1;
 
 b9X=t9X[0]; 
 b9Y=t9Y[0];   
 target1=1;
 
 b10X=t10X[0]; 
 b10Y=t10Y[0];   
 target1=1;
 
 b11X=t11X[0];  
 b11Y=t11Y[0];
 target1=1;
 
 b12X=t12X[0]; 
 b12Y=t12Y[0];   
 target1=1;

 b13X=t13X[0]; 
 b13Y=t13Y[0];   
 target1=1; 
 
 b14X=t14X[0]; 
 b14Y=t14Y[0];   
 target1=1;
 
 b15X=t15X[0]; 
 b15Y=t15Y[0];   
 target1=1;
 
 b16X=t16X[0]; 
 b16Y=t16Y[0];   
 target1=1;
 
 b17X=t17X[0]; 
 b17Y=t17Y[0];   
 target1=1;
 
 b18X=t18X[0]; 
 b18Y=t18Y[0];   
 target1=1;
 
 b19X=t19X[0]; 
 b19Y=t19Y[0];   
 target1=1;
 
 b20X=t20X[0]; 
 b20Y=t20Y[0];   
 target1=1;
 
 b21X=t21X[0]; 
 b21Y=t21Y[0];   
 target1=1;
 
 b22X=t22X[0]; 
 b22Y=t22Y[0];   
 target1=1;
}

void mouBoles()
{
 float stepX, stepY; 
 int i,j;
 fill(205,92,92);  // color de la bola
 stroke(205,92,92);
 ellipse(b1X,b1Y,100,100);  // dibuixa la bola
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t1X[i]-t1X[j]);  // calcula el vector moviment
  stepY = step*(t1Y[i]-t1Y[j]);
  
  b1X = b1X + stepX;     //  mou la bola
  b1Y = b1Y + stepY;
  
  if( b1X > width-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b1X=b1X-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b1X < 40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b1X=b1X+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b1Y > height-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b1Y=b1Y-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
   
   if( b1Y < 40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
   
  {
    b1Y=b1Y+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  
  
  
  
  
  
  
  
  
  

 fill(50,205,50);  // lime green
 stroke(50,205,50);
 ellipse(b2X,b2Y,100,100);  
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t2X[i]-t2X[j]);  // calcula el vector moviment
  stepY = step*(t2Y[i]-t2Y[j]);
  
  b2X = b2X + stepX;     //  mou la bola
  b2Y = b2Y + stepY;
  
  if( b2X > width-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b2X=b2X-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b2X < 40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b2X=b2X+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b2Y > height-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b2Y=b2Y-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
   
   if( b2X < 40) 
   // ( b2Y < 40)  | b2Y > height-40 | b2Y < 40)
  {
    
    b2Y=b2Y+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  
  
  
  
  
 fill(188,143,143);  // lila apagat
 stroke(188,143,143);
 ellipse(b3X,b3Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t3X[i]-t3X[j]);  
  stepY = step*(t3Y[i]-t3Y[j]);
  
  b3X = b3X + stepX;     
  b3Y = b3Y + stepY;
  
  if( b3X > width-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b3X=b3X-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b3X < 40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b3X=b3X+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b3Y > height-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b3Y=b3Y-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
   
   if( b3X < 40)
   // ( b2Y < 40)  | b2Y > height-40 | b2Y < 40)
  {
    
    b3Y=b3Y+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b3Y > height-40) 
   // ( b2Y < 40)  | b2Y > height-40 | b2Y < 40)
  {
    
    b3Y=b3Y-10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  fill(218,165,32);  // dorado
 stroke(218,165,32);
 ellipse(b4X,b4Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t4X[i]-t4X[j]);  
  stepY = step*(t4Y[i]-t4Y[j]);
  
  b4X = b4X + stepX;     
  b4Y = b4Y + stepY;
  
  if( b4X > width-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b4X=b4X-10;
    target1 = (target1+1)%4;  
    
  } 
  
  if( b4X < 40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b4X=b4X+10;
    target1 = (target1+1)%4;  
    
  } 
  
  if( b4Y > height-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b4Y=b4Y-10;
    target1 = (target1+1)%4;  
    
  } 
   
   if( b4X < 40)
   // ( b2Y < 40)  | b2Y > height-40 | b2Y < 40)
  {
    
    b4Y=b4Y+10;
    target1 = (target1+1)%4;  
    
  } 
  
  if( b4Y > height-40) 
   // ( b2Y < 40)  | b2Y > height-40 | b2Y < 40)
  {
    
    b4Y=b4Y-10;
    target1 = (target1+1)%4;  
    
  } 
  
  
  
  
  
 fill(210,105,30);  // chocolate
 stroke(210,105,30);
 ellipse(b5X,b5Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t5X[i]-t5X[j]);  
  stepY = step*(t5Y[i]-t5Y[j]);
  
  b5X = b5X + stepX;     
  b5Y = b5Y + stepY;
  
  if( b5X > width-40)
  {
    b5X=b5X-10;
    target1 = (target1+1)%4;  
  } 
  
  if( b5X < 40)
  {
    b5X=b5X+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b5Y > height-40) 
  {
    b5Y=b5Y-10;
    target1 = (target1+1)%4;  
  } 
   
   if( b5X < 40)
  {
    b5Y=b5Y+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b5Y > height-40) 
  {    
    b5Y=b5Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b5X < 40)
  {
    b5Y=b5Y+10;
    target1 = (target1+1)%4;  
  } 
  
  
  
  
  
  
   fill(0,206,209);  // dark torquoise
 stroke(0,206,209);
 ellipse(b6X,b6Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t6X[i]-t6X[j]);  
  stepY = step*(t6Y[i]-t6Y[j]);
  
  b6X = b6X + stepX;     
  b6Y = b6Y + stepY;
  
  if( b6X > width-40)
  {
    b6X=b6X-10;
    target1 = (target1+1)%4;  
  } 
  
  if( b6X < 40)
  {
    b6X=b6X+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b6Y > height-40) 
  {
    b6Y=b6Y-10;
    target1 = (target1+1)%4;  
  } 
   
   if( b6X < 40)
  {
    b6Y=b6Y+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b6Y > height-40) 
  {    
    b6Y=b6Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b6X < 40)
  {
    b6Y=b6Y+10;
    target1 = (target1+1)%4;  
  } 
  
  
  
  
  
  
  
  
 fill(85,107,47);  // light olive green
 stroke(85,107,47);
 ellipse(b7X,b7Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t7X[i]-t7X[j]);  
  stepY = step*(t7Y[i]-t7Y[j]);
  
  b7X = b7X + stepX;     
  b7Y = b7Y + stepY;
  
  if( b7X > width-40)
  {
    b7X=b7X-10;
    target1 = (target1+1)%4;  
  } 
  
  if( b7X < 40)
  {
    b7X=b7X+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b7Y > height-40) 
  {
    b7Y=b7Y-10;
    target1 = (target1+1)%4;  
  } 
   
   if( b7X < 40)
  {
    b7Y=b7Y+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b7Y > height-40) 
  {    
    b7Y=b7Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b7X < 40)
  {
    b7Y=b7Y+10;
    target1 = (target1+1)%4;  
  } 
  if( b7Y > height-40) 
  {    
    b7Y=b7Y-10;
    target1 = (target1+1)%4;  
  } 
  
  
  
  
  
  
  
  fill(255,255,0);  // yellow
 stroke(255,255,0);
 ellipse(b8X,b8Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t8X[i]-t8X[j]);  
  stepY = step*(t8Y[i]-t8Y[j]);
  
  b8X = b8X + stepX;     
  b8Y = b8Y + stepY;
  
  if( b8X > width-40)
  {
    b8X=b8X-10;
    target1 = (target1+1)%4;  
  } 
  
  if( b8X < 40)
  {
    b8X=b8X+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b8Y > height-40) 
  {
    b8Y=b8Y-10;
    target1 = (target1+1)%4;  
  } 
   
   if( b8X < 40)
  {
    b8Y=b8Y+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b8Y > height-40) 
  {    
    b8Y=b8Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b8X < 40)
  {
    b8Y=b8Y+10;
    target1 = (target1+1)%4;  
  } 
  if( b8Y > height-40) 
  {    
    b8Y=b8Y-10;
    target1 = (target1+1)%4;  
  } 
  
  
  
  
  
  
  
  
  
    fill(255,140,0);  // dark orange
 stroke(255,140,0);
 ellipse(b9X,b9Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t9X[i]-t9X[j]);  
  stepY = step*(t9Y[i]-t9Y[j]);
  
  b9X = b9X + stepX;     
  b9Y = b9Y + stepY;
  
  if( b9X > width-40)
  {
    b9X=b9X-10;
    target1 = (target1+1)%4;  
  } 
  
  if( b9X < 40)
  {
    b9X=b9X+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b9Y > height-40) 
  {
    b9Y=b9Y-10;
    target1 = (target1+1)%4;  
  } 
   
   if( b9X < 40)
  {
    b9Y=b9Y+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b9Y > height-40) 
  {    
    b9Y=b9Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b9X < 40)
  {
    b9Y=b9Y+10;
    target1 = (target1+1)%4;  
  } 
  if( b9Y > height-40) 
  {    
    b9Y=b9Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b9X < 40)
  {
    b9Y=b9Y+10;
    target1 = (target1+1)%4;  
  } 
  
  
  
  
  
  
  
  
      fill(139,69,19);  // sadle brown
 stroke(139,69,19);
 ellipse(b10X,b10Y,100,100); 
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t10X[i]-t10X[j]);  
  stepY = step*(t10Y[i]-t10Y[j]);
  
  b10X = b10X + stepX;     
  b10Y = b10Y + stepY;
  
  if( b10X > width-40)
  {
    b10X=b10X-10;
    target1 = (target1+1)%4;  
  } 
  
  if( b10X < 40)
  {
    b10X=b10X+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b10Y > height-40) 
  {
    b10Y=b10Y-10;
    target1 = (target1+1)%4;  
  } 
   
   if( b10X < 40)
  {
    b10Y=b10Y+10;
    target1 = (target1+1)%4;  
  } 
  
  if( b10Y > height-40) 
  {    
    b10Y=b10Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b10X < 40)
  {
    b10Y=b10Y+10;
    target1 = (target1+1)%4;  
  } 
  if( b10Y > height-40) 
  {    
    b10Y=b10Y-10;
    target1 = (target1+1)%4;  
  } 
   if( b10X < 40)
  {
    b10Y=b10Y+10;
    target1 = (target1+1)%4;  
  } 
  
  
  
  
  
  
  
  
  
  fill(255,20,147);  // dip pink
 stroke(255,20,147);
 ellipse(b11X,b11Y,100,100);  
 
 i = target1;
 // j = abs((target1-1)%4);
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t11X[i]-t11X[j]);  // calcula el vector moviment
  stepY = step*(t11Y[i]-t11Y[j]);
  
  b11X = b11X + stepX;     //  mou la bola
  b11Y = b11Y + stepY;
  
  if( b11X > width-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b11X=b11X-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b11X < 40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b11X=b11X+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  if( b11Y > height-40) // | b1X < 40 | b1Y > height-40 | b1Y < 40)
  {
    b11Y=b11Y-10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
   
   if( b11X < 40) 
   // ( b2Y < 40)  | b2Y > height-40 | b2Y < 40)
  {
    
    b11Y=b11Y+10;
    target1 = (target1+1)%4;  // passa al proper target
    
  } 
  
  
  
  
  
  
  
  
    fill(0,100,0);  // dark green
 stroke(0,100,0);
 ellipse(b12X,b12Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t12X[i]-t12X[j]); 
  stepY = step*(t12Y[i]-t12Y[j]);
  
  b12X = b12X + stepX; 
  b12Y = b12Y + stepY;
  
  if( b12X > width-40)
  {
    b12X=b12X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b12X < 40)
  {
    b12X=b12X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b12Y > height-40)
  {
    b12Y=b12Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b12X < 40) 
  {
    b12Y=b12Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
      fill(32,178,170);  // light sea greeen
 stroke(32,178,170);
 ellipse(b13X,b13Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t13X[i]-t13X[j]); 
  stepY = step*(t13Y[i]-t13Y[j]);
  
  b13X = b13X + stepX; 
  b13Y = b13Y + stepY;
  
  if( b13X > width-40)
  {
    b13X=b13X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b13X < 40)
  {
    b13X=b13X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b13Y > height-40)
  {
    b13Y=b13Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b13X < 40) 
  {
    b13Y=b13Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
 
 
 
 
 
 
 
       fill(211,211,211);  // silver
 stroke(211,211,211);
 ellipse(b14X,b14Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t14X[i]-t14X[j]); 
  stepY = step*(t14Y[i]-t14Y[j]);
  
  b14X = b14X + stepX; 
  b14Y = b14Y + stepY;
  
  if( b14X > width-40)
  {
    b14X=b14X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b14X < 40)
  {
    b14X=b14X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b14Y > height-40)
  {
    b14Y=b14Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b14X < 40) 
  {
    b14Y=b14Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
  
 fill(255,0,255);  // fucsia
 stroke(255,0,255);
 ellipse(b15X,b15Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t15X[i]-t15X[j]); 
  stepY = step*(t15Y[i]-t15Y[j]);
  
  b15X = b15X + stepX; 
  b15Y = b15Y + stepY;
  
  if( b15X > width-40)
  {
    b15X=b15X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b15X < 40)
  {
    b15X=b15X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b15Y > height-40)
  {
    b15Y=b15Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b15X < 40) 
  {
    b15Y=b15Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
  
  
  
  
   fill(148,0,211);  // dark violet
 stroke(148,0,211);
 ellipse(b16X,b16Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t16X[i]-t16X[j]); 
  stepY = step*(t16Y[i]-t16Y[j]);
  
  b16X = b16X + stepX; 
  b16Y = b16Y + stepY;
  
  if( b16X > width-40)
  {
    b16X=b16X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b16X < 40)
  {
    b16X=b16X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b16Y > height-40)
  {
    b16Y=b16Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b16X < 40) 
  {
    b16Y=b16Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
  
  
 fill(85,107,47);  // dark olive green
 stroke(85,107,47);
 ellipse(b17X,b17Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t17X[i]-t17X[j]); 
  stepY = step*(t17Y[i]-t17Y[j]);
  
  b17X = b17X + stepX; 
  b17Y = b17Y + stepY;
  
  if( b17X > width-40)
  {
    b17X=b17X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b17X < 40)
  {
    b17X=b17X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b17Y > height-40)
  {
    b17Y=b17Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b17X < 40) 
  {
    b17Y=b17Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
  
   fill(139,0,0);  // dark red
 stroke(139,0,0);
 ellipse(b18X,b18Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t18X[i]-t18X[j]); 
  stepY = step*(t18Y[i]-t18Y[j]);
  
  b18X = b18X + stepX; 
  b18Y = b18Y + stepY;
  
  if( b18X > width-40)
  {
    b18X=b18X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b18X < 40)
  {
    b18X=b18X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b18Y > height-40)
  {
    b18Y=b18Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b18X < 40) 
  {
    b18Y=b18Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
  
     fill(219,112,147);  // pal violet red
 stroke(219,112,147);
 ellipse(b19X,b19Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t19X[i]-t19X[j]); 
  stepY = step*(t19Y[i]-t19Y[j]);
  
  b19X = b19X + stepX; 
  b19Y = b19Y + stepY;
  
  if( b19X > width-40)
  {
    b19X=b19X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b19X < 40)
  {
    b19X=b19X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b19Y > height-40)
  {
    b19Y=b19Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b19X < 40) 
  {
    b19Y=b19Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
       fill(30,144,255);  // dodger blue
 stroke(30,144,255);
 ellipse(b20X,b20Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t20X[i]-t20X[j]); 
  stepY = step*(t20Y[i]-t20Y[j]);
  
  b20X = b20X + stepX; 
  b20Y = b20Y + stepY;
  
  if( b20X > width-40)
  {
    b20X=b20X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b20X < 40)
  {
    b20X=b20X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b20Y > height-40)
  {
    b20Y=b20Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b20X < 40) 
  {
    b20Y=b20Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
  
  
 fill(70,130,180);  // steal blue
 stroke(70,130,180);
 ellipse(b21X,b21Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t21X[i]-t21X[j]); 
  stepY = step*(t21Y[i]-t21Y[j]);
  
  b21X = b21X + stepX; 
  b21Y = b21Y + stepY;
  
  if( b21X > width-40)
  {
    b21X=b21X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b21X < 40)
  {
    b21X=b21X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b21Y > height-40)
  {
    b21Y=b21Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b21X < 40) 
  {
    b21Y=b21Y+10;
    target1 = (target1+1)%4; 
    
  } 
  
  
  
  
  
  
  
   fill(132,130,180);  // ??
 stroke(132,130,180);
 ellipse(b22X,b22Y,100,100);  
 
 i = target1;
 j = (i+3)%4;
 
 println("i="+i+"   j="+j);
 
  stepX = step*(t22X[i]-t22X[j]); 
  stepY = step*(t22Y[i]-t22Y[j]);
  
  b22X = b22X + stepX; 
  b22Y = b22Y + stepY;
  
  if( b22X > width-40)
  {
    b22X=b22X-10;
    target1 = (target1+1)%4; 
    
  } 
  
  if( b22X < 40)
  {
    b22X=b22X+10;
    target1 = (target1+1)%4;
    
  } 
  
  if( b22Y > height-40)
  {
    b22Y=b22Y-10;
    target1 = (target1+1)%4;
  } 
   
   if( b22X < 40) 
  {
    b22Y=b22Y+10;
    target1 = (target1+1)%4; 
    
  } 
}

