
import ddf.minim.*;
Minim minim;
AudioPlayer player;

CommandVal[] timeComs=new CommandVal[]{
  
new CommandVal(0.087740, "smoke"),
new CommandVal(4.540567, "volume;starttime"),
new CommandVal(13.972662, "smoke"),
new CommandVal(23.404757, "fire"),
new CommandVal(42.268947, "faster;terrain"),
new CommandVal(61.155073, "harry"),
new CommandVal(71.376832, "fire"),
new CommandVal(88.661694, "smoke"),
new CommandVal(98.422816, "slower;terrain"),
new CommandVal(108.622640, "harry"),
new CommandVal(117.725708, "fire;faster"),
new CommandVal(136.633769, "volume"),
new CommandVal(155.607635, "terrain"),
new CommandVal(166.706798, "smoke"),
new CommandVal(174.713111, "smoke;slower"),
new CommandVal(183.969725, "harry"),
new CommandVal(191.493466, "bye")
 };

TimeLine    tline;

/*
final int sc_Volume=0;
 final int sc_Render=1;
 final int sc_Height2=2;
 final int sc_Crap=3;
 final int sc_Fire=4;
 final int sc_SpotFog=5;
 final int sc_GroovyTerrain=6;
 final int sc_CrabNebula=7;
 final int sc_WaavySmoke=8;
 final int sc_fireBall=9;
 final int sc_HPSmoke=10;
 final int sc_Cloudy=11;
 final int sc_CubeSphere=12;
 final int sc_Blobbies=12;
 final int sc_FireBall2=13;
 final int sc_CloudPuff=14;
 
 */

int wavy[]= {
  sc_WaavySmoke,
  sc_CloudPuff,
  sc_CubeSphere,
  sc_Blobbies
};
int smokeTypes[]= {
  sc_HPSmoke,
  sc_Blobbies,
  sc_WaavySmoke,
  sc_SpotFog,
  sc_CloudPuff,
  sc_DiscoBall
};
int title[]= {
  sc_Volume,
  sc_Render,
  sc_CubeSphere,
  sc_World,
};
int fire[]= {
  sc_Fire,
  sc_FireBall2,
  sc_FireBlue,
  sc_fireball,
  sc_FireGreen,
  sc_FireBallBlue,
};
int harry[]= {
  sc_HPSmoke,
  sc_CloudPuff,
  sc_WaavySmoke,
  sc_Blobbies,
  sc_DiscoBall
};
int terrain[]= {
  sc_GroovyTerrain,
  sc_Height2,
  sc_CubeSphere,
  sc_World,
};
int bye[]= {
  sc_ByeBye,
  sc_FireBall2,
  sc_ByeBye,
  sc_Blobbies,
  sc_ByeBye,
  sc_CloudPuff,
};

class Demo
{
  float startTime=0;
  float startSongTime=0;
  
  float nextTransTime=0;
  float lastTransTime;
  float beatTime=(42.2-23.4)/16.;
  int[] m_scenesel;
  int    m_scIdx;
  int    m_speed=2;

