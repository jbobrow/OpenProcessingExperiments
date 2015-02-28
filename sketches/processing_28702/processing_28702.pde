
class Ball extends Node{
  float durchmesser;
  color farbe;
  
void zeichne(){
  fill(farbe);
  ellipse(x,y,durchmesser,durchmesser);
}

void zeichnelinie(){
stroke(farbe);
line (x,y,velocity.x,velocity.y);
}
}


