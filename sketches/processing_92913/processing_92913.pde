
class Pup {
  int x_loc;
  int y_loc;
  int x_loc_random;
  int y_loc_random;
  int c_pup;
  int welkePup;
  int deathteller;
  int deathtimer;
  int colorrandom;

  Pup() {
    deathteller = 0;
    deathtimer = step*20;
    colorrandom = int(random(1, 5));
    println(colorrandom);
    if (colorrandom == 1){
      c_pup = #58D1BD;
    }else  if (colorrandom == 2){
      c_pup = #D15858;
    }else  if (colorrandom == 3){
      c_pup = #F2C633;
    }else  if (colorrandom == 4){
      c_pup = #5B3C9E;
    }
    x_loc_random = int(random(1, (width/gridsize+1)));
    y_loc_random = int(random(1, (height/gridsize+1)));
    x_loc = x_loc_random * gridsize - (gridsize/2);
    y_loc = y_loc_random * gridsize - (gridsize/2);
  } 

  void display(int welkePup_param) {
    deathteller++;
    if (deathtimer == deathteller) {
      powerup.remove(welkePup_param);
    }
    welkePup = welkePup_param;
    ellipseMode(CENTER);
    noStroke();
    fill(c_pup);
    ellipse(x_loc, y_loc, gridsize/2, gridsize/2);
  }


  int GetXloc() {
    return x_loc;
  }
  int GetYloc() {
    return y_loc;
  }
  int GetPup() {
    return welkePup;
  }
}


