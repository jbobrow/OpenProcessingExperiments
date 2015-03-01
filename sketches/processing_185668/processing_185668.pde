
float r,g,b,rd; //floating variables for precision

void setup(){ //one time run
  size(640,480); //program size
frameRate(30); // framerate
}

void draw(){ // refresh every frame
  background(255); // background color
  strokeWeight(0.2); // line weight
  stroke(0);  //location of stroke
  line(width/3,0, width/3, height); // line constraint, location, location, full height
  line(width/2*3,0, width/2*3, height); // line constraint, location, location, full height
  fill(r,g,b); // color fill
  noStroke(); // just add it
  if(mouseX < width/3){    //if mouse is over line, show rectangle left side, else show rectangle on right side
  fill(255,0,0); // RGB color picker
    rect(0,0,width/3, height); // rectangle contraints
  }else if(mouseX < width/3*2){ // if false, then action
     fill(255,0,255); // RGB color picker
    rect(width/3,0,width/3, height); // rectangle contraints, location, right side = first location, left side = 3rd location
    rd=5;
  }else{
    fill(0,255,255);
    rect(width/3*2,width/3*2,0, height);
}
}
