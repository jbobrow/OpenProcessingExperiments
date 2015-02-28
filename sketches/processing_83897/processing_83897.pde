
class ring 
{
  int amin=1;
 int ampMax;
 int amp;
 int rayon;
 float angle;
 int nbe;
  boolean up=false;
  thing []partArray;
  
  //constructor
  ring(thing O,int Rayon,int Nbe,int Col,boolean Mouse,int Freq,int Amp,int AmpMax,int DureeVie){
  partArray=new thing[Nbe];
  nbe=Nbe;
  amp=Amp;
  rayon=Rayon;
  ampMax=AmpMax;
  //amin=int(amp);
  angle=2*PI/nbe;
  //println(O+" "+rayon+" "+nbe+" "+angle);
   for(int i=0;i<nbe;i++){
    partArray[i]=new thing(O,rayon,i*angle,Col,Mouse,Freq,DureeVie);
  }
  }
  
 void draw() 
{
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  if(up&&(amp<ampMax)){
    amp++;
  }
  if(up&&(amp<ampMax)){
    amp++;
  }else if(amp>amin){
    amp-=.4;
  }
  for(int i=0;i<nbe;i++){
    partArray[i].amplitude=amp;
    partArray[i].display();

  }
  
}
void mousePressed(){
  up=true;
}
void mouseReleased(){
  up=false;
}
}

