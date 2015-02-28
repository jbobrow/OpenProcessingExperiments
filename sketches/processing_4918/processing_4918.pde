
//volcano simulator

int sizea=400;
int vmax=2048;
float[] vax=new float[vmax];
float[] vay=new float[vmax];
float[] vvx=new float[vmax];
float[] vvy=new float[vmax];
float[] vpx=new float[vmax];
float[] vpy=new float[vmax];
float[][] vcolor=new float[vmax][3];
float[] vsize=new float[vmax];
boolean[] vactive=new boolean[vmax];
boolean[] vout=new boolean[vmax];
int vcount=0;
float[] starsx=new float[100];float[] starsy=new float[100];
float[] terx=new float[sizea+3];float[] tery=new float[sizea+3];
float gravity=0.05;

void setup(){
  size(sizea,sizea);
  background(20,0,40);
  
  for (int sfl=0;sfl<100;sfl++){starsx[sfl]=random(1)*sizea;starsy[sfl]=random(1)*sizea;} //generate star positions
  //noiseSeed(9);
  noiseDetail(8,0.5);
  for(int m=0;m<sizea+1;m++){
    terx[m]=m;
    tery[m]=noise(float(m)/100)*(sizea*.5)+(sizea*.5)*(pow((m-(sizea*.5))/(sizea*.5),2))+100;  //generate terrain shape
  }
  terx[sizea+1]=sizea;tery[sizea+1]=sizea;
  terx[sizea+2]=0;tery[sizea+2]=sizea;
}


void draw(){
  noiseDetail(3,0.5);
  background(10,0,20);
  
  stroke(75);strokeWeight(2);
  for (int sfl=0;sfl<100;sfl++){point(starsx[sfl],starsy[sfl]);}    //stars
  
  //create eruption at 1s
  float pchance=random(1);
  if (pchance<0.25*noise(frameCount*0.1)){
    int vfl;
    int erupt=64*round(noise(frameCount*0.01));
    for (vfl=0;vfl<erupt;vfl++){
      vsize[(vcount+vfl)%vmax]=1+random(1)*6;
      vax[(vcount+vfl)%vmax]=0;               
      vay[(vcount+vfl)%vmax]=0;
      vvx[(vcount+vfl)%vmax]=20*sin(random(-1,1)*random(0.2,0.5)+PI)/vsize[(vcount+vfl)%vmax];               
      vvy[(vcount+vfl)%vmax]=20*cos(random(-1,1)*random(0.2,0.5)+PI)/vsize[(vcount+vfl)%vmax];
      vpx[(vcount+vfl)%vmax]=sizea*.5;
      vpy[(vcount+vfl)%vmax]=tery[int(sizea*.5)]+round(sizea*.1); 
      vcolor[(vcount+vfl)%vmax][0]=255;
      vcolor[(vcount+vfl)%vmax][1]=255;
      vcolor[(vcount+vfl)%vmax][2]=255;
      vactive[(vcount+vfl)%vmax]=true;
      vout[(vcount+vfl)%vmax]=false;
    }
    vcount=(vcount+vfl)%vmax;
  }
  
  //update and draw particles
  for(int vfl=0;vfl<vmax;vfl++){
    if (vactive[vfl]==true){
      vvx[vfl]+=vax[vfl];
      vvy[vfl]+=vay[vfl]+gravity;
      vpx[vfl]+=vvx[vfl];
      vpy[vfl]+=vvy[vfl];
      
      if(vpx[vfl]>sizea){vactive[vfl]=false;vout[vfl]=false;}  //collisions
      if(vpx[vfl]<0){vactive[vfl]=false;vout[vfl]=false;}
      if(vpy[vfl]>sizea){vactive[vfl]=false;vout[vfl]=false;}
      
      if(vpy[vfl]<tery[constrain(int(vpx[vfl]),0,sizea)]){vout[vfl]=true;}
      if (vout[vfl]==true){
        if(vpy[vfl]>tery[constrain(int(vpx[vfl]),0,sizea)]+round(sizea*.1)){vpy[vfl]=tery[int(vpx[vfl])];vvy[vfl]=0;vvx[vfl]*=1.25;}
      }
      
      if (vactive[vfl]==true){
        vcolor[vfl][0]*=0.98+vsize[vfl]*0.0028;
        vcolor[vfl][1]*=0.97+vsize[vfl]*0.0023;
        vcolor[vfl][2]*=0.95+vsize[vfl]*0.001;                              //update color
        
        strokeWeight(vsize[vfl]);
        stroke(vcolor[vfl][0],vcolor[vfl][1],vcolor[vfl][2]);
        point(vpx[vfl],vpy[vfl]);
      }
    }
  }
  
  stroke(0);fill(0);
  beginShape();
  for (int tfl=0;tfl<sizea+3;tfl++){
    vertex(terx[tfl],tery[tfl]);                                    //terrain
  }
  endShape(CLOSE);
}

void keyPressed(){
  if (key==' '){saveFrame("Screen######.jpg");}
}

