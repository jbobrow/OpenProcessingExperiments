
void setup(){
  size(405,405);
  ellipseMode(CENTER);
  colorMode(HSB,100);
  for(int a=0;a<X;a++){
    for(int b=0;b<Y;b++){
      ell[a][b]=12;
    }
  }
}
int X=30;int Y=30;
boolean[][] lgt=new boolean[X][Y];
boolean[][] blk=new boolean[X][Y];
float[][] col=new float[X][Y];
int[][] c=new int[X][Y];
boolean[][] V=new boolean[X][Y];
float[][] t=new float[X][Y];
int[][] ell=new int[X][Y];
int[][] alp=new int[X][Y];
void draw(){
  background(#000000);
  
  for(int a=0;a<X;a++){
    for(int b=0;b<Y;b++){
      if(a*15<mouseX && mouseX<a*15+12 && b*15<mouseY && mouseY<b*15+12){
        col[a][b]=random(100);c[a][b]=50;V[a][b]=false;lgt[a][b]=true;t[a][b]=200;
        
        if(mousePressed){if(blk[a][b]==true){blk[a][b]=false;}
          if(blk[a][b]==false){blk[a][b]=true;}alp[a][b]=100;
        }
        
      }if(lgt[a][b]==true){col[a][b]=col[a][b];}
      if(lgt[a][b]==true){
        if(c[a][b]>=100){V[a][b]=false;}if(c[a][b]<=-50){V[a][b]=true;}
        if(V[a][b]==false){c[a][b]-=5;}else{c[a][b]+=5;}
        fill(col[a][b],100,c[a][b]);
        t[a][b]-=0.2;if(t[a][b]<=100){t[a][b]=100;}
        else{noStroke();}
      }else{fill(#2a2a2a);noStroke();}
      
      
      
      ellipse(a*15+7.5,b*15+7.5,12,12);
      
      if(blk[a][b]==true){stroke(col[a][b],100,100,alp[a][b]);noFill();
        if(V[a][b]==false){ell[a][b]+=2;alp[a][b]-=5;}
        if(c[a][b]==100){ell[a][b]=12;}if(c[a][b]==100){alp[a][b]=100;}
        
    }else{noStroke();}
    ellipse(a*15+7.5,b*15+7.5,ell[a][b],ell[a][b]);
    }
  }
  
}


