
// wobbling.pde
// http://openprocessing.org/visuals/?visualID=1329
// 
//import processing.opengl.*;

/// [[[ DND
import java.awt.dnd.*;
import java.awt.datatransfer.*;
String dropfile_=null;
/// ]]] DND

boolean debug_=false;

boolean btndown_=false;
int mdownx_,mdowny_;
int wheelclicks_=0;
boolean altdown_=false;

boolean newimg_=false;
int picwidth_,picheight_;
PImage img_;
int imgcenx_,imgceny_;
int imgsf_=0;

final int nx_=20,ny_=30;	// 320x480
float[]px=new float[4],	// corners
  py=new float[4],
  kx=new float[nx_*ny_],	// knots
  ky=new float[nx_*ny_],
  vx=new float[nx_*ny_],	// velocity
  vy=new float[nx_*ny_],
  wx=new float[nx_*ny_],	// knots wobbling
  wy=new float[nx_*ny_];

int ringlocked_=-1;
int ringselect_=-1;
boolean showrings_=true;
final int maxrings=10;
float[]rx=new float[maxrings],
  ry=new float[maxrings],
  rR=new float[maxrings];

final int tbwidth_=240,tbheight_=64;
int tbleft_,tbtop_;
int tbsel_=-1;

void setup()
{

  addMouseWheelListener(new java.awt.event.MouseWheelListener(){public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt){int clicks=evt.getWheelRotation();wheelclicks_+=clicks;redraw();}}); 
  dnd_init();

  size(320,480,P3D); //(online||(platform==LINUX))?P3D:OPENGL);
  hint(DISABLE_DEPTH_TEST);
  hint(DISABLE_OPENGL_ERROR_REPORT);
  //hint(ENABLE_ACCURATE_TEXTURES); ///XXX no good for P3D
  textureMode(IMAGE); //(NORMALIZED);
  ellipseMode(CENTER);
  textMode(SCREEN);

  tbleft_=(width-tbwidth_)/2;
  tbtop_=height-tbheight_-5;

  PFont font14=createFont("DialogInput.bold",14);
  textFont(font14);

  if(online||!load_config(myDataPath("wobbling.cfg"))){
    /// "http://openphoto.net//volumes/aptec/20071210/openphotonet_Raindrops2.jpg"
    setImage(myDataPath("openphotonet_Raindrops2.jpg"),320,480); //setImage(null,320,480);
    // demo initial setting
    rx[0]=128;ry[0]=237;rR[0]=32;
    rx[1]=219;ry[1]=140;rR[1]=20;
  }

  noLoop();
}

void draw()
{
  if (newimg_) {
    try{
      String newfile=selectInput("Select an image file");
      if(null!=newfile&&newfile.endsWith(".cfg")){
	load_config(newfile);
      }else{
	setImage(newfile,width,height);
      }
      backup_config();
    }catch(Exception e){
      println("setImage() error");
    }
    newimg_=false;
  }
  if (wheelclicks_!=0) {
    if (ringselect_!=-1) {
      rR[ringselect_]=constrain(rR[ringselect_]-wheelclicks_,5,100);
    } else /*if (showrings_)*/ {
      zoomImage(wheelclicks_);
    }
    wheelclicks_=0;
  }

  if(dropfile_!=null){
      setImage(dropfile_,width,height);
      dropfile_=null;
      backup_config();
  }

  if (!btndown_) {
    float vsum = animate(0.1);
    if (vsum<0.001) {
///      println("animate stop");
      noLoop();
    }
  }

  background(255);
  pushMatrix();
  translate((width-picwidth_)/2,(height-picheight_)/2);
  drawShape();
  if (showrings_)
    drawRings();
  popMatrix();

  drawToolbar();

  if (altdown_) {
    noStroke();
    fill(255,255,255,64);
    int dx=mouseX-width/2;
    int dy=mouseY-height/2;
    ellipse(width/2+dx,height/2+dy,60,60);
    ellipse(width/2-dx,height/2-dy,60,60);
  }

}

