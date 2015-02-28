
float hSpeed = 0, vSpeed = 0, jumpHeight = -6, platSpeed = 3;
float gravity = 0.2, charSpeed = 2.6;
float direction = 0;
float radius = 25;
boolean isGrounded = false;
final int width = 640, height = 480;
float xCrd = width/2, yCrd = height - 25;


void setup() {
  size(width, height);
}

void draw() {
  PVector curLoc = new PVector(xCrd, yCrd);
  PVector platLoc = new PVector(250, 400);
  float platWidth = 30;
  PVector platLoc2 = new PVector(320, 280);
  float plat2Width = 110;
  PVector platLoc3 = new PVector(230, 340);
  float plat3Width = 50;
  PVector platLoc4 = new PVector(600, 100); 
  float plat4Width = 25;
  PVector platLoc5 = new PVector(465, 200);
  float plat5Width = 35;
  PVector platLoc6 = new PVector(300, 160);
  float plat6Width = 65;
  PVector platLoc7 = new PVector(505, 125);
  float plat7Width = 45;
  background(125);
  fill(0);
  rect(platLoc.x, platLoc.y, platWidth, 10);
  rect(platLoc2.x, platLoc2.y, plat2Width, 10);
  rect(platLoc3.x,platLoc3.y, plat3Width, 10);
  rect(platLoc4.x,platLoc4.y,plat4Width,10);
  rect(platLoc5.x,platLoc5.y,plat5Width,10);
  rect(platLoc6.x,platLoc6.y,plat6Width,10);
  rect(platLoc7.x,platLoc7.y,plat7Width,10);
  fill(255);
  //rect(xCrd,yCrd,25,25);
  ellipse(xCrd, yCrd, 25, 25);
  yCrd += vSpeed;
  xCrd += hSpeed;
  hSpeed = direction * charSpeed;
  vSpeed += gravity;
  if ( yCrd > height - 15 )  vSpeed = 0;
  if ( vSpeed != 0 )
    isGrounded = false;
  else
    isGrounded = true;

  if ( curLoc.x < 0 ) xCrd = 1;
  if ( xCrd > width - radius ) xCrd = width - radius - 1;
  if ( vSpeed > 0 && curLoc.y + 17 > platLoc.y && curLoc.y < platLoc.y + 1 && curLoc.x >= platLoc.x && curLoc.x <= platLoc.x + platWidth ) {
    vSpeed = 0; 
    isGrounded = true;
  }

  if ( vSpeed > 0 && curLoc.y + 17 > platLoc2.y && curLoc.y < platLoc2.y + 1 && curLoc.x >= platLoc2.x && curLoc.x <= platLoc2.x + plat2Width ) {
    vSpeed = 0; 
    isGrounded = true;
  }
  
  if ( vSpeed > 0 && curLoc.y + 17 > platLoc3.y && curLoc.y < platLoc3.y + 1 && curLoc.x >= platLoc3.x && curLoc.x <= platLoc3.x + plat3Width ) {
    vSpeed = 0; 
    isGrounded = true;
  }
  
  if ( vSpeed > 0 && curLoc.y + 17 > platLoc4.y && curLoc.y < platLoc4.y + 1 && curLoc.x >= platLoc4.x && curLoc.x <= platLoc4.x + plat4Width ) {
    vSpeed = 0; 
    isGrounded = true;
  }
  
  if ( vSpeed > 0 && curLoc.y + 17 > platLoc5.y && curLoc.y < platLoc5.y + 1 && curLoc.x >= platLoc5.x && curLoc.x <= platLoc5.x + plat5Width ) {
    vSpeed = 0; 
    isGrounded = true;
  }
  
  if ( vSpeed > 0 && curLoc.y + 17 > platLoc6.y && curLoc.y < platLoc6.y + 1 && curLoc.x >= platLoc6.x && curLoc.x <= platLoc6.x + plat6Width ) {
    vSpeed = 0; 
    isGrounded = true;
  }
  
  if ( vSpeed > 0 && curLoc.y + 17 > platLoc7.y && curLoc.y < platLoc7.y + 1 && curLoc.x >= platLoc7.x && curLoc.x <= platLoc7.x + plat7Width ) {
    vSpeed = 0; 
    isGrounded = true;
  }
}

void keyPressed() {

  switch(key) {
  case 'w':
    if ( isGrounded )
      vSpeed = jumpHeight;
  //  println(vSpeed);
  //  println(isGrounded);
    break;
  case 'a':
    direction = -1;
    break;
  case 'd':
    direction = 1;
    break;
  default:
    vSpeed = 0;
    break;
  }
}
void keyReleased() {
  switch(key) {
  case 'w':
    vSpeed *= 1.1;
    break;
  case 'a':
    direction = 0;
    break;
  case 'd':
    direction = 0;
    break;
  default:
    break;
  }
}

