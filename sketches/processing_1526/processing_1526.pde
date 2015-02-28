
float rados = 0;float vitesse = 3/(180.0/PI);float inverse=180/(180.0/PI) ;
float radius = 0;

void setup(){
size(600, 600 );
stroke(250);
background(0); 
frameRate(40);
smooth();
}

void dessine(){
  radius+=0.01;
  float rad=cos(radius); rad =10+(1+rad)*120;  
  rados+=vitesse;
  rect(0,0,500,500);
  float x1 = random (0)+cos(rados)*rad;
  float y1 = random (0)+sin(rados)*rad; 
  float x2 = random (500)+cos(rados+inverse)*rad;
  float y2 = random (500)+sin(rados+inverse)*rad;  
   line(x1,y1,x2,y2); 
   line(0,0,x2,y2);
   line(500,500,x1,y1);
  }

void draw(){ 
   fill(0,7);
  for(int a=0;a<2;a++){
    dessine();
    }
}

