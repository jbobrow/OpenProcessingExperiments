
ArrayList p = new ArrayList();

void setup(){
  size(900,600,P3D);
  background(255);
  //smooth();
  colorMode(HSB,360,255,255);
  //noStroke();
}

void mousePressed(){
  for(int i=0; i<1; i++){
    //float r = random(400);
    p.add(new Point());
  }
}

void keyPressed(){
  switch(key){
  case 'c':
    for(int i=p.size()-1; i>=0; i--){
      p.remove(i);
    }
    break;
  case 'v':
    background(360);
    break;
  case 's':
    //saveFrame( "SpringyPoints####.png" );
    break;
  }
}
void draw(){


  //lights();
  //background(360);
  for(int q=0; q<40; q++){
    //background(360);
    //rotateY(.1);
    for(int i = 0; i<p.size()-1; i++){
      for(int c = i+1; c<p.size(); c++){
        Point k = (Point)p.get(i);
        Point j = (Point)p.get(c);

        if(k.done){
          p.remove(k);
        }
        else{
          k.update();
        }
        if(j.done){
          p.remove(j);
        }
        else{
          j.update();
        }

        //float d=dist(j.x,j.y,j.z, k.x,k.y,k.z);        //if(dx<50){
        //if(d<4000){
        float mlt = .001;
        k.xv += (j.x-k.x)*mlt;
        k.yv += (j.y-k.y)*mlt;
        k.zv += (j.z-k.z)*mlt;

        j.xv += (k.x-j.x)*mlt;
        j.yv += (k.y-j.y)*mlt;
        j.zv += (k.z-j.z)*mlt;
        //}

      }
    }
  }

}

class Point{

  float x=random(mouseX,mouseX), y=random(mouseY,mouseY), z=random(-1,1), xv=0, yv=0, zv=0;
  float s = 10, osc = random(0,.005);
  color c = color(random(0,360),0,random(255,255));


  boolean done = false;

  Point(){
  } 

  void update(){

    /*this.xv = constrain(this.xv,-1,1);
     this.yv = constrain(this.yv,-1,1);
     this.zv = constrain(this.zv,-1,1);*/
    
    //this.s = sin(millis()*this.osc*1)*10 + noise(this.x*.01, this.y*.01)*0;
    

    this.x += this.xv;
    this.y += this.yv;
    this.z += this.zv;
    if(this.s<1){
      //this.done = true;
    }

    //this.c = color( noise(this.x*.01, this.y*.01)*360,255,255);//color(sin(millis()*this.osc)*360,255,255);

    fill(this.c);
    //noStroke();
    strokeWeight(1);
    pushMatrix();
    translate(this.x,this.y,this.z);
    //rotateX( .1 );
    ellipse(0,0,this.s,this.s);
    //line(0,0,0, this.xv,this.yv,this.zv);
    popMatrix();

  }
}










