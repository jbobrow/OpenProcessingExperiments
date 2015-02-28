
class flamer{
  float fflow; //flow of flamers
  float fcn; //flamer counter
  
  float x,y; //position
  float xp,yp; //mouse position
  float radmo; //radius
  float themo; //theta
  
  int style=int(random(8)); //variation of flamer styles
  
  flamer(float fflow0,float fcn0){
    //construct this
    fflow=fflow0;
    fcn=fcn0;
  }
  
  void interact(){
    //control that
    xp=mouseX+sin(pt.xp);
    yp=mouseY+sin(pt.yp);
    
    radmo=sqrt(sq((width/2)-xp)+sq((height/2)-yp));
    themo=atan2((width/2)-xp,(height/2)-yp);
    
    if(random(100)>95){
      radmo*=(1-fcn);
      themo+=fcn;
    }else{
      radmo*=(1+fcn);
      themo-=fcn;
    }
    
    x=xp+radmo*cos(themo)-fflow;
    y=yp+radmo*sin(themo)-fflow;
  }
  
  void trail(){
    for(int a=0;a<nmb;a++){ 
      stroke(255,48);
      if(style==1){
        //draw first painter
        point(x-(x-xp)*sin(a),y-(y-yp)*sin(a));
      }else if(style==2){
        //draw second painter
        point(x-(x-xp)*cos(a),y-(y-yp)*cos(a));
      }else if(style==3){
        //draw third painter
        point(x-(x-xp)*tan(a),y-(y-yp)*tan(a));
      }else{
        //draw another painter
        point(x-(x-xp)*random(-1.0,1.0),y-(y-yp)*random(-1.0,1.0));
      }
    }
  }
}

