
	  Ball[] mBall;
	  int ballCount=10;
      int blocksize=10;

	public void setup()	{	  size(800,400,P3D);
	
	zVal=new float[(width)*(height)];
	colVal=new int[(width)*(height)];
	
	  mBall= new Ball[ballCount]; 
	  for (int i = 0; i < ballCount; ++i){  mBall[i]=new Ball(); }
 
	   cameraZ = ((height/2.0f) / tan(PI*60.0f/360.0f));
	   near= cameraZ/10.0f;
	   far=cameraZ*10.0f;
	}


	public void draw()	{ background(204);
	  noStroke();
	  	  lights();
  pushMatrix();
	  translate(width/4.0f,-height*.2f,-height/2.0f);
	  fill(0,0,255);
	  box(width*.50f,3,300);
	  translate(0,height*0.7f,-130);
	  fill(0,255,0);
	  box(width*.50f,height*1.4f,3);
	  translate(0,height*0.7f,130);
	  fill(255,0,0);
	  box(width*.50f,3,300);
	  popMatrix();
 
	  for (int i = 0; i < ballCount; ++i){		  mBall[i].draw();	  }
  stroke(0);
  drawSurface();
line(width/2,0,width/2,height);
	}
	 float cameraZ,near,far;
	float normalizedZ(float z){
		  float worldZ = 2.0f*far*near/(((z - 0.5f) * 2.0f)*(far-near)-(far+near));
		  return cameraZ + 		worldZ;		
	}
	  float[] zVal;
	  int[] colVal;
	public void drawSurface(){
		PGraphics3D p3d = (PGraphics3D) g;
	    pushMatrix(); 
		translate(width*.65f,  height/2 ,camHeight);
	  for (int i = 0; i < 3; ++i)	  {	    lastRots[i] += 0.5*(curRots[i] - lastRots[i]);  }
	  rotateX(lastRots[0]);  rotateY(lastRots[2]);
	  for (int x = 1; x < (width); x+=blocksize) {
			for (int y = 1; y < (height); y+=blocksize) {
				int i=x*height+y;
		 zVal[i] =  normalizedZ(p3d.zbuffer[ x + (width) * y]);
		 colVal[i] =  get(x , y);
				 }}
//				 background(0);
				 
for (int x = 1; x < (width/2); x+=blocksize) {
	for (int y = 1; y < (height); y+=blocksize) {
		  /* import java.nio.*;  import javax.media.opengl.*; 
		  PGraphicsOpenGL pogl = (PGraphicsOpenGL) g; FloatBuffer zbuff = FloatBuffer.allocate(1);
		  pogl.gl.glReadPixels( x, y, 1, 1, GL.GL_DEPTH_COMPONENT, GL.GL_FLOAT, zbuff);  float zVal = zbuff.get();*/
//float zVal =  normalizedZ(p3d.zbuffer[ x + (width) * y]);
		int i=x*height+y;
 if (zVal[i] < 0.0) {		
	    		  fill(colVal[i]);      
	    		  pushMatrix(); 
	    		  translate(x-width/4, y-height/2, zVal[i]+200);
		          box(blocksize);
			      popMatrix();  
	      }
	    }}
	  popMatrix();  
	}

	
	public float lastRots[] = new float[3];

	 float camHeight=-20;
		public float camX = 0;
		public float camY = 0;
		public float curRots[] = new float[3];

	
	public void mouseDragged() {
		  if (mouseX>0&&mouseX<width&&mouseY>0&&mouseY<height&&pmouseX>0&&pmouseX<width&&pmouseY>0&&pmouseY<height) {
		  if (mouseButton==RIGHT) camHeight-=pmouseX -mouseX;
	  else  {   
	    camX += mouseX - pmouseX;    camY += mouseY - pmouseY;
	    curRots[0] = -camY * 1.5f*PI/(float)(height/2);
	    curRots[2] = camX * 1.5f*PI/(float)(width/2);
	  }}
	}
	
class Ball{		float x,y,z,size;	int r,g,b;
	Ball(){
		size=random(40)+40;
		x=random(width/2)-size/2;
		y=random(height);
		z=random(-width/3f)-100;
		r=(int)random(255);
		g=(int)random(255);
		b=(int)random(255);	}
		
	void draw(){
		y+=2; if(y>height+size/2)y=0;
		fill(r,g,b);
		pushMatrix(); 
		translate(x,y,z);
		sphere(size);
	    popMatrix(); }
}
	

