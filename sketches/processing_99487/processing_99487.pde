
ArrayList objects;

ArrayList points;

void setup(){
  size(800,600);
  background(237);
  smooth();
  objects = new ArrayList();
  points = new ArrayList();
  
  for(int i = 0; i < 20; i++){
    new Object(random(360),random(360),random(360),5);
  }
  
  
}
void draw(){
  background(237);
  textSize(32);
  stroke(150);
  text(objects.size(), 10, 30); 
  fill(230);
  noStroke();
  ellipse(400,300,360,360);
  
  for(int i = 0; i  < points.size(); i++){
    Point o = (Point) points.get(i);
    fill(255,0,0,110);
    noStroke();
    ellipse(o.x,o.y,2,2);
    fill(255,0,0,3);
    ellipse(o.x,o.y,50,50);
    fill(255,0,0,1);
    ellipse(o.x,o.y,150,150);
  }
  
  for(int i = 0; i  < objects.size(); i++){
    Object o = (Object) objects.get(i);
    boolean safe = true;
    int z = 0;
    for(z = 0; z  < objects.size(); z++){
      Object oz = (Object) objects.get(z);
      if(oz != o && oz.freezone < 0){
        if(abs(oz.xr-o.xr) < max(o.size,oz.size) && abs(oz.yr-o.yr) < max(o.size,oz.size)){
          fill(0);
          safe = false;
          break;
        } else {
          safe = true;
        }
      }
    }
    
    if(safe == true){
      o.run();
    } else {
      //for(int n = 0; n < 3; n++){
        new Object(o.xr,o.yr,random(360),o.size-1);
        new Object(o.xr,o.yr,random(360),o.size-1);
        new Object(o.xr,o.yr,random(360),o.size-1);
        new Object(o.xr,o.yr,random(360),o.size-1);
      //}
        
      float x1 = cos(radians(o.xr))*200;
      float y1 = sin(radians(o.xr))*20;
      float r1 = sqrt(x1*x1+y1*y1);
      float x2 = x1+sin(radians(o.yr));//*((y1));
      float y2 = cos(radians(o.yr))*((10*y1));
      
      stroke(255,0,0,10);
      
      if(  (o.xr > 0 && o.xr < 180) || (o.yr > 0 && o.yr < 180) ){
          
          new Point(round(400+x2),round(300+y2));
      
      }
      objects.remove(i);
      objects.remove(z);

    }
  }
  
}

class Point {
  float x;
  float y;
  Point(float sxr,float syr){
    x = sxr;
    y = syr;
    points.add(this);
  }
}

class Object {

  float xr = 80;
  float yr = 80;
  float dir = 0;
  int freezone = 100;
  float size = 10;
  
  float lx = 0;
  float ly = 0;
  
  Object(float sxr, float syr, float d, float s){
    objects.add(this);
    xr = sxr;
    yr = syr;
    dir = d;
    size = s;
    if(size < 1){
      size = 1;
    }
  }
  
  void run(){   
    freezone--;
    xr += cos(radians(dir));
    yr += sin(radians(dir));
  
    float x1 = cos(radians(xr))*200;
    float y1 = sin(radians(xr))*20;
    float r1 = sqrt(x1*x1+y1*y1);
    float x2 = x1+sin(radians(yr));//*((y1));
    float y2 = cos(radians(yr))*((10*y1));
    
    //line(100,100,100+cos(radians(xr))*h,100+sin(radians(xr))*h);
    if(xr >= 360){
      xr = 0;
    }
    if(yr >= 360){
      yr = 0;
    }
    if(  (xr > 0 && xr < 180) || (yr > 0 && yr < 180) ){
      if(lx != 0 && ly != 0){
        stroke(0,0,0,20);
        line(round(lx),round(ly),round(400+x2),round(300+y2));
      }
      //fill(0,0,0,max((size/5)*255,200));
      fill(0,0,0);
      noStroke();
      ellipse(round(400+x2),round(300+y2),size,size);

    }
    lx = 400+x2;
    ly = 300+y2;
  }
  
}

void drawNoise(){
  for(int y = 0; y < 600; y++){
    for(int x = 0; x < 800; x++){
      stroke(random(255),19);
      point(x,y);
    }
  }
}
