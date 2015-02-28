
  import ddf.minim.analysis.*;
  import ddf.minim.*;
  Minim minim;
  AudioPlayer song;
  AudioPlayer song2;
  FFT fft;
  FFT fft2;
  repulsore repulsori[]=new repulsore[12];
  boolean stop=false;
  boolean turn=false;
  boolean forma=false;
  int a=150;
  int a2=40;
  int a3=25;
  int b=1;
  int c=1;
  int angle=30;
  PFont f;
  PFont f2;
  color rosso=color(255,0,0);
  color verde=color(0,255,0);
  color blu=color(0,0,255);
  color magenta=blu+rosso;
  color ciano=verde+blu;
  color giallo=rosso+verde;

void setup()
{
    repulsori[0]=new repulsore(450,400,rosso,0,-1);
    repulsori[1]=new repulsore(525,420,blendColor(rosso,giallo*40/100,ADD),0.5,-0.87);
    repulsori[2]=new repulsore(580,475,giallo,0.87,-0.5);
    repulsori[3]=new repulsore(600,550,blendColor(verde,giallo*40/100,ADD),1,0);
    repulsori[4]=new repulsore(580,625,verde,0.87,0.5);
    repulsori[5]=new repulsore(525,680,blendColor(verde,ciano*40/100,ADD),0.5,0.87);
    repulsori[6]=new repulsore(450,700,ciano,0,+1);
    repulsori[7]=new repulsore(375,680,blendColor(blu,ciano*40/100,ADD),-0.5,0.87);
    repulsori[8]=new repulsore(320,625,blu,-0.87,0.5);
    repulsori[9]=new repulsore(300,550,blendColor(blu,magenta*40/100,ADD),-1,0);
    repulsori[10]=new repulsore(320,475,magenta,-0.87,-0.5);
    repulsori[11]=new repulsore(375,420,blendColor(rosso,magenta*40/100,ADD),-0.5,-0.87);
    size(900, 900);
    f = loadFont("Caribbean-Regular-48.vlw");
    f2 = loadFont("Arial-Black-48.vlw");
    minim = new Minim(this);
    song = minim.loadFile("Up Is Down.mp3", 1024);
    song2 = minim.loadFile("il grande incubo.mp3", 1024);
    song.play();
    fft = new FFT(song.bufferSize(), song.sampleRate());
    fft2 = new FFT(song2.bufferSize(), song2.sampleRate());
}

