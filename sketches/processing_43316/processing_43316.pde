
// vj monz line array sketch vimeo.com/vjmonz 2011



int NUM = 30;

float[] a = new float[   NUM  ];
float[] b = new float[   NUM  ];
float[] c = new float[   NUM  ];
float[] d = new float[   NUM  ];

float[] as = new float[   NUM  ];
float[] bs = new float[   NUM  ];
float[] cs = new float[   NUM  ];
float[] ds = new float[   NUM  ];


void setup(){
  
  size(900,450);
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
  
  background(0);
  
   for ( int i = 0; i < NUM; i++){
     a[i] += as[i];
     b[i] += bs[i];
     c[i] += cs[i];
     d[i] += ds[i];
   
  stroke(255);
  line(  a[i] , b[i] , c[i]  , d[i] );
  
  
  if ( a[i] > width ) a[i] = 0;
  if ( b[i] > width ) b[i] = 0;
  if ( c[i] > width ) c[i] = 0;
  if ( d[i] > width ) d[i] = 0;
  
  if ( a[i] < 0 ) a[i] = width;
  if ( b[i] < 0 ) b[i] = height;
  if ( c[i] < 0 ) c[i] = width;
  if ( d[i] < 0 ) d[i] = height;
  
  
   }
   
   
   
}           
