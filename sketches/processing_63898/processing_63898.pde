
class Animazione{
  
  private FFT fft;
  private int w,h;
  private AudioPlayer song;
  private Effects e;
  private AudioOutput out;
  private float k;
  private float j;
  public Animazione(int w,int h,Player p,Effects e){
    this.w=w;
    this.h=h;
    this.fft=p.getFft();
    this.song=p.getAP();
    this.e=e;
    this.out=e.getOut();
    j=0;
  }
  public void disegna_Anim(){
  fft.forward(song.mix);
    int x = int((width-2*w)/fft.avgSize());
  for (int i = 0; i < fft.avgSize(); i++){
    fill( map( i, 0, fft.avgSize(), 0, 255),map( i, 0, fft.avgSize(), 0, 50),map(fft.avgSize()-i, 0, fft.avgSize(), 0, 255));
    pushMatrix();
    translate(width/2-fft.avgSize()*20/2,h-32);
    k=map( i,0, fft.avgSize(),1,5);
    if(e.swIsClk()){
      float z=map(out.left.get(i),0,1,0,100);
      if(z>60){
        z=60;
      }
      rect(i*20,z-(fft.getAvg(i)*k),15,(fft.getAvg(i)*k));
    }else{
      rect(i*20,-(fft.getAvg(i)*k),15,(fft.getAvg(i)*k));
    }
    popMatrix();
  }
  
  }
}