  float m_startz;
  float m_endz;
  boolean m_useTrackTime=true;
  Demo()
  {
    nextTransTime=10000.;
    lastTransTime=0;
    if ( player!=null )
      player.play();
    startTime=millis()/1000.0f;

  }
  float beatDuration()
  {
    return m_speed*beatTime;
  }
  void transition(float ltime)
  {
    g_CurrentVolume=m_scenesel[m_scIdx%m_scenesel.length];
    lastTransTime=ltime;
    nextTransTime = ltime+ (float)((int)random(1.,2.9))*beatTime*m_speed;


    float nextComTime=tline.GetNextCommandTime();
    if ( nextComTime < (nextTransTime+(beatTime*m_speed)))
    {
      nextTransTime=nextComTime+0.01f;
      //print("Overriding trans time \n");
    }
    //print(" Setting Scene "+g_CurrentVolume+"\n");
    m_scIdx++;

    m_startz=random(2.8,5.);
    m_endz=random(2.8,3.5);
  }
  float getPosition()
  {
    float t=(float)player.position()/1000.f;
    float dt=(t-lastTransTime)/(nextTransTime-lastTransTime);
    return lerp(m_startz,m_endz,dt);
  }
  float Fade()
  {
    if ( m_speed == 1)
      return 1.;
     float t=(float)player.position()/1000.f;
     float f=constrain(nextTransTime-t,0.,1.);
    f = min( constrain(t-lastTransTime,0.,1.),f);
    return f;
  }
  void update( float time)
  {
    float ltime=(float)player.position()/1000.f;
    CommandVal[] coms=UpdateBeat(ltime);
    int[] lastSel=m_scenesel;
    for(int i=0;i<coms.length;i++)
    {
      String c = coms[i].com;

      print("C '"+c+"'"  +" : "+ coms[i].val+" ");
      if (c.equals("smoke"))
        m_scenesel=smokeTypes;
      else if ( c.equals("volume"))
        m_scenesel=title;
      else if ( c.equals("fire"))
        m_scenesel=fire;
      else if ( c.equals("harry"))
        m_scenesel=harry;
      else if ( c.equals("terrain"))
        m_scenesel=terrain;
      else if (c.equals("wavy"))
        m_scenesel=wavy;
      else if ( c.equals("faster"))
        m_speed=1;
      else if ( c.equals("slower"))
        m_speed=2;
      else if ( c.equals("bye"))
      {
        m_scenesel=bye;
        m_speed=1;
      }
       else if ( c.equals("starttime"))
         startSongTime=time;
    }
    if ( m_scenesel!=lastSel)
    {
      m_scIdx=0;
      transition(ltime);
      return;
    }
    if ( ltime< nextTransTime)
      return;
    transition(ltime);
  }
  void stop()
  {
    if ( player!=null)
      player.pause();
  }
};
void SetupAudio()
{
  minim = new Minim(this);
  player = minim.loadFile("412396_Jay_B___Heavenly_Inc.__NAC.mp3",2048);
//  tline=new TimeLine("labels.txt");//timeComs);
  tline=new TimeLine(timeComs);
}

CommandVal[] UpdateBeat(float time)
{
  //  return new CommandVal[0];

  String[] com=tline.GetCommands(time);
  CommandVal[] cvs=new CommandVal[com.length];
  for (int i=0;i<com.length;i++)
    cvs[i] = new CommandVal(com[i]);
  return cvs;
}
class CommandVal
{
  String com;
  float val=0.;
  CommandVal( float t, String v)
  {
    com=v;
    val=t;
  }
  CommandVal( String v)
  {
    String[] els=v.trim().split("_");
    com = els[0];
    if ( els.length>1)
      val= Float.valueOf(els[1]).floatValue();
  }
}
class TimeLine
{
  CommandVal[] commands;
  int     l_idx;

  TimeLine(  CommandVal[] coms )
  {
    l_idx=0;
    commands=coms;
  }
  TimeLine( String fname )
  {
    BufferedReader in = createReader(fname);

    commands = new CommandVal[0];
    String l =null;
    try {
      l=in.readLine();
    }
    catch(IOException e) 
    {
      e.printStackTrace();
      l=null;
    }

    while( l !=null)
    {
      String els[] =l.trim().split("\\s+");   
      if ( els.length>1)
      {
        commands =(CommandVal[])append(commands,new CommandVal( Float.valueOf(els[0]).floatValue(),els[1]));
      }
      try {
        l=in.readLine();
      }
      catch(IOException e) 
      {
        e.printStackTrace();
        l=null;
      }
    }

    l_idx=0;
  }
  String[] GetCommands( float ctime)
  {
    String[] coms=new String[0];
    while(l_idx < commands.length && commands[l_idx].val<=ctime)
    {
      String els[] =commands[l_idx++].com.split(";"); 
      coms=concat( coms,els);
    }
    return coms;
  }
  float GetNextCommandTime()
  {
    return l_idx < commands.length ? commands[l_idx].val : -1.;
  }
}
void stop() {
  if ( player!=null)
    player.close();
  if ( minim!=null)
    minim.stop();
  super.stop();
}


