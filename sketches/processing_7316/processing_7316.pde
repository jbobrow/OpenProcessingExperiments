
ArrayList points = new ArrayList();


void setup(){
  size(800,600);
  background(255);
  smooth();

}



void draw(){


  for(int c=points.size()-1; c>=0; c--){
    Point p = (Point)points.get(c);
    if(p.done){
      points.remove(c);
    }
    else{
      p.update();
    }
  }

  println(points.size());

}


void mousePressed(){
  float shift = random(-10,10), speed = random(1.2,2.5);
  color col = color(255,48);

  for( float i=.5; i<1.5; i+=.1){
    for( int c=0; c<360; c+=10){
      points.add( new Point(mouseX,mouseY,cos(radians(c+shift))*speed*i/3,sin(radians(c+shift))*speed*i/3, col) );
    }
  }

}

void keyPressed(){
  if(keyCode==ENTER){
    //saveFrame("ElectronMicroscope####.png");
  }
  else if(keyCode == SHIFT){
    for(int c=points.size()-1; c>=0; c--){
      points.remove(c);
    }
    background(255);
  }
}


class Point {

  float x,y,xv,yv,r=random(10,13);
  float shrinkRate;
  boolean done = false;
  float timer = 10;
  color c;// = color(random(200,255), 100,0,48);


  Point(float x, float y, float xv, float yv, color c){
    this.x = x;
    this.y = y;
    this.xv = 11*xv/10;
    this.yv = 11*yv/10;
    this.shrinkRate = random(.995,.999);
    this.c = c;

  }

  void update(){

    if(this.r>0){
      this.r *= shrinkRate;
    }
    this.xv *= .999;
    this.yv *= .999;

    this.xv += random(-.04,.04);
    this.yv += random(-.04,.04);
    timer -= random(.01,.1);
    if(timer <= 0){
      this.done = true;
    }


    //this.xv = noise(this.x*.02-PI/4,this.y*.02)*2-1;
    //this.yv = noise(this.x*.02+PI/4,this.y*.02)*2-1;


    this.x+=this.xv;
    this.y+=this.yv;

    fill(0,64);
    stroke(c);//255,48);

    ellipse(this.x,this.y,this.r,this.r);   

  }

}





