

int [] liste=new int[500];
int [] sequence=new int[5000];
int n=0;
int m=100;
int taille;
int var=0;
int somme=0;
float moyenne;

void setup(){
  size(800,600);
    fill(0);
    textSize(8);
  frameRate(20);

}
  
void draw(){
   
   if (frameCount>2999){noLoop();}
     background(250);
     
    
       echantillon e=new echantillon(m);
       e.affiche();
       taille=taille+1;
       sequence[int(e.moy*10)]=sequence[int(e.moy*10)]+1;
       trace();
       hist();
       
  
}


void hist(){
   pushMatrix();
   translate(0,height-50);
   float f=0;
   for(int i=0;i<5000;i++){
     
     f=f+sequence[i];

     stroke(255,0,0);
     if (f*100.0/taille<2.5 || f*100.0/taille>97.5){stroke(0,255,0);}
    if (i%20==0){pushMatrix();translate(i,20);rotate(radians(90));text(str(i*0.1),0,0);popMatrix();stroke(100);line(i,0,i,-100);}
     line(i,0,i,-sequence[i]*5000/taille);
    
   }
    popMatrix();
  
  
}


void trace(){
        stroke(0);
       pushMatrix();
       translate(360-36,height/2-100);
       float f=0;
       for(int i=1;i<liste.length;i++){
         if (i%20==0){pushMatrix();translate(i,20);rotate(radians(90));text(str(i),0,0);popMatrix();}
         f=f+liste[i];
         line(2*i,0,2*i,-liste[i]*20*height/2/n);
       }
       stroke(255,0,0);
       fill(255,0,0);
       textSize(12);
    
       moyenne=somme*1.0/n;
       line(moyenne,height/2,moyenne,-height/2);
       text(str(moyenne),moyenne,60);
       
       popMatrix();
       
       textAlign(CENTER);
       text("le nombre total d'expériences est : ",0,100,300,80);
       text("n= "+str(n),0,120,300,100);
       text("l'écart- type de la série des n expériences est", 0,140,300,120);
       textAlign(LEFT);
       text("s = "+sqrt(var*1.0/n-moyenne*moyenne),100,160,300,140);
       text("la taille d'un échantillon est : m = "+str(m), 20,640,300,620);
       textAlign(CENTER);
       text("le nombre total d'échantillon est : ",0,360,300,380);
       text("taille= "+str(taille),0,380,300,300);
       stroke(0); 
       fill(0);
       textSize(8);
       
       
  
  
  
}

int  experience(){
  int i=0;
  int a=0;
  int b=0;
  int c=0;
  while (a+b+c!=7  ||  (a-b)*(b-c)*(a-c)==0){
                  a=int(random(1,7));
                  b=int(random(1,7));
                  c=int(random(1,7));
                  i=i+1;}
  return i;                
} 



class echantillon{
  
  int taille;
  int [] echant;
  int [] lis;
  int m;
  int v;
  float moy;
  float s;
  
  echantillon(int a){
   taille=a;
   echant=new int[a];
   lis=new int[500];
   v=0;
   initial(); 
   moy=m*1.0/taille;
   s=sqrt(v*1.0/taille-moy*moy);
  }
  
  void initial(){ 
    n=n+taille;
    for(int i=0;i<taille;i++){
      int u=experience();
      m=m+u;
      v=v+u*u;
      lis[u]=lis[u]+1;
      echant[i]=u;
      
      }
    for(int j=0;j<lis.length;j++){
      liste[j]=liste[j]+lis[j];
    
    }
    var=var+v;
    somme=somme+m;
  }
    
  void affiche(){
     pushMatrix();
     stroke(0);
     translate(360-36,height/2);
     for(int i=1;i<taille;i++){
      line(0,i,echant[i]*2,i); 
     }
     
     popMatrix();
     
   }
    
     
 
    
}  

