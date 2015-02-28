
import peasy.*;

PeasyCam cam;

int [][][]zu;
int [][][]s1;
int [][][]s2;
int cw=5; 
int stretch=0;
int maxcells=50;
int maxx=maxcells;
int maxy=maxcells;
int maxz=maxcells;
int xoff=-(cw*maxcells)/2; 
int yoff=-(cw*maxcells)/2;
int zoff=-(cw*maxcells)/2;

void setup(){
  size(screen.width-20,screen.height-20,P3D);

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);

  zu=new int[maxy][maxx][maxz];
  s1=new int[maxy][maxx][maxz];
  s2=new int[maxy][maxx][maxz];

  for(int y=1;y<(maxy-1);y++){
    for(int x=1;x<(maxx-1);x++){
      for(int z=1;z<(maxz-1);z++){
        updates1(y,x,z,int(random(2)));
      }
    }
  }

  for(int y=1;y<(maxy-1);y++){
    for(int x=1;x<(maxx-1);x++){
      for(int z=1;z<(maxz-1);z++){
        s2[y][x][z]=s1[y][x][z];
      }
    }
  }
}

void draw(){
  background(0);

  directionalLight(200, 30, 30, 300, 300, 100);
  directionalLight(60, 30, 200, -300, -300, -100);
  //  directionalLight(200, 200, 30, 300, -300, 100);
  //  directionalLight(50, 200, 30, 300, 300, -100);

  cam.rotateY(0.01);
  cam.rotateZ(0.01);

  for(int y=1;y<(maxy-1);y++){
    for(int x=1;x<(maxx-1);x++){
      for(int z=1;z<(maxz-1);z++){
        if(zu[y][x][z] == 1) {
          pushMatrix();
          translate(yoff+(y*cw)+stretch,
          xoff+(x*cw)+stretch,
          zoff+(z*cw)+stretch);
          box(cw-1);
          popMatrix();
        } 
      }
    }
  }

  for(int y=1;y<(maxy-1);y++){
    for(int x=1;x<(maxx-1);x++){
      for(int z=1;z<(maxz-1);z++){
        if((s1[y][x][z]>0)||(zu[y][x][z]>0)) {
          if(zu[y][x][z] == 0){
            if((s1[y][x][z] == 5)){
              updates2(y,x,z,1);
            }
          }
          else{
//            if((s1[y][x][z]<4)||(s1[y][x][z]>5)){
            if((s1[y][x][z]<5)||(s1[y][x][z]>6)){
              updates2(y,x,z,-1);
            }
          }
        }
      }  
    }
  }


  for(int y=1;y<(maxy-1);y++){
    for(int x=1;x<(maxx-1);x++){
      for(int z=1;z<(maxz-1);z++){
        s2[y][x][z]=s1[y][x][z];
      }
    }
  }

}


void updates2(int y,int x,int z,int zz) {
  if(zz == -1){
    zu[y][x][z]=0;
  }
  else{
    zu[y][x][z]=1;
  }

  //left
  s1[y-1][x-1][z+1]+=zz;
  s1[y-1][x-1][z]+=zz;
  s1[y-1][x-1][z-1]+=zz;
  s1[y-1][x][z+1]+=zz;
  s1[y-1][x][z]+=zz;
  s1[y-1][x][z-1]+=zz;
  s1[y-1][x+1][z+1]+=zz;
  s1[y-1][x+1][z]+=zz;
  s1[y-1][x+1][z-1]+=zz;
  //up and down
  s1[y][x-1][z+1]+=zz;
  s1[y][x-1][z]+=zz;
  s1[y][x-1][z-1]+=zz;
  s1[y][x+1][z+1]+=zz;
  s1[y][x+1][z]+=zz;
  s1[y][x+1][z-1]+=zz;
  s1[y][x][z-1]+=zz;
  s1[y][x][z+1]+=zz;
  //right
  s1[y+1][x-1][z+1]+=zz;
  s1[y+1][x-1][z]+=zz;
  s1[y+1][x-1][z-1]+=zz;
  s1[y+1][x][z+1]+=zz;
  s1[y+1][x][z]+=zz;
  s1[y+1][x][z-1]+=zz;
  s1[y+1][x+1][z+1]+=zz;
  s1[y+1][x+1][z]+=zz;
  s1[y+1][x+1][z-1]+=zz;
}


void updates1(int y,int x,int z, int zz) {

  if(zz==1) {
    zu[y][x][z]=zz;
  }

  //left
  s1[y-1][x-1][z+1]+=zz;
  s1[y-1][x-1][z]+=zz;
  s1[y-1][x-1][z-1]+=zz;
  s1[y-1][x][z+1]+=zz;
  s1[y-1][x][z]+=zz;
  s1[y-1][x][z-1]+=zz;
  s1[y-1][x+1][z+1]+=zz;
  s1[y-1][x+1][z]+=zz;
  s1[y-1][x+1][z-1]+=zz;
  //up and down
  s1[y][x-1][z+1]+=zz;
  s1[y][x-1][z]+=zz;
  s1[y][x-1][z-1]+=zz;
  s1[y][x+1][z+1]+=zz;
  s1[y][x+1][z]+=zz;
  s1[y][x+1][z-1]+=zz;
  s1[y][x][z-1]+=zz;
  s1[y][x][z+1]+=zz;
  //right
  s1[y+1][x-1][z+1]+=zz;
  s1[y+1][x-1][z]+=zz;
  s1[y+1][x-1][z-1]+=zz;
  s1[y+1][x][z+1]+=zz;
  s1[y+1][x][z]+=zz;
  s1[y+1][x][z-1]+=zz;
  s1[y+1][x+1][z+1]+=zz;
  s1[y+1][x+1][z]+=zz;
  s1[y+1][x+1][z-1]+=zz;
}




