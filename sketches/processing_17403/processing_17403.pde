
class No{
  float[][] cell;
  float[] palette;
  int ws=17;
  int t;
  float dynNoiseScale;
  No(){
    cell=new float[ws][ws]; 
    palette=new float[cs];
    boolean w=true;
    for (int i=0;i<cs;i++) {
      palette[i]=sin(i*0.1);//idea taken from Steven Kay's "countour blur"
    } 
  }
  void run(){    
    for(int x=0;x<ws;x++){
      for(int y=0;y<ws;y++){ 
        dynNoiseScale=noise(t*dtsc,x*dnsc,y*dnsc);
        cell[x][y]=palette[floor(constrain(noise(t*tsc,x*nsc*dynNoiseScale,y*nsc*dynNoiseScale)*cs-1,0,cs-1))];
      }
    }
t++;
  }
}

