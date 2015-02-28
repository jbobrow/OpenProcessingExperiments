
/*
Electron simulation by Mac Goldwhite
*/
float maxrandvel=1;  // max vel
float maxvel = 3;
ArrayList electrons; //create arraylist
int bufferzone=40;  // size of buffer around screen for fade effect
float randomness=1;
int fadetime=150;
float selectionrad=40;
float friction=2;
PImage diagram;

void setup(){
  diagram = loadImage("diagram.png"); // load diagram
  noCursor();
  smooth();
  frameRate(30);
  size(1040,600);
  background(0);
  electrons = new ArrayList();  // the glory
}

void draw(){
  noStroke();
  fill(0,fadetime);
  rect(-bufferzone,-bufferzone,width+bufferzone,height+bufferzone);
  chart();  //draw background chart
  drawer(); // draw purdy mouse
  for(int i=0;i<electrons.size();i++){  // iterate through arraylist
    electron Electron = (electron) electrons.get(i);
    Electron.vel.x+=random(-randomness,randomness); //add randomness
    Electron.vel.y+=random(-randomness,randomness); //add randomness
    if (mousePressed && mouseButton == RIGHT){
      if((Electron.wayloc.x-mouseX)*(Electron.wayloc.x-mouseX)+(Electron.wayloc.y-mouseY)*(Electron.wayloc.y-mouseY)<selectionrad){
      Electron.dragging=true;
      }
    }
    Electron.simulate(); // simulate particle
    Electron.display(); // display particle
    Electron.checkifdone(); // check for doneness
    if(Electron.done == true && keyPressed){  // if its done say bye bye (check extra carefully to avoid bugs)
      electrons.remove(i);
    }
  }
  
  
}

  void mousePressed(){ // change back to mousePressed after testing
    if(mouseButton == LEFT){
    electrons.add(new electron(mouseX,mouseY));
    }
  }
  
  void mouseReleased(){
    for(int i=0;i<electrons.size();i++){  // iterate through arraylist
    electron Electron = (electron) electrons.get(i);
    Electron.dragging=false; // when mouse release you are not dragging anymore
    }
  }
  
  void keyPressed(){
    if(key == 'c'){
    for(int i=0;i<electrons.size();i++){  // iterate through arraylist
    electron Electron = (electron) electrons.get(i);
    Electron.done=true;
    }
    }
  }
  void chart(){
  image(diagram,10,10,width-50,height-50); //draw the chart
  }
  void drawer(){
    strokeWeight(7);
    stroke(0,0,255);
    line (mouseX,mouseY,pmouseX,pmouseY); 
    strokeWeight(2);
    stroke(255);
    line (mouseX,mouseY,pmouseX,pmouseY); 
  }


// write classes bellow here ///
////************************////
////VVVVVVVVVVVVVVVVVVVVVVVV////


class electron{  // an electron object
  PVector loc; // loaction
  PVector wayloc;
  PVector wayvel;
  PVector vel; // velocity
  float speed; //speed
  boolean dragging = false;
  boolean done = false;
  
  electron(float xpos,float ypos){
    loc = new PVector(xpos,ypos);
    wayloc = new PVector(xpos,ypos); // waypoint location
    wayvel = new PVector (0,0); //waypoint velocity
    vel = new PVector(random(-maxrandvel,maxrandvel),random(-maxrandvel,maxrandvel));
  }
  
  void simulate(){
        if (dragging==true){
      wayvel.x-=(wayloc.x-mouseX);
      wayvel.y-=(wayloc.y-mouseY);
    }
    wayvel.limit(maxvel+20);
    wayloc.add(wayvel);
    vel.x-=(loc.x-wayloc.x);
    vel.y-=(loc.y-wayloc.y);
    wayvel.div(friction); //divide by friction
    loc.add(vel);
    vel.limit(maxvel); // limit velocity by max velocity
    speed=vel.mag(); // speed is the magnitude of velocity
  }
  
  void checkifdone(){
    if(dragging == true){  //check if d is pressed an delete if so
      if(mouseButton == RIGHT && key == 'd'){
        done=true;
      }
    }
  }
  
  void display(){
    strokeWeight(1.5);
    if(dragging==true){ // if dragging is one red
      stroke(255,0,0); // if draggin is false green
    }else{
    stroke(0,255,0);
    }
    line(loc.x,loc.y,loc.x-vel.x-wayvel.x*2,loc.y-vel.y-wayvel.y*2);
  }
  
}

/*
  ____ __     ____   ___ ______ ____    ___   __  __
 ||    ||    ||     //   | || | || \\  // \\  ||\ ||
 ||==  ||    ||==  ((      ||   ||_// ((   )) ||\\||   
 ||___ ||__| ||___  \\__   ||   || \\  \\_//  || \||
                                                    
 __                                                   
/\  _`\               /'\_/`\                           
\ \ \L\ \  __  __    /\      \     __      ___          
 \ \  _ <'/\ \/\ \   \ \ \__\ \  /'__`\   /'___\        
  \ \ \L\ \ \ \_\ \   \ \ \_/\ \/\ \L\.\_/\ \__/        
   \ \____/\/`____ \   \ \_\\ \_\ \__/.\_\ \____\       
    \/___/  `/___/> \   \/_/ \/_/\/__/\/_/\/____/      
               /\___/                                   
               \/__/                                    
*/