void mouseMoved()
{
  if (!showrings_) {
    int fx=mouseX-pmouseX,fy=mouseY-pmouseY;
    if (max(abs(fx),abs(fy))>2) {
      drag2(fx,fy);
      loop();
    }
  }
  redraw();
}

void mousePressed()
{
  btndown_=true; mdownx_=mouseX; mdowny_=mouseY;
  tbsel_=mouse_over_tb();
  if(tbsel_==-1&&!altdown_){
    ringlocked_=ringselect_=mouse_over_ring();
  }
  loop();
}

void mouseDragged()
{
  if (ringlocked_!=-1) {
    // mapping for: translate((width-picwidth)/2,(height-picheight)/2);
    float mx=mouseX-float(width-picwidth_)/2;
    float my=mouseY-float(height-picheight_)/2;
    rx[ringlocked_]=mx;
    ry[ringlocked_]=my;
  } else if (altdown_) {
    float d0=dist(width/2,height/2,mdownx_,mdowny_);
    float d1=dist(width/2,height/2,mouseX,mouseY);
    wheelclicks_=-int(d1-d0);
    mdownx_=mouseX;
    mdowny_=mouseY;
  } else {
    moveImage(mouseX-mdownx_,mouseY-mdowny_);
    mdownx_=mouseX;
    mdowny_=mouseY;
  }
  redraw();
}

void mouseReleased()
{
  btndown_=false;
  ringlocked_=-1;
  if (tbsel_!=-1) {
    if(1==tbsel_) newimg_=true;
    if(2==tbsel_) addRing();
    if(3==tbsel_) removeRing();
    if(4==tbsel_) { showrings_=!showrings_; if(!showrings_)save_config(); }
    tbsel_=-1;
  }
  redraw();
}

void keyPressed()
{
  if (CODED==key) { if (ALT==keyCode) { altdown_=true; } }
  loop();
}

void keyReleased()
{
  if (CODED==key) { if (ALT==keyCode) { altdown_=false; } }
  if ('g'==key) { debug_=!debug_; }
  redraw();
}

///////////////////////////
///////////////////////////
///////////////////////////

String imgUrl_=null;

void setImage(String filename,int ww,int hh)
{
  cursor(WAIT);
  PImage newimage=loadImage(filename);
  if (null==newimage) {
    println("*** loadImage failed ***");
    newimage=createImage(max(ww,hh),max(ww,hh),RGB);
    newimage.loadPixels();
    for(int yy=0;yy<newimage.height;yy++){
      for(int xx=0;xx<newimage.width;xx++){
	newimage.pixels[xx+newimage.width*yy]=(xx/32%2==0)^(yy/32%2==0)?color(255):color(0);
      }
    }
    newimage.updatePixels();
  }
  imgUrl_=filename;
  img_=newimage;
  picwidth_=ww; picheight_=hh;
  imgcenx_=img_.width/2; imgceny_=img_.height/2; imgsf_=0;
  println("setImage: "+img_.width+","+img_.height);
  if (img_.width<picwidth_||img_.height<picheight_){
    float lim=max(picwidth_/float(img_.width),picheight_/float(img_.height));
    imgsf_=int(log(lim)*30);
  }
  initShape(0,0,picwidth_,picheight_);

  showrings_=false; //true;

  cursor(ARROW);
}

void initShape(int xx,int yy,int ww,int hh)
{

  px[0] = xx;	
  py[0] = yy;
  px[1] = xx;	
  py[1] = py[0]+hh;
  px[2] = px[0]+ww;		
  py[2] = py[0]+hh;
  px[3] = px[0]+ww;		
  py[3] = yy;

  for (int row=0;row<ny_;row++) {
    float rr1=float(row)/(ny_-1);
    float xx1=lerp(px[0],px[1],rr1);
    float yy1=lerp(py[0],py[1],rr1);
    float xx2=lerp(px[3],px[2],rr1);
    float yy2=lerp(py[3],py[2],rr1);
    for (int col=0;col<nx_;col++) {
      float cc=float(col)/(nx_-1);
      float xx5=lerp(xx1,xx2,cc);
      float yy5=lerp(yy1,yy2,cc);
      int ii=col+row*nx_;
      kx[ii]=xx5;
      ky[ii]=yy5;
    }
  }

  for (int ii=0;ii<vx.length;ii++) {
    wx[ii]=kx[ii]; wy[ii]=ky[ii]; vx[ii]=vy[ii]=0;
  }

  for (int i=0;i<maxrings;i++) {
    rx[i]=ry[i]=-9999; rR[i]=48;
  }

}

