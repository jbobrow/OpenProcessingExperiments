

int s=1000;
int s2=600;
//how many pixels each cell is - square

int n=1000;
int[] x=new int[n];
int[] y=new int[n];
int[] dx=new int[n];
int[] dy=new int[n];
int[] c=new int[n];
int[] f=new int[n];
int[] t=new int[n];
//frame rate
int rate=32;




void setup() 
{


  frameRate(rate);

  noStroke();


  for (int i=0;i<x.length;i++) {
    x[i]=int(random(s));
    y[i]=int(random(s2));
    t[i]=int(random(1,4));
    if (t[i]==1){
        c[i]=color(0, random(256),0,48);
    }
       if (t[i]==2){
       c[i]=color(0, random(256),0,48);
    }
        if (t[i]==3){
       c[i]=color(0, random(256),0,48);
    }
   
    c[i]=color(random(128,256),random(64,128),random(64),48);
    
     f[i]=int(random(4,8));
 
  dx[i]=int(random(-1*f[i],1*f[i]));
    dy[i]=int(random(-1*f[i],1*f[i]));
  

  }

  size(1000,600);

  background(0,0,0);
}


void draw()
{
  fill(color(0,0,0,8));
 rect(0,0, s,s2);

  for (int i=0;i<x.length;i++) {
    fill(c[i]);
    if(t[i]==1){
      rect(x[i], y[i], f[i], f[i]);
    };
    if(t[i]==2){
      ellipse(x[i], y[i], f[i], f[i]);
    };
        if(t[i]==3){
     
      ellipse(x[i], y[i], f[i], f[i]);
    };
   change(i);
  
   

   
    x[i]=x[i]+dx[i];
    y[i]=y[i]+dy[i];
     if(x[i]<0){
       dx[i]=dx[i]*-1;
       x[i]=1;
     }
     if(x[i]>s){
       dx[i]=dx[i]*-1;
       x[i]= s-1;
     }
      if(y[i]<0){
       dy[i]=dy[i]*-1;
       y[i]=1;
     }
      if(y[i]>s2){
       dy[i]=dy[i]*-1;
       y[i]=s2-1;
     }
  }

}

void change(int i) {



   if(random(1000)<100*t[i]){
       
    dx[i]=int((mouseX-x[i])/(32*t[i])+random(-1*f[i]/t[i],1*f[i]/t[i]));
      dy[i]=int((mouseY-y[i])/(32*t[i])+random(-1*f[i]/t[i],1*f[i]/t[i]));
   
   }
   
  
}





void keyPressed()
{
  if ( key == 's' ) save(str(millis())+".jpg");
  if ( key == 'r' ) setup();
}



