
class Spot {
  float[] c = new float[3];
  int life;
  float std = 0;
  int level;
  int pos;
  boolean mh = false;

  Spot(float[] c0, int life0, int level0, int pos0) { 
    arrayCopy(c0, c);
    life = life0;
    level = level0;
    pos = pos0;  
    standDev();
  }

  void standDev() {    
    float mean = (c[0]+c[1]+c[2])/3;    
    float diff0 = pow((abs(c[0] - mean)),2);
    float diff1 = pow((abs(c[1] - mean)),2);
    float diff2 = pow((abs(c[2] - mean)),2);  
    float meanvariance = (diff0+diff1+diff2)/3;
    float std1 = pow(meanvariance,0.5);  
   
   
   float num1 =  1.0;
   float num2 =  1.0;
   float num3 =  1.0;
       
    if(spots[k-1] == null){
       num1 =  1.0;
       num2 =  1.0;
       num3 =  1.0;
    }
    else{
       num1 =  spots[k-1].c[0];
       num2 =  spots[k-1].c[1];
       num3 =  spots[k-1].c[2];
    }
    
    float perc1 = 1-abs(1-(c[0]/num1));
    float perc2 = 1-abs(1-(c[1]/num2));
    float perc3 = 1-abs(1-(c[2]/num3));
    
    float avgperc = ((perc1 + perc2 + perc3)/3); 
    
    float avgperc2 = (1-avgperc)*in.left.level()*5 + avgperc;
    
   std = std1*avgperc;
    //std=std1;

  
  }
  
  
  void draw() {
    fill((c[0]/max) , (c[1]/max) , (c[2]/max));
    ellipse(pos*d+(level*d/2)+10, height-(d*(level+1)*.9)-10, d, d);
    //fill(1);
    //text(std, pos*d+(level*(d)/2)+10 + d/2, height-(d*(level+1)*.85)-10 + d/2);
  }
  
  
  
  /*
  void draw() {
    fill((c[0]/max) + (.03)*(spots[k-1].c[0]*(abs((std-spots[k-1].std))/(spots[k-1].std))), (c[1]/max)  + 
    (0.03)*(spots[k-1].c[1]*(abs((std-spots[k-1].std))/(spots[k-1].std))), (c[2]/max)  + 
    (0.03)*(spots[k-1].c[2]*(abs((std-spots[k-1].std))/(spots[k-1].std))));
    ellipse(pos*d+(level*d/2)+10, height-(d*(level+1)*.85)-10, d, d);
    //fill(1);
    //text(std, pos*d+(level*(d)/2)+10 + d/2, height-(d*(level+1)*.85)-10 + d/2);
  }
  
  */
  
}


