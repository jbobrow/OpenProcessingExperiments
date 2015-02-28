
//G3DView.pde

class G3DView {

  // scale, rotation, translation
  public int gview_size=512;

  float[]gview_mov_keep=new float[3];
  float[]gview_mov={ 0,0,0,} ;
  float gview_zoom_keep=0;
  float gview_zoom=0;
  float[]gview_rot_keep=new float[16];
  float[]gview_rot={ 1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,};

  // mouse input
  int mdown_x,mdown_y;
  boolean key_down=false;
  boolean shift_down=false;
  boolean ctrl_down=false;
  boolean alt_down=false;
  float wheel_clicks=0;

  public G3DView() {
  }

  public void setup(int width,int height,int cube_size) {

    addMouseWheelListener(new java.awt.event.MouseWheelListener(){
	public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt){
	int clicks=evt.getWheelRotation();
	wheel_clicks+=float(clicks)/3;
	//loop();
	} } ); 

    gview_size = cube_size;

    //size() must be the first in the root setup() -- size( width, height, P3D ); //OPENGL
    //hint(DISABLE_DEPTH_TEST);
    //hint(DISABLE_OPENGL_ERROR_REPORT);
    textureMode(NORMALIZED);
    colorMode(RGB,255);
    noStroke();
    fill(0);

  }

  public void checkMouseWheel() {
    if (wheel_clicks != 0) {
      gview_zoom=gview_zoom-wheel_clicks; //float(mouseY-mdown_y)/5;
      gview_zoom=constrain(gview_zoom,-24,24);
      //gview_invalid = true;
      wheel_clicks=0;
    }
  }

  void mousePressed()
  {

    mdown_x = mouseX;
    mdown_y = mouseY;

    gview_zoom_keep = gview_zoom;
    arraycopy(gview_mov,gview_mov_keep);
    arraycopy(gview_rot,gview_rot_keep);

  }

  void mouseDragged()
  {
    if (ctrl_down||mouseButton==RIGHT) {
      gview_zoom=gview_zoom_keep-float(mouseY-mdown_y)/5;
      gview_zoom=constrain(gview_zoom,-24,24);
      return;
    }
    if (shift_down||mouseButton==CENTER ) {
      float sf = pow(1.1,gview_zoom);
      float mov_h=(mouseX-mdown_x)/sf;
      float mov_v=(mouseY-mdown_y)/sf;
      float[]obj_x=new float[4],obj_y=new float[4],obj_z=new float[4];
      matVecMult(gview_rot,new float[]{
	  1,0,0,1,            }
	  ,obj_x);
      matVecMult(gview_rot,new float[]{
	  0,1,0,1,            }
	  ,obj_y);
      matVecMult(gview_rot,new float[]{
	  0,0,1,1,            }
	  ,obj_z);
      gview_mov[0]=gview_mov_keep[0]+(obj_x[0]*mov_h+obj_x[1]*mov_v);
      gview_mov[1]=gview_mov_keep[1]+(obj_y[0]*mov_h+obj_y[1]*mov_v);
      gview_mov[2]=gview_mov_keep[2]+(obj_z[0]*mov_h+obj_z[1]*mov_v);
      return;
    }
    {
      float rot_h=float(mouseX-mdown_x)/5;
      float rot_v=float(mouseY-mdown_y)/5;
      float ct1=cos(radians(-rot_v));	// rot around x
      float st1=sin(radians(-rot_v));
      float[] mat1={
	1,0,0,0,0,ct1,-st1,0,0,st1,ct1,0,0,0,0,1,            };
      float ct2=cos(radians(rot_h));	// rot around y
      float st2=sin(radians(rot_h));
      float[] mat2={
	ct2,0,st2,0,0,1,0,0,-st2,0,ct2,0,0,0,0,1,            };
      matMult(mat1,gview_rot_keep,gview_rot);
      matMult(mat2,gview_rot,gview_rot);
      return;
    }
  }


  // 256x256x256
  void draw()
  {

    pushMatrix();
    pushStyle();

    colorMode(RGB,255);

    background(color(255,255,255,191));

    float fov = PI/8;	// almost ortho
    float camdist = gview_size / abs(atan(fov / 2));

    camera( 0, 0, camdist, 0,0,0, 0,1,0);

    perspective(fov, float(width)/float(height), camdist/2, camdist*2);
    //ortho(-5120,5120,-5120,5120,camdist/2,camdist*2);

    float sf = pow(1.1,gview_zoom);

    applyMatrix(
	gview_rot[0],gview_rot[1],gview_rot[2],gview_rot[3],
	gview_rot[4],gview_rot[5],gview_rot[6],gview_rot[7],
	gview_rot[8],gview_rot[9],gview_rot[10],gview_rot[11],
	gview_rot[12],gview_rot[13],gview_rot[14],gview_rot[15] );
    scale(sf);
    translate(gview_mov[0],gview_mov[1],gview_mov[2]);

    int xmax=gview_size,ymax=gview_size,zmax=gview_size;

    // 3 axis : X=R,-Z=G,-Y=B
    rotateX(radians(90));
    scale(1,-1,1);
    translate(-0.5*xmax,-0.5*ymax,-0.5*zmax);

    stroke(255,0,0); 
    line(0,0,0,xmax,0,0); //X
    stroke(0,255,0); 
    line(0,0,0,0,ymax,0); //Y
    stroke(0,0,255); 
    line(0,0,0,0,0,zmax); //Z

    // scale along x,y,z;
    int scalesize=10;

    // along x
    for (int i=0;i<xmax;i+=20) {
      stroke(64); 
      line(i,0,0,i,-scalesize,0); // direction: -Y
      stroke(64); 
      line(i,0,0,i,0,-scalesize); // direction: -Z
    }
    // along y
    for (int i=0;i<ymax;i+= 20) {
      stroke(64); 
      line(xmax,i,0,xmax+scalesize,i,0); // direction: +X
      stroke(64); 
      line(xmax,i,0,xmax,i,-scalesize); // direction: -Z
    }
    // along z
    for (int i=0;i<zmax;i+= 20) {
      stroke(64); 
      line(0,0,i,-scalesize,0,i); // direction: -X
      stroke(64); 
      line(0,0,i,0,-scalesize,i); // direction: -Y
    }

    // surrounding box

    stroke(64); 
    line(0,0,zmax,xmax,0,zmax);
    stroke(64); 
    line(0,ymax,0,xmax,ymax,0);
    stroke(64); 
    line(0,ymax,zmax,xmax,ymax,zmax);

    stroke(64); 
    line(0,0,zmax,0,ymax,zmax);
    stroke(64); 
    line(xmax,0,0,xmax,ymax,0);
    stroke(64); 
    line(xmax,0,zmax,xmax,zmax,ymax);

    stroke(64); 
    line(0,ymax,0,0,ymax,zmax);
    stroke(64); 
    line(xmax,0,0,xmax,0,zmax);
    stroke(64); 
    line(xmax,ymax,0,xmax,ymax,zmax);

    g3Objects();	//callback

    popStyle();
    popMatrix();

  }





  public void translate_center() {
    translate(gview_size/2,gview_size/2,gview_size/2);
  }



  void matMult(float[]a,float[]b,float[]c)
  {
    float[]t=new float[16];
    for (int row=0;row<4;row++) {
      for (int col=0;col<4;col++) {
	t[row*4+col]=
	  a[row*4+0]*b[0*4+col]+
	  a[row*4+1]*b[1*4+col]+
	  a[row*4+2]*b[2*4+col]+
	  a[row*4+3]*b[3*4+col]+
	  0;
      }
    }
    arraycopy(t,c);
  }

  void matVecMult(float[]a,float[]v,float[]v2)
  {
    float[]t=new float[4];
    for (int row=0;row<4;row++) {
      t[row]=
	a[row*4+0]*v[0]+
	a[row*4+1]*v[1]+
	a[row*4+2]*v[2]+
	a[row*4+3]*v[3]+
	0;
    }
    arraycopy(t,v2);
  }





};


