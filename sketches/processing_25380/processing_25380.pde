
public class Shot{
  
  
  float[] dir_start_ = new float[2];
  float[] dir_end_   = new float[2];
  boolean mouse_pressed_ = false;
  boolean triggered_ = false;
  boolean strike_ = false;
  
  float dir_x_, dir_y_;
  float px_,  py_;
  float speed_;
  float actual_speed_;
  
  float wind_x_    = .001;
  float gravity_y_ = .01;
  float gravity_factor  = 1.005;
  float friction_  = 1.001;
  
  Shot(){
  }
  
  
  void trigger(){
    triggered_ = true;
  }
  
  void visualize(){
    // if impact happend, return
    if( strike_ )
      return;
      
    if( !triggered_ ) {
      stroke(100,0,0);
      strokeWeight(2);
      if( mouse_pressed_ )
        showDirWhileDefining();
      else
        showDir();
    }
      
    if( triggered_ && !strike_){
      
      float px_old = px_;
      float py_old = py_;
      
      gravity_y_ *= gravity_factor ;
      dir_x_ += wind_x_;
      dir_y_ += gravity_y_;
      speed_ /= friction_;
      px_ += dir_x_ * speed_;
      py_ += dir_y_ * speed_;
      
      // break, if bullet is outside world
      if( px_ <= 0 || px_ >= world.width || py_ >= world.height){
        strike_ = true;
        return;
      }
        
      // draw shot(bullet)
      strokeWeight(7);
      point(px_, py_);
      int tmp_px = (int)px_;
      int tmp_py = (int)py_;
      
      // handle impact
      if( tmp_px >= 0 && tmp_px < world.width && tmp_py >= 0 && tmp_py < world.height){
        if( world.pixels[tmp_py*world.width +tmp_px] != color(255)){
          strike_ = true;
          actual_speed_ = dist(px_ , py_, px_old, py_old);
          float impact_strength = 10 + actual_speed_*10;
          if( impact_strength > 100) impact_strength = 100;
          world.beginDraw(); 
            world.fill(255);
            world.noStroke();

            world.ellipse(tmp_px, tmp_py, impact_strength, impact_strength);
          world.endDraw(); 
        }
      }
    }
  }
  
  void showDir(){
    strokeWeight(1);
    line(dir_start_ [0], dir_start_ [1], dir_end_ [0], dir_end_ [1]);
    strokeWeight(7);
    point(dir_start_ [0], dir_start_ [1]);
  }
  
  void showDirWhileDefining(){
    strokeWeight(1);
    line(dir_start_ [0], dir_start_ [1], mouseX, mouseY);
    strokeWeight(7);
    point(dir_start_ [0], dir_start_ [1]);
  }
  
  void directionStart(float x, float y){
    dir_start_ [0] = x;
    dir_start_ [1] = y;
    mouse_pressed_ = true;
    px_ = x; py_ = y;
  }
  
  void directionEnd(float x, float y){
    dir_end_ [0] = x;
    dir_end_ [1] = y;
    mouse_pressed_ = false;
    
    speed_ = dist(dir_start_ [0], dir_start_ [1], dir_end_ [0], dir_end_ [1]);
    dir_x_ = dir_end_ [0] - dir_start_ [0];
    dir_y_ = dir_end_ [1] - dir_start_ [1];
    dir_x_ /= speed_;
    dir_y_ /= speed_;
    speed_ /= 15;
  }
  
}



