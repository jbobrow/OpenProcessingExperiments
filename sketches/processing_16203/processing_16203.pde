

float attract(float o, float x1, float y1, float x2, float y2, float change) {


  float dp = direction_to(x1, y1, x2, y2);
    if(dp > o) {
    if( dp - o < 360 -dp + o) {
      return change;
    }
    else {
      return change*-1;
    }
  }

  if(dp < o) {
    if(  o - dp < 360-o+dp ) {
      return change*-1;
    }
    else {
      return change;
    }
  }
  return 0;
}


float repulse(float o, float x1, float y1, float x2, float y2, float change) {


  float dp = direction_to(x1, y1, x2, y2);
  if(dp > o) {
    if( dp - o < 360 -dp + o) {
      return change*-1;
    }
    else {
      return change;
    }
  }

  if(dp < o) {
    if(  o - dp < 360-o+dp ) {
      return change;
    }
    else {
      return change*-1;
    }
  }
  return 0;
}



float direction_to(float one_x_loc, float one_y_loc, float two_x_loc, float two_y_loc) {
  float a = degrees(atan2(one_y_loc - two_y_loc, one_x_loc- two_x_loc)) +180 ;
  return a;
}


float clamp_heading(float heading) {

  if(heading >= 360) {
    heading = heading - 360;
  }

  if(heading < 0) {
    heading = heading + 360;
  }
  return heading;
}


float distance(float x1,float y1, float x2, float y2) {
  return sqrt(  sq(x2 - x1) + sq(y2 - y1));
}


