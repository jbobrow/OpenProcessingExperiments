
// vim: set ts=8 sw=8: 
import processing.core.PApplet;
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
//import org.jbox2d.collision.shapes.*;//obsolete,v2.1.2
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

//import org.jbox2d.collision.AABB;//superceded
//import org.jbox2d.common.Vec2;//superceded
//import org.jbox2d.common.XForm;//superceded
//import org.jbox2d.common.Color3f;//superceded
//import org.jbox2d.dynamics.Body;//superceded
//import org.jbox2d.dynamics.BodyDef;//superceded
//import org.jbox2d.dynamics.World;//superceded
//import org.jbox2d.dynamics.DebugDraw;//superceded

//import org.jbox2d.testbed.ProcessingDebugDraw;

// CHECK: Map m = Collections.synchronizedMap(new HashMap(...));

final boolean debug_=true;
final int yflip_=-1;//1;//must be 1 or -1

class BoxlandSprite
{
	Boxland boxland_;
	ArrayList/*<Body>*/ bodies_;
	HashMap bodybounds_;

	BoxlandSprite(Boxland boxland)
	{
		boxland_=boxland;
		bodies_=new ArrayList();
		bodybounds_=new HashMap();
	}

	BoxlandSprite(Boxland boxland,float x,float y,float a,float w,float h)
	{
		this(boxland);
		Body b=makeBody(x,y,a,w,h);
		addBody(b,w,h);
	}

	protected void finalize() throws Throwable
	{
		killBody();
	}

	//prototype implementation
	/*static*/ Body createShapedBody(World world,BodyDef bd,ShapeDef sd)
	{
		Body b=world.createBody(bd);
		b.createShape(sd);
		b.setMassFromShapes();
		return b;
	}

	//prototype implementation
	Body makeBody(float x,float y,float a,float w,float h)
	{
		//create body
		Vec2 wcen=mapScreenToWorldVec2(x,y);
		BodyDef bd=new BodyDef();
		bd.position.set(wcen);
		bd.angle=a;

		//shape box as polygon
		PolygonDef sd=new PolygonDef();
		Vec2 wdim=mapScreenToWorldSize(w/2,h/2);
		sd.setAsBox(wdim.x,wdim.y);
		sd.density=10.0;
		sd.friction=0.5;
		sd.restitution=0.5;

		Body b=createShapedBody(getWorld(),bd,sd);
		return b;
	}

	void killBody()
	{
		if(null!=bodies_){
			for (int i = 0; i < bodies_.size(); i++) {
				getWorld().destroyBody((Body)bodies_.get(i));
			}
			bodies_=null;
		}
	}

	void addBody(Body b,float w,float h)
	{
		bodies_.add(b);
		bodybounds_.put(b,new Vec2(w,h));
	}

	//prototype implementation
	void drawSprite(PGraphics g) {
		if(null!=bodies_){
			for (int i = 0; i < bodies_.size(); i++) {
				Body b=(Body)bodies_.get(i);
				drawBody(g,b);
			}
		}
	}

	void drawBody(PGraphics g,Body b)
	{
		if(true){
			Vec2 pos=mapWorldToScreenVec2(b.getPosition());
			float x=pos.x,y=pos.y;
			float a=b.getAngle();
			Vec2 dim=(Vec2)bodybounds_.get(b);
			float w=dim.x,h=dim.y;

			g.pushStyle();

			g.rectMode(CENTER);
			g.noFill();
			g.stroke(128);//gray
			g.strokeWeight(1);

			g.pushMatrix();
			g.translate(x,y);
			g.rotate(yflip_*a);//make angle negative, because y coord is flipped
			g.rect(0,0,w,h);
			g.line(0,0,0,-h/4);
			g.popMatrix();

			g.popStyle();
		}
	}


	World getWorld()
	{
		return boxland_.world_;
	}





	Vec2 mapScreenToWorldVec2(Vec2 in)
	{
		Vec2 out=in.clone();
		boxland_.mapScreenToWorld(in,out);
		return out;
	}

	Vec2 mapScreenToWorldVec2(float x,float y)
	{
		Vec2 in=new Vec2(x,y);
		return mapScreenToWorldVec2(in);
	}

	Vec2 mapWorldToScreenVec2(Vec2 in)
	{
		Vec2 out=in.clone();
		boxland_.mapWorldToScreen(in,out);
		return out;
	}

	Vec2 mapWorldToScreenVec2(float x,float y)
	{
		Vec2 in=new Vec2(x,y);
		return mapWorldToScreenVec2(in);
	}








	Vec2 mapScreenToWorldSize(Vec2 in)
	{
		Vec2 out=in.clone();
		boxland_.mapScreenSizeToWorldSize(in,out);
		return out;
	}

	Vec2 mapScreenToWorldSize(float w,float h)
	{
		Vec2 in=new Vec2(w,h);
		return mapScreenToWorldSize(in);
	}

	Vec2 mapWorldToScreenSize(Vec2 in)
	{
		Vec2 out=in.clone();
		boxland_.mapWorldSizeToScreenSize(in,out);
		return out;
	}

