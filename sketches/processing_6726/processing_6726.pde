
// represents one of the smaller spheres

class atom {
  public float lat,lon;
  private float dlat,dlon;
  private color col;
  private float speed=1/20.0;
  
  public atom() {
    lat=random(0,TWO_PI);
    lon=random(0,PI);
    dlat=random(0,TWO_PI)*speed;
    dlon=random(0,PI)*speed;
    col=color(random(0,255),random(0,255),random(0,255));
  }
  
  public atom(float _lat,float _lon) {
    lat=_lat;
    lon=_lon;
    dlat=random(0,PI)*speed;
    dlon=random(0,TWO_PI)*speed;
    col=color(random(0,255),random(0,255),random(0,255));
  }
  
  public void move(){
    // use Perlin Noise to move
    lat+=speed*noise(dlat*0.005+frameCount,dlon*0.005+frameCount);
    lon+=speed*noise(dlat*0.006+frameCount,dlon*0.006+frameCount);
  }
  
  public void draw() {
    noStroke();
    fill(255);
    color(255);
    float x=R*cos(lat)*cos(lon);
    float y=R*cos(lat)*sin(lon);
    float z=R*sin(lat);
    
    pushMatrix();
    translate(x,y,z);
    fill(col);
    sphereDetail(5);
    sphere(20);
    popMatrix();
    
  }
  
}


