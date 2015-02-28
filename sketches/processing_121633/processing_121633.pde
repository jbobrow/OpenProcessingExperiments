
	int players, units;
Player[] mPlayer;
ParticleSystem mParticleSystem;

	public void setup(){  size(800,600,JAVA2D);
	  frameRate(100);
	  players=3;
	  units=30;
mParticleSystem=new ParticleSystem(this);mPlayer = new Player[players];
for(int i=0;i<mPlayer.length;i++){mPlayer[i]=new Player(units, this,false,i);}
mPlayer[0].isPlayer=true;
	}

	public void draw(){
		background(0);
//		if(frameCount==100){frameCount=0;setup();}
		
		for(int i=0;i<mPlayer.length;i++){mPlayer[i].draw();}
		mParticleSystem.updateAndDraw();
	}

	public void keyPressed(){
if(key=='r')setup();
	}


