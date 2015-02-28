
/*
 * Virtual Playhead
 * http://subpixels.com
 * Version 0.2, 2009-01-29
 *
 * <ul>
 *  <li>Output-frame-accurate controls</li>
 *  <li>Variable output framerate, independent of actual sketch framerate</li>
 *  <li>When the target framerate is adjusted, the frame number is recalculated
 *      to maintain the play position as closely as possible</li>
 *  <li>A "running time" is kept independently from the strict frame time, but
 *      various operations cause the frame time or running time to be
 *      determined by each other, eg if stepping frames, the running time is
 *      set to match the frame time.</li>
 *  <li>"Realtime" playback honours output frame rate</li>
 *  <li>"Realtime" playback controls to pause, fast-forward, play in slow-motion,
 *      reverse, jump back/forward, rewind, frame stepping</li>
 *  <li>Saving frames with specific frame numbers</li>
 * </ul>
 */

// -----------------------------------------------------------------------------
// Virtual playhead
// -----------------------------------------------------------------------------
interface PlayheadConstants
{
  final int   PAL_FRAMERATE       = 25;
  final float NTSC_FRAMERATE      = 29.97;
  final int   FILM_FRAMREATE      = 24;
  final float IVTC_FILM_FRAMERATE = 23.976;  // see http://forum.videohelp.com/topic316780.html
  final int   WEB_FRAMERATE       = 30;
  final int   WEBHALF_FRAMERATE   = 15;
}

public class Playhead implements PlayheadConstants
{
  float targetFrameRate;  // In frames per second
  float frameDuration;    // Frame length in seconds

  int frame;    // Absolute frame number, starting at 0
  float time;   // Absolute time in seconds, starting at 0
  
  boolean frameSaved;
  
  boolean paused;    // Is the playhead paused?
  float playSpeed;   // Normal play is 1.0, double speed is 2.0, etc
  float runningTime; // In seconds. Rounded runningTime gives (absolute frame) time
  
  // ---------------------------------------------------------------------------
  // Constructors
  // ---------------------------------------------------------------------------
  public Playhead()
  {
    this(WEB_FRAMERATE);
  }

  public Playhead(float targetFrameRate)
  {
    paused = true;
    playSpeed = 1;
    runningTime = 0;

    setFrameRate(targetFrameRate);
  }

  // Copy constructor
  public Playhead(Playhead p)
  {
    targetFrameRate = p.targetFrameRate;
    frame           = p.frame;
    time            = p.time;
    playSpeed       = p.playSpeed;
    runningTime     = p.runningTime;
    paused          = p.paused;
  }

  // ---------------------------------------------------------------------------
  // Set the target frame rate.
  // Since the numbered frame is going to be at a different part of the video
  // when at a different framerate, we also cue to the nearest frame at the
  // new frame rate.
  // ---------------------------------------------------------------------------
  public void setFrameRate(float targetFrameRate)
  {
    // Sanitise inappropriate frame rate
    if (targetFrameRate < 0.1)
      targetFrameRate = 0.1;

    this.targetFrameRate = targetFrameRate;
    frameDuration = 1.0 / targetFrameRate;

    cueTo(runningTime);
  }

  // ---------------------------------------------------------------------------
  // "Realtime" running; could be regular play, fast forward, rewind, etc.
  // Note that if paused, there is no movement regardless of playSpeed.
  // ---------------------------------------------------------------------------
  public void run(float forTime)
  {
    if (!paused)
    {
      cueTo(runningTime + playSpeed * forTime);
    }
  }

  // ---------------------------------------------------------------------------
  // Pause or unpause the playhead
  // ---------------------------------------------------------------------------
  public void togglePaused()
  {
println("togglePaused()");
    if (paused)
      play();
    else
      pause();
  }

  // ---------------------------------------------------------------------------
  // Pause the playhead
  // When paused, "run" has no effect, but other operations such as frameAdvance
  // and cueTo/cueToFrame do
  // ---------------------------------------------------------------------------
  public void pause()
  {
println("pause()");
    paused = true;
  }
  
  // ---------------------------------------------------------------------------
  // Cancels pause. No change if not paused.
  // ---------------------------------------------------------------------------
  public void play()
  {
println("play()");
    paused = false;
  }
  
  // ---------------------------------------------------------------------------
  // Cue to the beginning of the timeline. Paused status, playSpeed, etc, are
  // not modified.
  // ---------------------------------------------------------------------------
  public void rewindToStart()
  {
println("rewindToStart()");
    cueToFrame(0);
  }
  