void drawShape()
{
  float imgzoom=exp(imgsf_/30.0);
  noStroke(); if (debug_) { stroke(128); }
  beginShape(TRIANGLE_STRIP);
  texture(img_);
  for (int row=0;row<ny_-1;row++) {
    float rr1=picheight_*((row)/float(ny_-1)-0.5)/imgzoom+imgceny_;
    float rr2=picheight_*((row+1)/float(ny_-1)-0.5)/imgzoom+imgceny_;
    for (int col=0;col<nx_;col++) {
      int zc=(0==row%2)?col:(nx_-1-col);
      float cc=picwidth_*((zc)/float(nx_-1)-0.5)/imgzoom+imgcenx_;
      int ii1=zc+row*nx_;
      int ii2=zc+(row+1)*nx_;
      float xx5=wx[ii1],yy5=wy[ii1];
      float xx6=wx[ii2],yy6=wy[ii2];
      vertex(xx5,yy5,cc,rr1);
      vertex(xx6,yy6,cc,rr2);
    }
  }
  endShape();
}

void drawRings()
{
  noStroke();
  for(int i=0;i<maxrings;i++) {
    final float alpha=ringselect_==i?128:64;
    final color c1=color(255,0,255,alpha),c2=color(255,255,255,alpha);
    fill(c1); ellipse(rx[i],ry[i],rR[i]*2*1.0,rR[i]*2*1.0);
    fill(c2); ellipse(rx[i],ry[i],rR[i]*2*0.8,rR[i]*2*0.8);
    fill(c1); ellipse(rx[i],ry[i],rR[i]*2*0.6,rR[i]*2*0.6);
    fill(c2); ellipse(rx[i],ry[i],rR[i]*2*0.4,rR[i]*2*0.4);
  }
}

void addRing()
{
  for(int i=0;i<maxrings;i++){
    if(rx[i]<0||ry[i]<0) {
      rx[i]=width/2; ry[i]=height/2;
      ringselect_=i;
      break;
    }
  }
}

void removeRing()
{
  if (-1!=ringselect_) {
    rx[ringselect_]=ry[ringselect_]=-9999;
  }
}

int mouse_over_ring()
{
  if (showrings_) {
    // mapping for: translate((width-picwidth)/2,(height-picheight)/2);
    float mx=mouseX-float(width-picwidth_)/2;
    float my=mouseY-float(height-picheight_)/2;
    for(int i=maxrings-1;i>=0;i--) {
      float d=dist(rx[i],ry[i],mx,my);
      if(d<rR[i]){
	return i;
      }
    }
  }
  return -1;
}

///////////////////////////
///////////////////////////
///////////////////////////

void moveImage(int xx,int yy)
{
  println("move "+xx+","+yy);
  int oldcenx=imgcenx_,oldceny=imgceny_;
  float imgzoom=exp(imgsf_/30.0);
  xx=int(xx/imgzoom); yy=int(yy/imgzoom);
  int minxx=int(picwidth_/imgzoom/2);
  int maxxx=img_.width-int(picwidth_/imgzoom/2);
  int minyy=int(picheight_/imgzoom/2);
  int maxyy=img_.height-int(picheight_/imgzoom/2);
  imgcenx_=constrain(imgcenx_-xx,minxx,maxxx);
  imgceny_=constrain(imgceny_-yy,minyy,maxyy);
  for(int jj=0;jj<maxrings;jj++){
    rx[jj]-=(imgcenx_-oldcenx)*imgzoom;
    ry[jj]-=(imgceny_-oldceny)*imgzoom;
  }
  println("new cen "+imgcenx_+","+imgceny_);
}