	Vec2 mapWorldToScreenSize(float w,float h)
	{
		Vec2 in=new Vec2(w,h);
		return mapWorldToScreenSize(in);
	}


	Body getBodyAt(int i)
	{
		return(Body)bodies_.get(i);
	}


}

class Boxland
{

// 	class BoxlandDebugDraw extends ProcessingDebugDraw
// 	{
// 		Boxland boxland_;
// 
// 		BoxlandDebugDraw(PApplet pApplet,Boxland boxland)
// 		{
// 			super(pApplet);
// 			boxland_=boxland;
// 		}
// 
// 		Vec2 screenToWorld(float x,float y)
// 		{
// 			return boxland_.screenToWorld(x,y);
// 		}
// 		Vec2 screenToWorld(Vec2 screen)
// 		{
// 			return boxland_.screenToWorld(screen);
// 		}
// 		Vec2 worldToScreen(float x,float y)
// 		{
// 			return boxland_.worldToScreen(x,y);
// 		}
// 		Vec2 worldToScreen(Vec2 world)
// 		{
// 			return boxland_.worldToScreen(world);
// 		}
// 		Vec2 worldToScreenVector(float x,float y)
// 		{
// 			return boxland_.worldToScreenVector(x,y);
// 		}
// 		Vec2 worldToScreenVector(Vec2 world)
// 		{
// 			return boxland_.worldToScreenVector(world);
// 		}
// 
// 	}

	class Boundary extends BoxlandSprite
	{
		Boundary(Boxland boxland,int w,int h)
		{
			super(boxland);
			Body bottom=makeBody(w/2,h-5,0,w,10);
			addBody(bottom,w,10);
			Body top=makeBody(w/2,5,0,w,10);
			addBody(top,w,10);
			Body right=makeBody(w-5,h/2,0,10,h);
			addBody(right,10,h);
			Body left=makeBody(5,h/2,0,10,h);
			addBody(left,10,h);
		}

		Body makeBody(float x,float y,float a,float w,float h)
		{

			//create body
			Vec2 wcen=mapScreenToWorldVec2(x,y);
			BodyDef bd=new BodyDef();
			bd.position.set(wcen);
			bd.angle=a;

			PolygonDef sd=new PolygonDef();
			Vec2 wdim=mapScreenToWorldSize(w/2,h/2);
			sd.setAsBox(wdim.x,wdim.y);
			sd.density=0;//immovable
			sd.friction=0.5f;
                        sd.restitution=0.5f;

			Body b=createShapedBody(getWorld(),bd,sd);
			return b;
		}

		void drawBody(PGraphics g,Body b)
		{
			if(true){
				Vec2 pos=mapWorldToScreenVec2(b.getPosition());
				float x=pos.x,y=pos.y;
				float a=b.getAngle();
				Vec2 dim=(Vec2)bodybounds_.get(b);
				float w=dim.x,h=dim.y;

				g.pushStyle();
				g.rectMode(CENTER);
				g.fill(0);
				g.noStroke();
				g.rect(x,y,w,h);
				g.popStyle();
			}
		}

	}

	PApplet app_;
	int boxlandwidth_,boxlandheight_;
	float boxlandtime_;

	World world_;

	ArrayList sprites_;

	float PTM_RATIO;//=10.0f;

	Boxland(PApplet app,int width,int height,float sf)
	{
		init(app,width,height,sf,-100,-100,100,100);
	}

	void init(PApplet app,int width,int height,float sf,float lx,float ly,float ux,float uy)
	{
		app_=app;
		boxlandwidth_=width;
		boxlandheight_=height;

		PTM_RATIO=sf;

		AABB worldAABB=new AABB();
		worldAABB.lowerBound.set(lx,ly);
		worldAABB.upperBound.set(ux,uy);
		Vec2 gravity=new Vec2(0,-10);
		boolean doSleep=true;
		world_=new World(worldAABB,gravity,doSleep);

// 		int flag=0
// 			|DebugDraw.e_shapeBit
// 			|DebugDraw.e_centerOfMassBit;
// 		world_.setDebugDraw( new BoxlandDebugDraw(app,this) );
// 		BoxlandDebugDraw.screen.setCamera(width,height,sf);
// 
// 		BoxlandDebugDraw.screen.setFlags(debug_?65535:1);

		world_.setWarmStarting(true);
		world_.setPositionCorrection(true);
		world_.setContinuousPhysics(true);

		sprites_=new ArrayList();

		addSprite(new Boundary(this,width,height));

		boxlandtime_=millis();

	}

	void drawBoxland(PGraphics g)
	{

		if(yflip_<0){
			//no transform
		}else{
			g.pushMatrix();
			g.translate(0,boxlandheight_);
			g.scale(1,-1);
		}

		// Show the bodys
		//method #1
		for (int i = 0; i < sprites_.size(); i++) {
			BoxlandSprite s=(BoxlandSprite)sprites_.get(i);
			s.drawSprite(g);
		}

		if(yflip_<0){
			//no transform
		}else{
			g.popMatrix();
		}

	}

