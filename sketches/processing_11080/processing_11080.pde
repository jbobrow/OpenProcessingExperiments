
import processing.opengl.*;

PGraphics bg, fg;
BodyCell will,tage,lulu,porc;
PImage transparent;

void setup(){
  //size(screen.width,screen.height);
  size(300,300,P2D);
  bg = createGraphics(width,height,P2D);
  fg = createGraphics(width,height,P2D);
  bg.smooth();
  fg.smooth();
  will = new BodyCell(bg,150,150,100);
  tage = new BodyCell(fg,140,70,40);
  lulu = new BodyCell(fg,50,180,45);
  porc = new BodyCell(fg,230,220,50);
}

void draw(){
  background(0);
  bg.beginDraw();
  bg.background(150,100,90);
  will.draw();
  //bg.filter(BLUR,mouseY/50);
  bg.endDraw();
  
  fg.beginDraw();
  fg.background(150,100,90,0);
  tage.draw();
  lulu.draw();
  porc.draw();
  //fg.filter(BLUR,(height-mouseY)/50);
  fg.endDraw();
  
  fastBlur(bg,mouseY/4);
  fastBlur(fg,(height-mouseY)/4);
  
  image(bg,0,0);
  image(fg,0,0);
  //blend(fg,0,0,width,height,0,0,width,height,BLEND);
}

class BodyCell{
  private Cell main, nucleus;
  private PGraphics context;
  public float X,Y;
  
  public BodyCell(PGraphics con, float x, float y, float rad){
    context = con;
    X = x;
    Y = y;
    main = new Cell(con,X,Y,rad);
    nucleus = new Cell(con,X,Y,rad*0.4);
  }
  
  public void draw(){
    nucleus.centerX = X;
    nucleus.centerY = Y;
    main.centerX = X;
    main.centerY = Y;
    
    context.stroke(100,70,90,200);
    context.strokeWeight(2);
    context.fill(60,30,60,200);
    nucleus.draw();
    
    context.stroke(100,80,70,200);
    context.strokeWeight(3);
    context.fill(200,180,188,160);
    main.draw();
  }
}

class Cell{
  //the goal points, organized the same way as the reference points
  private float[] pts, goalpts;
  //the cell starts as a perfect circle with a givin radius
  private float radius;
  //centerpoint of cell.
  public float centerX, centerY;
  
  private PGraphics context;

  public Cell(PGraphics con, float centX, float centY, float rad){
    context = con;
    radius = abs(rad);
    centerX = centX;
    centerY = centY;

    /**
     * these are the goal points.
     * evens are Xs, odds are Ys.
     * (0,1) is top left, (2,3) is top right
     * (4,5) is bottom left, (6,7) is bottom right
     * all values are relative to centerpoint
     */
    goalpts = new float[8];
    goalpts[1] = radius * (-1);
    goalpts[3] = radius * (-1);
    goalpts[5] = radius;
    goalpts[7] = radius;
    goalpts[0] = radius * (-1.333);
    goalpts[4] = radius * (-1.333);
    goalpts[2] = radius * (1.333);
    goalpts[6] = radius * (1.333);

    //copy all goalpoints into reference points. goal points will later diverge
    pts = new float[8];
    for(int i=0; i<8; i++){
      pts[i] = goalpts[i];
    }
  }

