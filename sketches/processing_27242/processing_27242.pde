

import ddf.minim.*;
Minim minim;
AudioPlayer player;
CommandVal[] timeComs=new CommandVal[]{

  
  new CommandVal(0.0	,	"fade_1."),
  new CommandVal(0.361415,	"grass_0"),
  new CommandVal(4.156277,	"credit_0"),
  new CommandVal(8.538438,	"bend_0.5"),
  new CommandVal(16.674801,	"twist_1;bend_.5;"),
  new CommandVal(33.471580,	"jump_0.5;fade_0"),
  new CommandVal(40.803794,	"grass_.5"),
  new CommandVal(49.007922,	"jump_0;twist_0;bend_0;"),
  new CommandVal(51.266768,	"jump_1;twist_1;bend_1"),
  new CommandVal(102.628408,	"jump_0;twist_.5;bend_.5;fade_1"),
  new CommandVal(116.859138,	"twist_1.5;bend_1.5;jump_1;fade_0"),
  new CommandVal(118.892100,	"jump_1."),
  new CommandVal(153.493102,	"jump_0"),
  new CommandVal(154.432782,	"bend_0"),
  new CommandVal(155.986868,	"twist_0.5;fade_1;credit_1"),
  new CommandVal(159.275748,	"twist_0"),
  new CommandVal(160.721409,"credit_2"),
};
  
TimeLine    tline;

void SetupAudio()
{
    minim = new Minim(this);
    player = minim.loadFile("Maybe_another_day.mp3",4096);
  //  player = minim.loadFile("412396_Jay_B___Heavenly_Inc.__NAC.mp3",2048);
  tline=new TimeLine(timeComs);

   player.play();
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
}


void stop() {
  player.close();
  minim.stop();
  super.stop();
}