void draw()
{
  background(0);
  textFont(f,36);
  fill(255);
  if(!forma){
    text("Hans Zimmer - Up Is Down",165,50);
      // esegue trasformata di Fourier sul buffer mix
    fft.forward(song.mix);

    //println(fft.specSize());
    int j=0;
    for (int i = 0; i < fft.specSize(); i++)
    {
       noStroke();
       fill(repulsori[j].c); 
      if(stop==false){   
         ellipse(repulsori[j].posx+(repulsori[j].coefx*-1.8*fft.getBand(i)/3), repulsori[j].posy+(repulsori[j].coefy*-1.8*fft.getBand(i)/3),30,30);
       }
       if(stop==true)
       {
         ellipse(repulsori[j].posx+(repulsori[j].coefx*1.8*fft.getBand(i)), repulsori[j].posy+(repulsori[j].coefy*1.8*fft.getBand(i)),30,30);
       }
       if(turn==true){
         modifica(repulsori,j);
       }
        
        b+=(int)(fft.getBand(i)*1.8-fft.getBand(i-1))*1.8;
        c+=(int)(fft.getBand(i)*1.8-fft.getBand(i-1))*1.8;
        int x = (width/2) + (int)(a*cos(angle * b));
        int y = (width/2)+100 + (int)(a*sin(angle * c));
        ellipse(x,y,5,5);
        int x2 = (width/2) + (int)(a2*cos(angle * b));
        int y2 = (width/2)+100 + (int)(a2*sin(angle * c));
        ellipse(x2,y2,5,5);
        int x3 = (width/2) + (int)(a3*cos(angle * b));
        int y3 = (width/2)+100 + (int)(a3*sin(angle * c));
        ellipse(x3,y3,5,5);      
        
        j++;
        if(j==12){
           j=0;
        }
    }
  }
  else{
      text("883 - Il Grande Incubo",220,50);
      fft2.forward(song2.mix);
      int k=0;
      for (int i = 0; i < fft2.specSize(); i++)
      {
         noStroke();
         fill(repulsori[k].c); 
        if(stop==false){   
           ellipse(repulsori[k].posx+(repulsori[k].coefx*-1*fft2.getBand(i)/3), repulsori[k].posy+(repulsori[k].coefy*-1*fft2.getBand(i)/3),30,30);
         }
         if(stop==true)
         {
           ellipse(repulsori[k].posx+(repulsori[k].coefx*fft2.getBand(i)), repulsori[k].posy+(repulsori[k].coefy*fft2.getBand(i)),30,30);
         }
         if(turn==true){
           modifica(repulsori,k);
         }
          
          b+=(int)(fft2.getBand(i)-fft2.getBand(i-1));
          c+=(int)(fft2.getBand(i)-fft2.getBand(i-1));
          int x2 = (width/2) + (int)(a2*cos(angle * b));
          int y2 = (width/2)+65 + (int)(a2*sin(angle * c));
          ellipse(x2,y2,5,5);
          int x3 = (width/2) + (int)(a3*cos(angle * b));
          int y3 = (width/2)+65 + (int)(a3*sin(angle * c));
          ellipse(x3,y3,5,5);
          
          k++;
          if(k==12){
             k=0;
          }
      }
  }
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

class repulsore{
    int posx;
    int posy;
    color c;
    float coefx;
    float coefy;
  
  repulsore(int x,int y,color c,float coefx,float coefy){
      this.posx=x;
      this.posy=y;
      this.c=c;
      this.coefx=coefx;
      this.coefy=coefy;
  }
}


void mousePressed(){
  if(stop == false)
  {
    stop=true;
  }
  else{stop=false;}
}

void keyPressed(){
  if(key=='F'||key=='f')
  {
    forma=(!forma);
    print(forma);
    if(forma)
    {
      song.close();
      minim = new Minim(this);
      song2 = minim.loadFile("il grande incubo.mp3", 1024);
      setcolor();
      fft2 = new FFT(song2.bufferSize(), song2.sampleRate());
      song2.play();
    }
    else
    {
      song2.close();
      minim = new Minim(this);
      song = minim.loadFile("Up Is Down.mp3", 1024);
      setcolor();
      fft = new FFT(song.bufferSize(), song.sampleRate());
      song.play();
    }
  }
  else if(turn == false)
  {
    turn=true;
  }
  else
  {
    turn=false;
    setcolor();
  }
}

void modifica(repulsore repulsori[],int i){
  if(i==11){
    repulsori[11].c=repulsori[0].c;
  }
  else{
      repulsori[i].c=repulsori[i+1].c;
  }
}

void setcolor(){
  if(!forma)
  {
    repulsori[0]=new repulsore(450,400,rosso,0,-1);
    repulsori[1]=new repulsore(525,420,blendColor(rosso,giallo*40/100,ADD),0.5,-0.87);
    repulsori[2]=new repulsore(580,475,giallo,0.87,-0.5);
    repulsori[3]=new repulsore(600,550,blendColor(verde,giallo*40/100,ADD),1,0);
    repulsori[4]=new repulsore(580,625,verde,0.87,0.5);
    repulsori[5]=new repulsore(525,680,blendColor(verde,ciano*40/100,ADD),0.5,0.87);
    repulsori[6]=new repulsore(450,700,ciano,0,+1);
    repulsori[7]=new repulsore(375,680,blendColor(blu,ciano*40/100,ADD),-0.5,0.87);
    repulsori[8]=new repulsore(320,625,blu,-0.87,0.5);
    repulsori[9]=new repulsore(300,550,blendColor(blu,magenta*40/100,ADD),-1,0);
    repulsori[10]=new repulsore(320,475,magenta,-0.87,-0.5);
    repulsori[11]=new repulsore(375,420,blendColor(rosso,magenta*40/100,ADD),-0.5,-0.87);
  }
  else
  {
    repulsori[0]=new repulsore(450,440,rosso,0,-1);
    repulsori[1]=new repulsore(450+8*7,410-2*7,blendColor(rosso,giallo*40/100,ADD),0.5,-0.87);
    repulsori[2]=new repulsore(450+18*7,410+3*7,giallo,0.87,-0.5);
    repulsori[3]=new repulsore(450+22*7,410+13*7,blendColor(verde,giallo*40/100,ADD),1,0);
    repulsori[4]=new repulsore(450+17*7,410+24*7,verde,0.87,0.5);
    repulsori[5]=new repulsore(450+8*7,410+34*7,blendColor(verde,ciano*40/100,ADD),0.5,0.87);
    repulsori[6]=new repulsore(450,420+37*7,ciano,0,1);
    repulsori[7]=new repulsore(450-8*7,410+34*7,blendColor(blu,ciano*40/100,ADD),-0.5,0.87);
    repulsori[8]=new repulsore(450-17*7,410+24*7,blu,-0.87,0.5);
    repulsori[9]=new repulsore(450-22*7,410+13*7,blendColor(blu,magenta*40/100,ADD),-1,0);
    repulsori[10]=new repulsore(450-18*7,410+3*7,magenta,-0.87,-0.5);
    repulsori[11]=new repulsore(450-8*7,410-2*7,blendColor(rosso,magenta*40/100,ADD),-0.5,-0.87);
  }
}

