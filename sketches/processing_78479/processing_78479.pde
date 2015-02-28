
class Drop {
  float x = int(random(width));
  float y = int(random(height));
  float div1 = .89;
  float div2 = 1.1;
  int w = 1;
 float h;
  //coefficient d'accroissement variable
  int inc = floor(random(1,3));
  //il faut une courbe d'accroissement

  void dripple() { w+=inc; 
  w*= 1.08; 

}
  //ici mettre sin
  void display() {
    h = w*.3;
    strokeWeight(1);
    line(x+y*.1,0,x,y);
      ///---------->
//if(drops.size()%30==0){//diminue le nombre de signaux audio
  if(y >= height*.62){  
  sortie.enableSignal(0);  }
float amp = map(y,0,height,.05,.2);
sine.setAmp(amp);
    ///---------->
    float wmapped = map(w,0,255,60,0);
    stroke(255, wmapped);
    ellipse(x,y,w,h);
    ellipse(x,y, w*div1, h*div1);
    ellipse(x,y, w*div2, h*div2);
    //------------->
    sortie.disableSignal(0);
    //------------->

    }
    void update() {
    if(w >= limite) { 
      drops.remove(this);//supprime le drop dont w a atteint la limite
    }
  }
}



