
float []x=new float[100];
float []y=new float[100];

float posy;
float posx;
float circpos=0;
float cdist;
float rad;

float[]colorise=new float[100];
float[]colorize=new float[100];
float[]colorizen=new float[100];

float wind;
float swit4;


void setup() {
  size(600,500);
  smooth();


  cdist=(2*PI)/7;
  rad=40;
  
  swit4=1;
  
  for(int lip=0;lip<50;lip++) {

    y[lip]=random(5,500);
    x[lip]=random(6,600);  
    colorise[lip]=random(255);
    colorize[lip]=random(255);
    colorizen[lip]=random(255);
    
    
  }
}

void draw() {
  background(0);
  noStroke();

  for(int lip=0;lip<100;lip++) {
    fill(colorizen[lip],colorize[lip],colorise[lip],20);
    
    
////wind////
        if(swit4==1){
      wind=wind+random(0.001,0.01);
      if(wind>5){
      swit4=0;
      }  
    }
    if(swit4==0){
     wind=wind-random(0.001,0.01); 
      if(wind<-5){
      swit4=1;
      }
    }
   
    x[lip]=x[lip]+(wind*lip/100);
    y[lip]=y[lip]+(wind/lip/10);

    ////flowers/////
    for(int lop=0; lop<7; lop++) {

      ellipse(x[lip],y[lip],30,30);
      posx=x[lip]+(cos(circpos+(cdist*lop))*rad);
      posy=y[lip]+(sin(circpos+(cdist*lop))*rad);
      ellipse(posx,posy,80,80);
    }
  }
  
}