void zoomImage(int clicks)
{
  println("zoom "+clicks);
  int oldcenx=imgcenx_,oldceny=imgceny_,oldsf=imgsf_;
  float lim=max(picwidth_/float(img_.width),picheight_/float(img_.height));
  imgsf_=constrain(imgsf_-clicks,int(log(lim)*30),60);
  float imgzoom=exp(imgsf_/30.0);
  imgcenx_=constrain(imgcenx_,int(picwidth_/imgzoom/2),img_.width-int(picwidth_/imgzoom/2));
  imgceny_=constrain(imgceny_,int(picheight_/imgzoom/2),img_.height-int(picheight_/imgzoom/2));
  for(int jj=0;jj<maxrings;jj++){
    float oldzoom=exp(oldsf/30.0);
    rx[jj]=(rx[jj]-picwidth_/2)/oldzoom*imgzoom+picwidth_/2;
    ry[jj]=(ry[jj]-picheight_/2)/oldzoom*imgzoom+picheight_/2;
    rR[jj]=rR[jj]/oldzoom*imgzoom;
    rx[jj]-=(imgcenx_-oldcenx)*imgzoom;
    ry[jj]-=(imgceny_-oldceny)*imgzoom;
  }
}

void drag2(float dragx,float dragy)
{
  float dragabs=dist(0,0,dragx,dragy);
  dragx=constrain(dragx,-64,64);
  dragy=constrain(dragy,-64,64);
  for(int ii=0;ii<nx_*ny_;ii++){
    float bb=0;
    for(int jj=0;jj<maxrings;jj++){
      if (rx[jj]+rR[jj]>=0&&ry[jj]+rR[jj]>=0&&rx[jj]-rR[jj]<picwidth_&&ry[jj]-rR[jj]<picheight_) {
	float ity=elasticity(kx[ii],ky[ii],rx[jj],ry[jj],rR[jj]);
	bb+=ity;
      }
    }
    wx[ii]=constrain(wx[ii]+dragx/32*bb,kx[ii]-64,kx[ii]+64);
    wy[ii]=constrain(wy[ii]+dragy/32*bb,ky[ii]-64,ky[ii]+64);
  }
}

float animate(float step)
{
  float rate=0.91;
  float vsum=0;
  for(int ii=0;ii<nx_*ny_;ii++){
    float fx=(kx[ii]-wx[ii]);
    float fy=(ky[ii]-wy[ii]);
    vx[ii]+=fx;
    vy[ii]+=fy;
    vx[ii]*=rate;
    vy[ii]*=rate;
    wx[ii]+=step*vx[ii];
    wy[ii]+=step*vy[ii];
    vsum+=dist(0,0,vx[ii],vy[ii])/(nx_*ny_);
  }
  return vsum;
}

float elasticity(float x1,float y1,float x2,float y2,float r)
{
  //return 5.0/exp(5*sq(constrain(dist(x1,y1,x2,y2),0,2*r)/r));
  return 1.0/exp(2.0*sq(dist(x1,y1,x2,y2)/r));
}

void drawToolbar()
{
  final int fontheight=int(textAscent()+textDescent());
  final int txtx=tbleft_,txty=tbtop_+(tbheight_-fontheight)/2;
  final int dimmed=showrings_?192:64;
  noStroke();
  fill(0,0,0,128);
  rect(tbleft_,tbtop_,tbwidth_,tbheight_);
  fill(1==mouse_over_tb()?255:dimmed);
  text("Open",txtx+0+10,txty+textAscent());
  fill(2==mouse_over_tb()?255:dimmed);
  text("Add",txtx+60+10,txty+textAscent());
  fill(3==mouse_over_tb()?255:dimmed);
  text("Del",txtx+120+10,txty+textAscent());
  fill(4==mouse_over_tb()?255:dimmed);
  text(showrings_?"Run!":"Edit",txtx+180+10,txty+textAscent());
}

