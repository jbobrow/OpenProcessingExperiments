
public static class Audio
{
  public static AudioSample ball_hitting_ball;
  public static AudioSample light_ball_hitting_ball;
  public static AudioSample ball_hitting_border;
  public static AudioSample ball_drop;
  public static AudioSample ball_drop2;
  public static AudioSample balls_racking;
  public static AudioSample cue_hits_cueball;
  public static AudioSample cue_hits_cueball2;
  public static AudioSample win;
  public static boolean muted;
  
  final static float koefficient = 2;
  final static float pool_cue_koefficient = 8.6;
  
  public Audio()
  {
    minim.debugOff();
    ball_hitting_ball = minim.loadSample("ball_hitting_ball.mp3");
    light_ball_hitting_ball = minim.loadSample("light_ball_hitting_ball.mp3");
    ball_hitting_border = minim.loadSample("ball_hitting_border.mp3");
    ball_drop = minim.loadSample("ball_drop.mp3");
    ball_drop2 = minim.loadSample("ball_drop2.mp3");
    balls_racking = minim.loadSample("balls_racking.mp3");
    cue_hits_cueball = minim.loadSample("cue_hits_cueball.mp3");
    cue_hits_cueball2 = minim.loadSample("cue_hits_cueball2.mp3");
    win = minim.loadSample("win.mp3");
    
    ball_hitting_ball.setGain(6);
    light_ball_hitting_ball.setGain(6);
    ball_hitting_border.setGain(0);
    ball_drop.setGain(6);
    ball_drop2.setGain(6);
    balls_racking.setGain(6);
    cue_hits_cueball.setGain(6);
    cue_hits_cueball2.setGain(6);
    win.setGain(6);

    muted = false;
  }
  
  public static void sound_switch()
  {
    if (muted) {
      ball_hitting_ball.unmute();
      light_ball_hitting_ball.unmute();
      ball_hitting_border.unmute();
      ball_drop.unmute();
      ball_drop2.unmute();
      balls_racking.unmute();
      cue_hits_cueball.unmute();
      cue_hits_cueball2.unmute();
      win.unmute();

      muted = false;
    } else {
      ball_hitting_ball.mute();
      light_ball_hitting_ball.mute();
      ball_hitting_border.mute();
      ball_drop.mute();
      ball_drop2.mute();
      balls_racking.mute();
      cue_hits_cueball.mute();
      cue_hits_cueball2.mute();
      win.mute();

      muted = true;
    }
  }
  
  public static void stop_audio()
  {
    ball_hitting_ball.close();
    light_ball_hitting_ball.close();
    ball_hitting_border.close();
    ball_drop.close();
    ball_drop2.close();
    balls_racking.close();
    cue_hits_cueball.close();
    cue_hits_cueball2.close();
    win.close();
  }
  
  public static void random_pocket_sound(int rand)
  {
    if (rand < 2) {
      ball_drop.trigger();
    } else {
      ball_drop2.trigger();
    }
  }
  
  public static void gain_cue_sound(float magnitude, int rand)
  {
    if (rand < 2) {
      cue_hits_cueball.setGain(magnitude * pool_cue_koefficient - 10);
      cue_hits_cueball.trigger();
      //println(magnitude * pool_cue_koefficient - 10);
    } else {
      cue_hits_cueball2.setGain(magnitude * pool_cue_koefficient - 10);
      cue_hits_cueball2.trigger();
    }
  }
  
  public static void gain_ball_hitting_ball(float magnitude)
  {
    ball_hitting_ball.setGain(gain_ret(magnitude));
  }
  
  public static void gain_light_ball_hitting_ball(float magnitude)
  {
    light_ball_hitting_ball.setGain(gain_ret(magnitude));
  }
  
  private static float gain_ret(float magnitude)
  {
    return (magnitude * koefficient - 11);
  }
}

