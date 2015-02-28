
/*
Jack Kirkpatrick
Description: The cline class holds pitch and velocity information
that are input from a MIDI device. It also handles the drawing of
lines around the circle.
*/

class cline {

  ArrayList<Integer> pitchList = new ArrayList<Integer>();  
  ArrayList<Integer> velocityList = new ArrayList<Integer>();

  float circleTime, multiplier, y, yOriginal;

  cline(int frameRt, int tempo, int beats) {
    circleTime = ((2*PI)/beats)/(frameRt/(tempo/60));
    
    //the amount that the lines spiral in, 0 for no spiral. 0.0005 for small spiral
    multiplier=0;
    y=4.5;
    yOriginal=y;
  }

//adds the pitch and velocity to the arrays, or if they already exist, deletes them.
  void inSwitch(int vel, int pit){
    if(!clineExists(pit)){
      pitchList.add(pit);
      velocityList.add(vel);
      System.out.println("added " + pit);
    }
    else {
      //if the key was pressed once, delete it the 2nd time
      clineDelete(pit);
    }
  }

//delete the velocity and pitch from the array
  void clineDelete(int pitch){
    for (int i=0;i<pitchList.size();i++){
      if(pitchList.get(i) == pitch){
        pitchList.remove(i);
        velocityList.remove(i);
      }
    }
  }

//returns true if the pitch exists in the ArrayList
  boolean clineExists(int pitch){
    for (int i=0;i<pitchList.size();i++){
      if(pitchList.get(i) == pitch){
        System.out.println("EXISTS");
        return true;
      }
    }
    return false;
  }
  
  //clears both arrays
  void clear(){
    pitchList.clear();
    velocityList.clear();
    x=0;
    y=yOriginal;
  }

/*
  float drawLines(float x) {
    for(int i=0;i<pitchList.size();i++){
      stroke(velocityList.get(i)*random(1.8,2.2),random(70,100),velocityList.get(i)*random(1.8,2.2));
      strokeWeight(3);
      line(sin(x)*pitchList.get(i)*(1.5+y)+(width/2),
        cos(x)*pitchList.get(i)*(1.5+y)+(width/2),
        sin(x-circleTime)*pitchList.get(i)*(1.5+y)+(width/2),
        cos(x-circleTime)*pitchList.get(i)*(1.5+y)+(width/2));
    }
    x+=circleTime;
    y-=multiplier;
    return x;
  }
*/

  float drawLines(float x) {
    for(int i=0;i<pitchList.size();i++){
      stroke((velocityList.get(i))*2,25,velocityList.get(i)*3,50);
      strokeWeight(4);//velocityList.get(i)/32);
      line(sin(x)*pitchList.get(i)*y+(width/2),
        cos(x)*pitchList.get(i)*y+(width/2),
        width/2,height/2);
    }
    x+=circleTime;
    y-=multiplier;
    return x;
  }
}