int mouse_over_tb()
{
  if(mouseY>=tbtop_&&mouseY<tbtop_+tbheight_){
    if(showrings_&&mouseX>=tbleft_+0&&mouseX<tbleft_+60) return 1;
    if(showrings_&&mouseX>=tbleft_+60&&mouseX<tbleft_+120) return 2;
    if(showrings_&&mouseX>=tbleft_+120&&mouseX<tbleft_+180) return 3;
    if(mouseX>=tbleft_+180&&mouseX<tbleft_+240) return 4;
  }
  return -1;
}




void dnd_init()
{
    //addDropTargetListener(new java.awt.dnd.DropTargetListener(){
    new DropTarget(this,new java.awt.dnd.DropTargetListener(){
	    public void dragEnter(DropTargetDragEvent event){
		println("dragEnter "+event);
		final DataFlavor[] flavors=event.getCurrentDataFlavors();
		for(int i=0;i<flavors.length;i++){
		    println("dragEnter check flavor: "+flavors[i]);
		    if (flavors[i].equals(DataFlavor.stringFlavor)) {
			println("dragEnter accepted");
			event.acceptDrag(DnDConstants.ACTION_LINK);
			return;
		    }
		}
		println("dragEnter rejected");
		event.rejectDrag();
	    }
	    public void drop(DropTargetDropEvent event) {
		println("drop "+event);
		final Transferable tr=event.getTransferable();
		try{
		    if (tr.isDataFlavorSupported(DataFlavor.stringFlavor)){
			event.acceptDrop(DnDConstants.ACTION_LINK);
			final String filename=(String)tr.getTransferData(DataFlavor.stringFlavor);
			println("dropped file: \""+filename+"\"");
			dropfile_=trim(filename);
			event.getDropTargetContext().dropComplete(true);
			return;
		    }
		}catch(UnsupportedFlavorException e){
		    println("UnsupportedFlavorException "+e);
		}catch(IOException e){
		    println("IOException "+e);
		}
		event.rejectDrop();
	    }
	    public void dragExit(DropTargetEvent event){}
	    public void dragOver(DropTargetDragEvent event){}
	    public void dropActionChanged(DropTargetDragEvent event){}
	});
}

void backup_config()
{
  int id=0;
  String ofn=myDataPath("wobbling.cfg");
  String fn=myDataPath("wobbling.0.cfg");
  if((new File(fn)).exists()){
    for(id=1;id<9999;id++){
      fn=myDataPath("wobbling."+id+".cfg");
      if(!(new File(fn)).exists())break;
    }
  }
  println("backup name: "+fn+
	", result:"+(new File(ofn)).renameTo(new File(fn)));
}

boolean load_config(String configname)
{
  String[]lines=loadStrings(configname);
  if(null==lines)return false;
  String[]elems=split(lines[0],"#");
  if(null==elems||elems.length<2)return false;
  setImage(elems[0],320,480);
  int[]imgp=int(split(elems[1],","));
  imgcenx_=imgp[0];imgceny_=imgp[1];imgsf_=imgp[2];
  if(elems.length>2){
    for(int jj=2;jj<elems.length;jj++){
      int[]nums=int(split(elems[jj],","));
      rx[jj-2]=nums[0];
      ry[jj-2]=nums[1];
      rR[jj-2]=nums[2];
    }
  }
  return true;
}

void save_config()
{
  String line=""+imgUrl_+"#"+imgcenx_+","+imgceny_+","+imgsf_;
  for(int jj=0;jj<maxrings;jj++){
      if (rx[jj]+rR[jj]>=0&&ry[jj]+rR[jj]>=0&&rx[jj]-rR[jj]<picwidth_&&ry[jj]-rR[jj]<picheight_) {
	line=line+"#"+int(rx[jj])+","+int(ry[jj])+","+int(rR[jj]);
      }
  }
  println(line);
  String[]lines={line};
  saveStrings(myDataPath("wobbling.cfg"),lines);
}

String myDataPath(String filename)
{
  // for some browser, dataPath prepends null to the path
  return online?filename:dataPath(filename);
}


