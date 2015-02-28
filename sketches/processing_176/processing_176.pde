
/*involuto()
  creates an involuted flow. this objects is randomly trailing, 
  it controls by a mouse position
*/

class involuto{
  float x,y; //base position
  float xp,yp; //position [called by pointer]
  float radmo,themo; //controlled by mouse position
  
  float thtv; //theta velocity
  
  int tm; //timecount
  int tmv=int(random(5,25)); //velocity
  
  float thtm; //time-based theta
  
  involuto(){
    //no constructors here
  }
  
  void trail(){
    xp=mouseX+sin(pt.xp);
    yp=mouseY+sin(pt.yp);
    
    radmo=sqrt(sq(250-xp)+sq(250-yp));
    themo=atan2(250-xp,250-yp)*(180/PI);
    
    thtv=random(-10,10);
    themo+=thtv;
    thtv*=random(0.995,1.005);
    
    tm+=tmv*0.1;
    thtm=tmv*sin(tm);
    
    x=xp+radmo*cos(PI/180*(themo+thtm));
    y=yp+radmo*sin(PI/180*(themo+thtm));
    
    for(int a=0;a<tmv;a++){
      stroke(0,0,0,32);
      point(x-(x-xp)*sin(a),y-(y-yp)*sin(a));
    }
  }
}

