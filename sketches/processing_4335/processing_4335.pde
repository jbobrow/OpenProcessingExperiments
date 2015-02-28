
class Cube{
  float x,y,z,l,h,s,step,top,bottom=0;
  
  Cube(float x, float y, float l){
    this.x=x; this.y=y; this.l=l;
    top=random(20,300);
    step=random(1,3);
    z= bottom;
    h= random(255); s=55+ random(200);
  }
  
  void move(){
    fill(h,s,map(z,0,300,30,255));
    pushMatrix(); translate(x,y,z); box(l,l,l); popMatrix();
    z+=step;
    if(z>top){
      step=-(random(1,3));
    }else if (z<bottom){
      top=random(50,300);
      h= random(255); s= random(255);    
      step=(random(1,3));
    }
  }
}
    

