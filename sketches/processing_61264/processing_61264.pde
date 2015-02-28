
float Fi,Tita,x,y,z,px,py,pz,error,b,i,rayoX,rayoY,rayoZ;

//cabeza,oreja1,oreja2,ojo1,ojo2,cachete1,cachete2,nariz
float Xo[]={0,-100,100,-70,70,10,-10,0};
float Yo[]={0,-100,-100,-25,-25,10,10,-3};
float Zo[]={0,0,0,125,125,148,148,165};
float r[]={150,50,50,10,10,25,25,10};
float dens[]={1500,700,600,600,700,300,300,600};

int pres=1000;

void setup(){
  size(600,600,P3D);
  stroke(0,20);
  translate(width/2,height/2,0);
  colorMode(HSB);
  
}

void draw(){
  
  background(0);
  b=b+0.1;
  translate(width/2,height/2,0);
  rotateY(noise(b/10)*10);
  rotateY(constrain(noise(b)*10,6,9));
  
  //rotateX(noise(0,b/10)*10);
  //rotateZ(noise(0,0,b/10)*10);
    
  
  error=random(-5,5);
  translate(error,error,error);
 
  fill(200,40);
  //box(200,200,200);

  //dibujo cada elemento
 for (int j=0;j<8;j++){
  //dibujo cada esfera 
  for (int i=0;i<dens[j];i++){     
    
    Fi=random(0,PI);
    Tita=random(0,TWO_PI);
    error=random(0,10);
    
    px=x;
    py=y;
    pz=z;
   
    x=Xo[j]+r[j]*cos(Tita)*sin(Fi);
    y=Yo[j]+r[j]*sin(Tita)*sin(Fi);
    z=Zo[j]+r[j]*cos(Fi);
    
    line(px,py,pz,x,y,z);  
     }  
    
    //rayos 
    rayoX=random(-width,width);
    rayoY=random(-height,height);
    rayoY=random(-300,300);
    stroke(180,255,255,100);
    line(x,y,z,rayoX,rayoY,rayoZ);
    line(px,py,pz,rayoX,rayoY,rayoZ);
    stroke(180,random(0,255),255,50);
  }
  
  //background(200);
  
  
}

