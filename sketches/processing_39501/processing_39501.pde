
int xDim=64;
int yDim=64;
int[][] area=new int[xDim][yDim];
int[][] dmap=new int[xDim][yDim];
int xm[]={0,1,0,-1};
int ym[]={-1,0,1,0};
ArrayList points;
int r=0;
int zoom=8;
int rx,ry;

class myPoint{
  int x,y,d;
  myPoint(int nx,int ny,int nd){
    x=nx;
    y=ny;
    d=nd;
    dmap[nx][ny]=nd;
  }
}

void setup(){
  size(xDim*zoom,yDim*zoom);
  noStroke();
  for(int x=0;x<xDim;x++)
     for(int y=0;y<yDim;y++){
       dmap[x][y]=-1;
       if((x==0)||(y==0)||(x>=xDim-3)||(y>=yDim-3))
         area[x][y]=0;
       else
         area[x][y]=1;
       fill(color(255,255,255));
       rect(x*zoom,y*zoom,zoom,zoom);
     }
  points=new ArrayList();
  myPoint p=new myPoint(2,2,0);
  fill(color(255,0,0));
  rect(p.x*zoom,p.y*zoom,zoom,zoom);
   points.add(p);  
}

void draw(){
  if(points.size()>0){
    int uu=0;
    {
      //int who=(int) random(0,points.size());
      int who=points.size()-1;
      int i=(int) random(4);
      myPoint P=(myPoint) points.get(who);
      if((P.x+xm[i]>1)&&(P.x+xm[i]<xDim-3)&&(P.y+ym[i]>1)&&(P.y+ym[i]<yDim-3)){
         if((area[P.x+xm[i]][P.y+ym[i]]==1)&&(area[P.x+(2*xm[i])][P.y+(2*ym[i])]==1)){
           area[P.x+xm[i]][P.y+ym[i]]=0;
           area[P.x+(2*xm[i])][P.y+(2*ym[i])]=0;
           fill(color(0,0,0));
           rect((P.x+xm[i])*zoom,(P.y+ym[i])*zoom,zoom,zoom);
           fill(color(255,0,0));
           rect((P.x+(2*xm[i]))*zoom,(P.y+(2*ym[i]))*zoom,zoom,zoom);
           myPoint Q=new myPoint(P.x+(2*xm[i]),P.y+(2*ym[i]),P.d+1);
           points.add(Q);
           uu++;
         }
      }
      int k=0;
      for(i=0;i<4;i++)
         if((area[P.x+(2*xm[i])][P.y+(2*ym[i])]==0))
             k++;
      //if((k>=3)||(points.size()>40000))
      if(k==4){
         fill(color(0,0,0));
         rect(P.x*zoom,P.y*zoom,zoom,zoom);
         points.remove(who);
         if(points.size()==0){
           rx=xDim-4;
           ry=yDim-4;
           fill(color(128,128,255));
           rect(rx*zoom,ry*zoom,zoom,zoom);
           /*
           for(int y=0;y<yDim;y++){
             for(int x=0;x<xDim;x++)
               print(dmap[x][y]+" ");
              println();
           }
           for(int y=0;y<yDim;y++){
             for(int x=0;x<xDim;x++)
               print(area[x][y]+" ");
              println();
           }
           */
         }
      }
      }
     // while(uu<1);
  } else{
      int g=-1;
      int d=dmap[rx][ry];
      for(int i=0;i<4;i++){
        if((dmap[rx+(2*xm[i])][ry+(2*ym[i])]!=-1)&&(area[rx+xm[i]][ry+ym[i]]==0)){
          if(dmap[rx+(2*xm[i])][ry+(2*ym[i])]<d){
            g=i;
            d=dmap[rx+(2*xm[i])][ry+(2*ym[i])];
          }
        }
      }
      if(g!=-1){
        rx+=xm[g];
        ry+=ym[g];
        fill(color(128,128,255));
        rect(rx*zoom,ry*zoom,zoom,zoom);
        rx+=xm[g];
        ry+=ym[g];
        fill(color(128,128,255));
        rect(rx*zoom,ry*zoom,zoom,zoom);
      }else{
        setup();
      }
  }
  //saveFrame("frame_#####.png");
}

