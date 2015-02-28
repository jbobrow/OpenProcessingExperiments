
Boolean fire; //controls missiles
int xmouse; //makes sure the missiles don't travel with the ship but instead straight

void setup() {
  size(300, 300);
  background(0);
  fire = false;

}

int launch = 35;


void draw() { //makses the ship move left and right

  background(0);

  //Spaceship
  triangle(mouseX, height-50, mouseX-10, height-35, mouseX+10, height-35);
  strokeWeight(3);
  stroke(255);
  //Blasters
  line(mouseX-11, height-35, mouseX-11, height-45);  
  line(mouseX+11, height-35, mouseX+11, height-45);
  
  if(fire){ //this function fires the missles from the ship
    strokeWeight(1);
    line(xmouse+11, height-launch, xmouse+11, height-launch-5); 
    line(xmouse-11, height-launch, xmouse-11, height-launch-5);
    launch++;
  }else{
    launch=35; //resets the starting location of the missiles
  }

}

void mousePressed(){ //fires the missiles when the mouse is clicked
  
  if(fire){
    fire = false;
    xmouse=mouseX;
  }else{
    fire = true;
  }
    
  
}

