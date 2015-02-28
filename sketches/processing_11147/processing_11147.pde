
// This class draws the bullets from the stickman gun, and sets the height that each bullet will explode

class Bullet
{

float xpos; 
float ypos; 
float exypos;

Bullet(float xpos, float ypos, float exypos)

{
  this.xpos = xpos;
  this.ypos = ypos;
  this.exypos = exypos;
}

void update()

{ ypos = ypos - speedy;
  
  drawagain();
}

boolean boomtime() {
  if (ypos <=exypos) {
  return true;
  }
  else return false;
}

void drawagain()

{ stroke(255,255,255);
  fill(255,255,255);
  ellipse(xpos,ypos,5,5); 
}
}

