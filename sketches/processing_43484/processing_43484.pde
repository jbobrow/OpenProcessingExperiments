
// vj monz line array sketch vimeo.com/vjmonz 2011


int NUM = 11;
float el1, el2,bg,strok,counter;
boolean invrt;
float b3;

float[] a = new float[   NUM  ];
float[] b = new float[   NUM  ];
float[] c = new float[   NUM  ];
float[] d = new float[   NUM  ];

float[] as = new float[   NUM  ];
float[] bs = new float[   NUM  ];
float[] cs = new float[   NUM  ];
float[] ds = new float[   NUM  ];


void setup(){
  colorMode(HSB);
 
  b3= random(255);
  size(800,150);
  smooth();
  
  for ( int i = 0; i < NUM; i++){
  
    a[i] = width/2;
    b[i] = height/2;
    c[i] = width/2;
    d[i] = height/2;
    as[i] = random(8);
    bs[i] = random(8);
    cs[i] = random(8);
    ds[i] = random(8);
  }
}


void draw(){
  
    if(invrt){
    bg =0;
    strok =255;
  } else {
    bg =255;
   strok = 0; 
  }
  
  
  b3+=0.2;

  if ( b3 > 255 ) b3 = 0;
  
  background(bg);
  
   for ( int i = 0; i < NUM; i++){
     a[i] += as[i];
     b[i] += bs[i];
     c[i] += cs[i];
     d[i] += ds[i];
   
  stroke(b3,255,255);
  strokeWeight(4);
  line(  a[i] , b[i] , c[i]  , d[i] );
  

  if ( a[i] > width ) a[i] = 0;
  if ( b[i] > width ) b[i] = 0;
  if ( c[i] > width ) c[i] = 0;
  if ( d[i] > width ) d[i] = 0;
  
  if ( a[i] < 0 ) a[i] = width;
  if ( b[i] < 0 ) b[i] = height;
  if ( c[i] < 0 ) c[i] = width;
  if ( d[i] < 0 ) d[i] = height;

    
  noFill();
  stroke(b3,255,255);
  strokeWeight(9);
  ellipse(  a[i] ,  b[i] ,  el1, el1 );
  ellipse(  c[i] ,  d[i] ,  el2, el2 ); 
  
    if ( mousePressed ) {
      a[i] = 0;
      b[i] = 0;
      c[i] = 0;
      d[i] = 0;
   }
  
   }
   el1 = sin(frameCount * PI / 1000 ) * 300;
   el2 = sin(frameCount * PI / 1000 ) * 300;


 if( random(100) > 99 ) {
     invrt = !invrt; 
   }
 counter++;
    if(counter > 1000) counter =0;

}

                
                
