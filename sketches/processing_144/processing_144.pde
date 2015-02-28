



	PImage fly;
	PImage light;
	Wcreature d;
	Wcreature e;
///////////////////////////////////////////////////
public void setup(){
	size(600,600);
	 frameRate(30);
	 fly = loadImage("fly.jpg");
	light = loadImage("light.jpg");
	
	Vector3D a = new Vector3D(300,300,0);
	Vector3D b = new Vector3D(10,10,0);
	 d = new Wcreature(a, height, width);
	 e = new Wcreature(b, height, width);
}
//////////////////////////////////////////////////
public void draw(){
   background(0,0,0);
   fill(256,256,200);
   image(light,0,0);
  // ellipse(20,20,40,40);
 d.move();
 d.boundry();
 
 drawThem(d);
 e.move();
 e.boundry();
 
 drawThem(e);
 if(e.detect(d)) {e.fight(d);}
 if(d.detect(e)) {d.fight(e); }
// function to display
	  

  }
void drawThem(Wcreature C) {
    rectMode(CENTER);
    noStroke();
   // fill(204, 102, 0);
   image( fly,C.loc.x,C.loc.y);
    //rect(C.loc.x,C.loc.y,30,30);
   
    
  }



/////classes
public class Wcreature {

	  //*using private now to encapsulate data*//
	  public Vector3D loc;
	  public Vector3D speed;
    int height;
    int width;
    double fightPos=0;
    int fightDist=30;
	  //The Constructor (called when the object is first created)
	  Wcreature(Vector3D l, int _h, int _w) {
		   width = _w;
		   height = _h;
	       loc = l;
	       speed = new Vector3D(4,4,0);// give speed
	       
	  }

	  /*Add functions to our thing object to access the location, velocity and acceleration from outside the class*/
	 

	 //main function to operate object)
	  void go() {
	    
	  }

	  //function to update location
	  void move() {
     speed.x -= (int) random(2);
     speed.y -= (int) random(2);
     if (abs(speed.x)>20) speed.x = 0;
     if (abs(speed.y)>20) speed.y = 0;
     
	   loc.setX(loc.x + speed.x );
	   loc.setY(loc.y + speed.y );

	  }

	  void boundry() {
	    if ((loc.y > height) || (loc.y < 0))  {
	    	if (loc.y< 0) loc.y += 10;
	    	if (loc.y> height) loc.y -= 10;
	    	 speed.y =(speed.y * -1);
	    }
	    if ((loc.x < 0) || (loc.x> width)) {
	    	if (loc.x< 0) loc.x += 10;
	    	if (loc.x> height) loc.x -= 10;
	    	    speed.x =(speed.x * -1);
	    }
	  
	  }
	  
	  void fight(Wcreature w){
		fightPos = fightPos + 1;
		if (fightPos>360) fightPos = 0;
		loc.x = ((loc.x + w.loc.x)/2);
		//System.out.println(loc.x);
	    //System.out.println(loc.y);
		loc.y = ((loc.y + w.loc.y) / 2);
		loc.x += 10 * (java.lang.Math.cos((double)fightPos));
		loc.y += 10 * (java.lang.Math.sin((double)fightPos));
		
		
			
	  }
	  boolean detect(Wcreature w){
		  if (java.lang.Math.abs((this.loc.x) - (w.loc.x)) < fightDist
		  && java.lang.Math.abs((this.loc.y) - (w.loc.y)) < fightDist)
		      return true; else return false;
		  
	  }
	  


	}
	
	
	
	


public class Vector3D {
	  public float x;
	  public float y;
	  public float z;

	  Vector3D(float x_, float y_, float z_) {
	    x = x_; y = y_; z = z_;
	  }

	  Vector3D(float x_, float y_) {
	    x = x_; y = y_; z = 0f;
	  }
	  
	  Vector3D() {
	    x = 0f; y = 0f; z = 0f;
	  }

	  void setX(float x_) {
	    x = x_;
	  }

	  void setY(float y_) {
	    y = y_;
	  }

	  void setZ(float z_) {
	    z = z_;
	  }
	  
	  void setXYZ(float x_, float y_, float z_) {
	    x = x_;
	    y = y_;
	    z = z_;
	  }

	  void setXYZ(Vector3D v) {
	    x = v.x;
	    y = v.y;
	    z = v.z;
	  }
	  public float magnitude() {
	    return (float) Math.sqrt(x*x + y*y + z*z);
	  }

	  public Vector3D copy() {
	    return new Vector3D(x,y,z);
	  }

	  public  Vector3D copy(Vector3D v) {
	    return new Vector3D(v.x, v.y,v.z);
	  }
	  
	  public void add(Vector3D v) {
	    x += v.x;
	    y += v.y;
	    z += v.z;
	  }

	  public void sub(Vector3D v) {
	    x -= v.x;
	    y -= v.y;
	    z -= v.z;
	  }

	  public void mult(float n) {
	    x *= n;
	    y *= n;
	    z *= n;
	  }

	  public void div(float n) {
	    x /= n;
	    y /= n;
	    z /= n;
	  }
	  
	  /*public float dot(Vector3D v) {
	    //implement DOT product
	  }*/
	  
	  /*public Vector3D cross(Vector3D v) {
	    //implement CROSS product
	  }*/

	  public void normalize() {
	    float m = magnitude();
	    if (m > 0) {
	       div(m);
	    }
	  }

	  public void limit(float max) {
	    if (magnitude() > max) {
	      normalize();
	      mult(max);
	    }
	  }

	  public float heading2D() {
	    float angle = (float) Math.atan2(-y, x);
	    return -1*angle;
	  }

	  public  Vector3D add(Vector3D v1, Vector3D v2) {
	    Vector3D v = new Vector3D(v1.x + v2.x,v1.y + v2.y, v1.z + v2.z);
	    return v;
	  }

	  public Vector3D sub(Vector3D v1, Vector3D v2) {
	    Vector3D v = new Vector3D(v1.x - v2.x,v1.y - v2.y,v1.z - v2.z);
	    return v;
	  }

	  public  Vector3D div(Vector3D v1, float n) {
	    Vector3D v = new Vector3D(v1.x/n,v1.y/n,v1.z/n);
	    return v;
	  }

	  public  Vector3D mult(Vector3D v1, float n) {
	    Vector3D v = new Vector3D(v1.x*n,v1.y*n,v1.z*n);
	    return v;
	  }

	  public  float distance (Vector3D v1, Vector3D v2) {
	    float dx = v1.x - v2.x;
	    float dy = v1.y - v2.y;
	    float dz = v1.z - v2.z;
	    return (float) Math.sqrt(dx*dx + dy*dy + dz*dz);
	  }

	}







