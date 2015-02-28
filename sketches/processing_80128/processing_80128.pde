
import processing.video.*;

Capture video ;

 int a=50;
 
 float angulo = 0.0;
 
void setup (){
  size (800,600);

   background (0);  
  video =new Capture (this,width,height,15);
}

void draw (){
  if (video.available ()){
    video.read ();
  }
  
  
    imageMode(CORNER);
  tint (255,255,255,15);
  image (video,0,0,width,height);
  
  
  keyPressed ();
  
}

void keyPressed (){
  if (key== 'q' || key == 'Q'){
     
crecer();
  }
  
  if  (key == 'a' || key == 'A'){

girar ();
  }
  
  if  (key == 'z'|| key =='Z'){
    crecer();
    girar();
  }
if (key == ' ' ){
  vacio();
}
}



void crecer(){
  int b=a+50;
int c= b+50;

  int d=width;
  int e=height;
  
 
  
  
  tint (255,0,0,150);
  image (video,a,a,d-a*2,e-a*2);
  
  tint (0,255,0,150);
  image (video,b,b,d-b*2,e-b*2);
  
  tint (0,0,255,150);
  image (video,c,c,d-c*2,e-c*2);
  
  
 a+=5;
  d-=a;
  e-=a;
  
  
  if (a>width+100){
    a=a*-1 ;
    
  }
  
}

void girar (){

  int b=a+50;
int c= b+50;

  int d=width;
  int e=height;
  

  
  
  imageMode(CENTER);
  angulo = angulo + 0.1;
  translate (width/2,height/2);
  rotate (angulo);
  tint (255,0,0,150);
  image (video,a,a,d-a*2,e-a*2);
  
  tint (0,255,0,150);
  image (video,a,a,d-b*2,e-b*2);
  
  tint (0,0,255,150);
  image (video,a,a,d-c*2,e-c*2);
  
  
  
}


void vacio (){
  fill (0);
  rect (0,0,width,height);
  a=0;

}