  public void phys(){
    /**
     * computes internal random movements of cell.
     * the goal points and randomly changed, then the reference points smoothly approach the goal points
     * thus cell appears to slowly and randomly wobble.
     */
    //randomly change goal points
    float drift = radius*0.01;
    for(int i=0; i<8; i++){
      goalpts[i] = goalpts[i] + random( -drift,drift );
    }

    //constrain goal points to accetable values
    goalpts[0] = constrain(goalpts[0], radius*(-1.733),  radius*(-0.933));
    goalpts[4] = constrain(goalpts[4], radius*(-1.733),  radius*(-0.933));
    goalpts[2] = constrain(goalpts[2], radius*(0.933),     radius*(1.733));
    goalpts[6] = constrain(goalpts[6], radius*(0.933),     radius*(1.733));
    goalpts[1] = constrain(goalpts[1], radius*(-1.3),      radius*(-0.7));
    goalpts[3] = constrain(goalpts[3], radius*(-1.3),      radius*(-0.7));
    goalpts[5] = constrain(goalpts[5], radius*(0.7),     radius*(1.3));
    goalpts[7] = constrain(goalpts[7], radius*(0.7),     radius*(1.3));

    //make reference points smoothly approach goal points
    for(int i=0; i<8; i++){
      pts[i] += (goalpts[i] - pts[i])/20.0;
    }
  }

  public void draw(){
    //do physics update
    phys();

    //interpolate top centerpoint (still relative to center)
    float xt = map( 0.5, 0.0,1.0, pts[0],pts[2] );
    float yt = map( xt, pts[0],pts[2], pts[1],pts[3]);
    //interpolate bottom centerpoint
    float xb = map( 0.5, 0.0,1.0, pts[4],pts[6] );
    float yb = map( xb, pts[4],pts[6], pts[5],pts[7]);

    //draw two bezier curves, one for each half
    context.bezier( centerX+xt,     centerY+yt,
    centerX+pts[2], centerY+pts[3],
    centerX+pts[6], centerY+pts[7],
    centerX+xb,     centerY+yb );
    context.bezier( centerX+xb,     centerY+yb,
    centerX+pts[4], centerY+pts[5],
    centerX+pts[0], centerY+pts[1],
    centerX+xt,     centerY+yt );

    //uncomment these if you want to see the reference lines
    //line(centerX+pts[0],centerY+pts[1],centerX+pts[2],centerY+pts[3]);
    //line(centerX+pts[4],centerY+pts[5],centerX+pts[6],centerY+pts[7]);
  }
}

void fastBlur(PImage img, int radius){
  if (radius<1){
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int a[]=new int[wh]; // i've added this
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int asum,rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw; // and the asum here
  int vmin[] = new int[max(w,h)];
  int vmax[] = new int[max(w,h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++){
     dv[i]=(i/div);
  }

  yw=yi=0;

  for (y=0;y<h;y++){
    asum=rsum=gsum=bsum=0; // asum
    for(i=-radius;i<=radius;i++){
	p=pix[yi+min(wm,max(i,0))];
	asum+=(p>>24) & 0xff;
	rsum+=(p & 0xff0000)>>16;
	gsum+=(p & 0x00ff00)>>8;
	bsum+= p & 0x0000ff;
    }
    for (x=0;x<w;x++){
	a[yi]=dv[asum];
	r[yi]=dv[rsum];
	g[yi]=dv[gsum];
	b[yi]=dv[bsum];

	if(y==0){
	  vmin[x]=min(x+radius+1,wm);
	  vmax[x]=max(x-radius,0);
	} 
	p1=pix[yw+vmin[x]];
	p2=pix[yw+vmax[x]];
	
	asum+=((p1>>24) & 0xff)-((p2>>24) & 0xff); // asum
	rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
	gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
	bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
	yi++;
    }
    yw+=w;
  }

  for (x=0;x<w;x++){
    asum=rsum=gsum=bsum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
	yi=max(0,yp)+x;
	asum+=a[yi]; // asum
	rsum+=r[yi];
	gsum+=g[yi];
	bsum+=b[yi];
	yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
	pix[yi] = (dv[asum]<<24) | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum]; 
	if(x==0){
	  vmin[y]=min(y+radius+1,hm)*w;
	  vmax[y]=max(y-radius,0)*w;
	} 
	p1=x+vmin[y];
	p2=x+vmax[y];
	
	asum+=a[p1]-a[p2]; // asum
	rsum+=r[p1]-r[p2];
	gsum+=g[p1]-g[p2];
	bsum+=b[p1]-b[p2];

	yi+=w;
    }
  }
}

