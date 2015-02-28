
import ddf.minim.*;
PrintWriter output;

Minim minim;
AudioInput in;
float threshold_pump_on;
float threshold_pump_off;
long threshold_pump_on_duration;
long last_on;
long time_turn_on;
long time_turn_off;
long duration_off;
int num_samples;

boolean on;

void setup()
{
  size(512, 200, P3D);
 
  minim = new Minim(this);
  minim.debugOn();
 
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  on = false;
  threshold_pump_on = .0015; //.001
  threshold_pump_on_duration = 400; //200 works well but picks up the check valve
  threshold_pump_off = .0001;
  time_turn_off = -1; //just an initial value
  output = createWriter("pump.txt");
}
 
void draw()
{
  background(0);
  stroke(255);
  // draw the waveforms

  float avg_buf = 0;
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    avg_buf += in.left.get(i);
//    println(in.left.get(i));
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }
  avg_buf = (float)avg_buf / in.bufferSize();
  

  if (avg_buf >= threshold_pump_on) {
    last_on = millis();
    if (on == false) {
      on = true;
      time_turn_on = millis();
      duration_off = time_turn_on - time_turn_off;
      //println("Pump On:  " + time_turn_on);
    }
  } else if (avg_buf <= threshold_pump_off) {
    if (on) {
      if (millis() - last_on > threshold_pump_on_duration) {
        on = false;
        time_turn_off = millis();
        long duration_on = millis() - time_turn_on - threshold_pump_on_duration;
        num_samples++;
        println("On/Off duration: " + duration_on + " / " + duration_off);
        if (num_samples > 2) {
          output.println(
            month() + "\t" +
            day() + "\t" +
            hour() + "\t" +
            minute() + "\t" + 
            second() + "\tpump:\t" +   
            duration_off + "\t" + duration_on);
        }
      }
    }
  } else {
    output.flush();
  }
  
  
  if (on) {
    fill(0,255,0);
  } else {
    fill(255,0,0);
  }
  
  //println(avg_buf);
  ellipse(20,20,20,20);
  
}
 
 
void stop()
{
  // always close Minim audio classes when you are done with them
  output.flush();
  output.close();
  in.close();
  minim.stop();
 
  super.stop();
}