	//translate event coord to screen coord
	Vec2 eventToScene(Vec2 in)
	{
		Vec2 out=new Vec2(0,0);
		out.x=in.x;
		if(yflip_<0){
			out.y=in.y;
		}else{
			out.y=boxlandheight_-in.y;
		}
		return out;
	}

	Vec2 eventToScene(float x,float y)
	{
		Vec2 in=new Vec2(x,y);
		return eventToScene(in);
	}

	void step()
	{
		//calculate dt
		float nt=millis();
		float dt=(nt-boxlandtime_)/1000;
		boxlandtime_=nt;
		step(dt,5);
	}

	void step(float dt,int iter)
	{
		world_.step(dt,iter);
	}

	void addSprite(BoxlandSprite sprite)
	{
		sprites_.add(sprite);
	}

	//////////////////////////////////////////
	//////////////////////////////////////////

	void mapWorldToScreen(Vec2 in,Vec2 out)
	{
		out.x=in.x*PTM_RATIO;
		if(yflip_<0){
			out.y=boxlandheight_-in.y*PTM_RATIO;
		}else{
			out.y=in.y*PTM_RATIO;
		}
	}

	void mapScreenToWorld(Vec2 in,Vec2 out)
	{
		out.x=in.x/PTM_RATIO;
		if(yflip_<0){
			out.y=(boxlandheight_-in.y)/PTM_RATIO;
		}else{
			out.y=in.y/PTM_RATIO;
		}
	}

	void mapWorldSizeToScreenSize(Vec2 inSize,Vec2 outSize)
	{
		outSize.x=inSize.x*PTM_RATIO;
		outSize.y=inSize.y*PTM_RATIO;
	}

	void mapScreenSizeToWorldSize(Vec2 inSize,Vec2 outSize)
	{
		outSize.x=inSize.x/PTM_RATIO;
		outSize.y=inSize.y/PTM_RATIO;
	}

	void mapWorldToScreen(float[]in,float[]out,int n)
	{
		if(yflip_<0){
			for(int i=0;i<n;i++){
				out[i*2+0]=in[i*2+0]*PTM_RATIO;
				out[i*2+1]=boxlandheight_-in[i*2+1]*PTM_RATIO;
			}
		}else{
			for(int i=0;i<n;i++){
				out[i*2+0]=in[i*2+0]*PTM_RATIO;
				out[i*2+1]=in[i*2+1]*PTM_RATIO;
			}
		}
	}

	void mapScreenToWorld(float[]in,float[]out,int n)
	{
		if(yflip_<0){
			for(int i=0;i<n;i++){
				out[i*2+0]=in[i*2+0]/PTM_RATIO;
				out[i*2+1]=(boxlandheight_-in[i*2+1])/PTM_RATIO;
			}
		}else{
			for(int i=0;i<n;i++){
				out[i*2+0]=in[i*2+0]/PTM_RATIO;
				out[i*2+1]=in[i*2+1]/PTM_RATIO;
			}
		}
	}

	void mapWorldSizeToScreenSize(float[]inSize,float[]outSize,int n)
	{
		for(int i=0;i<n;i++){
			outSize[i*2+0]=inSize[i*2+0]*PTM_RATIO;
			outSize[i*2+1]=inSize[i*2+1]*PTM_RATIO;
		}
	}

	void mapScreenSizeToWorldSize(float[]inSize,float[]outSize,int n)
	{
		for(int i=0;i<n;i++){
			outSize[i*2+0]=inSize[i*2+0]/PTM_RATIO;
			outSize[i*2+1]=inSize[i*2+1]/PTM_RATIO;
		}
	}

	//////////////////////////////////////////
	//////////////////////////////////////////

	Vec2 worldToScreen(Vec2 in)
	{
		Vec2 out=new Vec2();
		mapWorldToScreen(in,out);
		return out;
	}

	Vec2 screenToWorld(Vec2 in)
	{
		Vec2 out=new Vec2();
		mapScreenToWorld(in,out);
		return out;
	}

	Vec2 worldToScreen(float x,float y)
	{
		Vec2 in=new Vec2(x,y),out=new Vec2();
		mapWorldToScreen(in,out);
		return out;
	}

	Vec2 screenToWorld(float x,float y)
	{
		Vec2 in=new Vec2(x,y),out=new Vec2();
		mapScreenToWorld(in,out);
		return out;
	}

	Vec2 worldToScreenVector(Vec2 in)
	{
		Vec2 out=new Vec2();
		mapWorldSizeToScreenSize(in,out);
		return out;
	}

	Vec2 worldToScreenVector(float x,float y)
	{
		Vec2 in=new Vec2(x,y),out=new Vec2();
		mapWorldSizeToScreenSize(in,out);
		return out;
	}

	void setDebugFlags(int flags)
	{
// 		BoxlandDebugDraw.screen.setFlags(flags);
	}

}


