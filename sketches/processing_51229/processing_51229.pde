
int nx=200,ny=100;
float a0=3;
float k =0.1;
float k2 = 0.005;
float damp = 0.00001;

float cx=0,cy=200;

float vimpact = 0.8;
float mimpact = 1000;


class nod{
  float x,y;
  float sx,sy;
  float vx=0,vy=0;
  float m=1.0;

  nod(float x_,float y_){
    x=x_;    y=y_;
  }
  
 void move(){
  x+=vx;y+=vy;
  }
  
  void force(nod n, int px,int py){
    float dx = x-n.x; float dy = y-n.y;
    dx+=a0*px;
    dy+=a0*py;
    vx-=k*dx/m;

    
    //odddelene vrstvy
    /*
    if((py>0)&&(dy<0)){dy=0;}
    if((py<0)&&(dy>0)){dy=0;}
    */
    
    //zesileny vertikalni tlak
    if((py>0)&&(dy>0)){vy*=(1-k2); vy+=k2*n.vy;}
    if((py<0)&&(dy<0)){vy*=(1-k2); vy+=k2*n.vy;}
    
    /*
    if((py>0)&&(dy<0)){vy*=(1-k2); vy+=k2*n.vy;}
    if((py<0)&&(dy>0)){vy*=(1-k2); vy+=k2*n.vy;}
    */
    
    vy-=k*dy/m;
   
    //offdiagonal
    vx-=0.9*k*dy*px*py/m;
    
    vy-=0.1*k*dx*py*px/m;
    
  }
}

nod[][] nods= new nod[nx][ny];
nod[][] nods_= new nod[nx][ny];

void setnods(){
  for(int ix=0;ix<nx;ix++){
    for(int iy=0;iy<ny;iy++){
      nods[ix][iy] = new nod(ix*a0+cx,iy*a0+cy);
 //     nods[ix][iy]_ = new nod(ix*a0+cx,iy*a0+cy);
    }
  }
}

/*
void cpnods(nod[][] nod,nod[][] nods_){
for(int ix=0;ix<nx;ix++){
    for(int iy=0;iy<ny;iy++){
      nods_[ix][iy].x = nods[ix][iy].x;
      nods_[ix][iy].y = nods[ix][iy].y;
      nods_[ix][iy].vx = nods[ix][iy].vx;
      nods_[ix][iy].vy = nods[ix][iy].vy;
    }
  }
}
*/

void forcenods(){
//cpnods(nods,nods_);
for(int ix=1;ix<(nx-1);ix++){
    for(int iy=1;iy<(ny-1);iy++){
     float vx_=nods[ix][iy].vx; float vy_=nods[ix][iy].vy; //k obarveni 
      
     nods[ix][iy].force(nods[ix+1][iy],+1,0);
     nods[ix][iy].force(nods[ix-1][iy],-1,0);
     nods[ix][iy].force(nods[ix][iy+1],0,+1);
     nods[ix][iy].force(nods[ix][iy-1],0,-1);
     
     nods[ix][iy].force(nods[ix+1][iy+1],+1,+1);
     nods[ix][iy].force(nods[ix+1][iy-1],+1,-1);
     nods[ix][iy].force(nods[ix-1][iy+1],-1,+1);
     nods[ix][iy].force(nods[ix-1][iy-1],-1,-1);
     
    nods[ix][iy].sx=nods[ix][iy].vx-vx_;
    nods[ix][iy].sy=nods[ix][iy].vy-vy_;
    }
  }
  int iy;
  for(int ix=1;ix<(nx-1);ix++){
  iy=ny-1;  
     nods[ix][iy].force(nods[ix+1][iy],+1,0);
     nods[ix][iy].force(nods[ix-1][iy],-1,0);
     nods[ix][iy].force(nods[ix][iy-1],0,-1);
  iy=0;
     nods[ix][iy].force(nods[ix+1][iy],+1,0);
     nods[ix][iy].force(nods[ix-1][iy],-1,0);
     nods[ix][iy].force(nods[ix][iy+1],0,+1);
  };
  
  for(int ix=1;ix<(nx-1);ix++){
    for(iy=1;iy<(ny-1);iy++){
     nods[ix][iy].vx*=(1-damp/nods[ix][iy].m);
     nods[ix][iy].vy*=(1-damp/nods[ix][iy].m);
    }
  }

}

void movenods(){
 for(int ix=0;ix<nx;ix++){
    for(int iy=0;iy<ny;iy++){
    nods[ix][iy].move();
    }
  }
}

void setup(){
  size(600, 600,P2D);
  smooth();
  strokeWeight(3);
  setnods();
  
  /*
   for(int ix=int(nx*0.33);ix<int(nx*0.66);ix++){
     nods[ix][0].vy=vimpact;
     nods[ix][0].m=mimpact;
    }
  */  
   for(int ix=int(nx*0.45);ix<int(nx*0.55);ix++){
     nods[ix][0].vy=vimpact;
    // nods[ix][0].vx=vimpact;
     nods[ix][0].m=mimpact;
   }
}

void draw(){
  forcenods();
  movenods();
  
  fill(255,40);
  rect(0,0,600,600);

  //particle size
  //stroke(0,40);
  strokeWeight(a0);  
  for(int ix=0;ix<nx;ix++){
    for(int iy=0;iy<ny;iy++){
      //stroke(nods[ix][iy].vy*500,abs(nods[ix][iy].vx)*500,-nods[ix][iy].vy*500,255);
      stroke(nods[ix][iy].sy*5000,abs(nods[ix][iy].sx)*1000,-nods[ix][iy].sy*5000,255);
      point(nods[ix][iy].x,nods[ix][iy].y);
    }
  }
/*  
  //central points
  stroke(0,255);
  strokeWeight(3);
  for(int ix=0;ix<nx;ix++){
    for(int iy=0;iy<ny;iy++){
      point(nods[ix][iy].x,nods[ix][iy].y);

    }
  }
*/
  
    stroke(0,255);
    strokeWeight(a0);
   for(int ix=int(nx*0.45);ix<int(nx*0.55);ix++){
     point(nods[ix][0].x,nods[ix][0].y);
   }
}