  // ---------------------------------------------------------------------------
  // Move the playhead to the next frame. Running time is synched.
  // ---------------------------------------------------------------------------
  public void frameAdvance()
  {
//println("frameAdvance()");
    cueToFrame(frame + 1, true);
  }
  
  // ---------------------------------------------------------------------------
  // Move the playhead to the previous frame. Running time is synched.
  // ---------------------------------------------------------------------------
  public void frameRewind()
  {
println("frameRewind()");
    cueToFrame(frame - 1, true);
  }
  
  // ---------------------------------------------------------------------------
  // Cue to the nearest frame for the spcfied running time.
  // Running time is not synched.
  // ---------------------------------------------------------------------------
  public void cueTo(float runningTime)
  {
//println("cueTo("+runningTime+")");
    this.runningTime = runningTime;

    // Determine what the closest frame number is and cue to that
    cueToFrame(round(runningTime * targetFrameRate), false);
  }
  
  // ---------------------------------------------------------------------------
  // Cue to the specified frame. Running time is synched.
  // ---------------------------------------------------------------------------
  public void cueToFrame(int frame)
  {
println("cueToFrame("+frame+")");
    cueToFrame(frame, true);
  }
  
  // ---------------------------------------------------------------------------
  // Private method to handle all the queuing options above.
  // The playhead is ALWAYS cued to a particular FRAME. When running on "real
  // time", the frame chosen is that closest to the current runningTime.
  // When requested to cue to a particular frame (eg for frame-by-frame
  // recording, frame step forward/back), the runningTime can be synchronised
  // to the frame time. The frame time is ALWAYS determined by the frame
  // number and the targetFrameRate.
  // ---------------------------------------------------------------------------
  private void cueToFrame(int frame, boolean synchRunningTime)
  {
//println("cueToFrame("+frame+", "+synchRunningTime+") - current frame: "+this.frame);
    // If we're changing frames, we haven't saved the new frame.
    // Note that it is possible to cue to the same frame as we are already
    // on, in which case we wouldn't need to clear the frameSaved flag.
    if (frame != this.frame)
      frameSaved = false;

    this.frame = frame;
    time = frame / targetFrameRate;
    
    if (synchRunningTime)
      runningTime = time;
  }

  // ---------------------------------------------------------------------------
  // Save the current display contents to an image file using the frame
  // number information of the playhead as an identifier.
  // Since this program is interactive (even when "paused"), the usual
  // frameCount variable is temporarily hijacked to do this.
  // ---------------------------------------------------------------------------
  public void recordFrame(String fileNameFormat)
  {
    int frameCountSave = frameCount;
    try
    {
      PGraphics pg = createGraphics(width, height, P2D);
      pg.background(outputRender.img);
      frameCount = frame;
      saveFrame(fileNameFormat);
      frameSaved = true;
      println("FRAME SAVED: " + fmtFrameInfo());
    }
    finally
    {
      frameCount = frameCountSave;
    }
  }

  // Return a stats string with running time as well as the
  // frame number, frame time and frame rate.
  public String fmtRunningTimeInfo()
  {
    return fmtRunningTime() + " -> " + fmtFrameInfo();
  }

  // Return a stats string with frame number, frame time and frame rate
  public String fmtFrameInfo()
  {
    return "FR " + nfp(frame, 4) + " / " + fmtTime() + " @ " + fmtFrameRate();
  }

  // Return a string containing the frame time marker
  public String fmtTime()
  {
    return fmtHHMMSSss(time);
  }

  // Return a string containing the "running" time  
  public String fmtRunningTime()
  {
    return fmtHHMMSSss(runningTime);
  }

  // Return a string containing the target frame rate
  public String fmtFrameRate()
  {
    return targetFrameRate + " fps";
  }

  // Private helper method for formatting times
  private String fmtHHMMSSss(float t)
  {
    String s;
    
    // For negative times, just display the "-" as text and determine
    // the rest of the string using the positive value of the time.
    if (t < 0)
    {
      s = "-";
      t = -t;
    }
    else
    {
      s = "";
    }

    return s + floor(t / 3600) + ":"                    // HH hours
             + nf(floor(t / 60), 2) + ":"               // MM minutes
             + nf(round(t % 60 * 100) * 0.01, 2, 2);    // SS.ss seconds, rounded
  }

}


