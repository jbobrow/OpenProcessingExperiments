
class Dot{  
  PVector position;  
  boolean calling; 
    // am I calling?
  int neighbour_call_count = 0; 
    // variable to count how many nearby creatures are calling
  float dotSize = 5; // 
  int call_pitch = int(random(2,8))*120;
  float pitch_variation = 0.6666666667;
  int pitch_variation_2 = 3;
  int call_interval = int(random(90,100)); 
    // the time a creature has to wait before calling again
  int interval_counter = 0; 
    // the interval counter starts at 0
  float call_duration = 20.0;
  
  SineWave call_sound;
  SineWave call_sound_2;
  
  Dot(PVector _position){ 
    // a constructor - has the same name as the class; 
    // builds the new object;
    // takes input parameters
  position = _position;
  call_sound = new SineWave(call_pitch, 0.0, out.sampleRate());
  call_sound_2 = new SineWave(call_pitch * pitch_variation, 0.0, out.sampleRate());
  call_sound.setPan(map(position.x, 0, width, -1, 1));
  call_sound_2.setPan(map(position.x, 0, width, -1, 1));
  out.addSignal(call_sound);
  out.addSignal(call_sound_2);
  calling = true;
  }
  
void run(){
  call();
  render();
}

void call(){
 if (interval_counter > call_duration) calling=false; 
    // If the call has endured longer than the interval count, stop calling.
 neighbour_count = 0;
 float newAmp = max (0,call_sound.amplitude() - (call_volume/call_duration));
 call_sound.setAmp(newAmp); 
 if (vibra==true){
   call_sound_2.setAmp(newAmp);
     // Play the second frequency sound as well
 }
 if (vibra==false){
   call_sound_2.setAmp(0); 
     // to stop the second sound from remaining as a ghost

 }
   interval_counter ++; // add 1 to the interval counter
   for (int i=0; i<Dots.size(); i++){ 
    // for every dot, run the following code
    Dot otherDot = (Dot) Dots.get(i); 
      // get another dot from the array
    float distance = PVector.dist(position, otherDot.position); 
      // ID distance between
    if (distance < range_of_hearing) neighbour_count++;  
      // If the other dot is within range, count it as a neighbour
    if (distance < range_of_hearing && otherDot.calling == true) 
      neighbour_call_count ++;
      // if the neighbouring dot is calling, count it as a neighbour call
       
  }
  
  if (neighbour_call_count > neighbour_call_threshhold && interval_counter > call_interval) {
    // If you have heard enough calls, and waited long enough...
    calling=true; 
      // call!
    neighbour_call_count = 0; 
      // Reset the counter for your neighbours' calls
    call_sound.setPan(map(position.x, 0, width, -1, 1));
      // map the placement of dots to the stereo array of sound
   call_sound.setAmp(call_volume);
      // Set the volume of the call.
   dotSize = range_of_hearing;
      // Increase the dot size as much as the range of hearing
    interval_counter = 0; //int(random(-55,-45));
      // Reset the interval counter.
  }
  
  call_duration = 100/(neighbour_count+1);
        // Set the call to endure longer if the neighbours are fewer,
        // ie if the call is more rare.

}

void render(){   
strokeWeight(1);
   stroke(call_pitch/2,call_pitch,255-call_pitch/2,100);
      // Colour the lines according to the pitch of the call - not too much red, lots 
      // of green and blue in inverse relationship to the frequency, ie deepest notes 
      // are bluest.
   if (calling==true) fill (call_pitch/4,call_pitch/2,255-call_pitch/4,220);
      // Fill the dot like the lines only more intense colour.
   if (calling==false) fill (call_pitch/4,call_pitch/2,255-call_pitch/4,200);
   dotSize = max(20,dotSize-((range_of_hearing-35)/call_duration));    

   ellipse (position.x, position.y, dotSize, dotSize);
   noFill();

   ellipse(position.x, position.y, range_of_hearing,range_of_hearing);    
   for (int i=0; i<Dots.size(); i++){ 
       // for every dot, run the following code
     Dot otherDot = (Dot) Dots.get(i);       
     float distance = PVector.dist(position, otherDot.position); 
        // ID distance between         
     if (calling==true && distance < range_of_hearing 
         && otherDot.neighbour_call_count>=neighbour_call_threshhold-1) { 
         // If your call is about to set off another call...
       stroke(call_pitch/4,call_pitch/2,255-call_pitch/4,200);
       strokeWeight(20);
       line (position.x, position.y, otherDot.position.x, otherDot.position.y);

       }
     }
   strokeWeight(1);
}
}

