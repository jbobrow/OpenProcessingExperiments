
//int de circulos
int x = 100;
int y = 0;
int z = 350;
int w = 500;
int p = -100;
int n = 150;
int k = 650;
int m = 85;

//int cuadrados
int a = -50;
int b = 400;
int c = -100;
int d = 220;
int e = -320;
int f = 220;
int g = -200;
int h = 400;
//imagen

void setup(){
  size(500,500); 
}
//fondo de juego
void draw(){

  background(75,86,135);
  //objetos color random!!!
  fill(random(255),random(255),random(255));  
  
  //circulos
  ellipse(x,y,30,30);  
  if(y<500){
    y=y+1;
  }
  else if(y==500){
   y=0; 
  }
  ellipse(z,w,30,30);  
  if(w>0){
    w--;
  }
  else if(w==0){
    w=500;
  } 
  ellipse(p,n,75,30);  
  if(p<500){
    p++;
  }
  else if(p==500){
    p=-100;
  } 
  //repetir x1 mas velocidad 
ellipse(p,n,75,30);  
  if(p<500){
    p++;
  }
  else if(p==500){
    p=-100;
  }     
  ellipse(k,m,120,30);  
  if(k>0){
    k--;
  }
  else if(k==0){
    k=750;
  }   
  //repetir x1 mas velocidad
    ellipse(k,m,120,30);  
  if(k>0){
    k--;
  }
  else if(k==0){
    k=650;
  } 
    ellipse(k,m,120,30);  
  if(k>0){
    k--;
  }
  else if(k==0){
    k=650;
  } 
  
  //cuadrados
  rect(a,b,100,30);
  if(a<500){
    a++;
    
  }
  else if(a==500){
    a=0;
  }
   rect(g,h,250,30);
  if(g<500){
    g++;
  }
  else if(g==500){
    g=-400;
  }
   rect(c,d,150,30);
  if(c<500){
    c++;
  }
  else if(c==500){
    c=0;
  }
   rect(e,f,150,30);
  if(e<500){
    e++;
  }
  else if(e==500){
    e=0;
  }
  
}



