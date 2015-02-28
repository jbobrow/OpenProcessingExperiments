
public class Bamboo {

  PVector tip = new PVector(0,0);//    ^
  PVector curvy = new PVector(0,0);//  |
  PVector stalk = new PVector(0,0);//  |
  PVector root = new PVector(0,0); // base

  float segmentLength;
  Bamboo (float _xLoc, float _yLoc){
    // this is where we set the initial variables for the Bamboo object
    // these will include variables passed from the mouse including x,y location
    root.x = _xLoc;// passed from the mouseX
    root.y = _yLoc;// passed from the mouseY

    segmentLength = (root.y - ( height - ( height / 5 ))) * 2;
  }

  void update(float _gust){
    render(_gust);
  }

  void render(float _angle){

    stroke(75, 200, 35);
    strokeWeight(segmentLength/10);  //range 0-10 float sclaed to e
    noFill();
    // if statement declaring mouse click drawing bamboo

    stalk.x = (sin(radians(_angle+180)) * segmentLength) + root.x;
    stalk.y = (cos(radians(_angle+180)) * segmentLength) + root.y;

    curvy.x = (sin(radians(_angle*2+180)) * segmentLength) + stalk.x;
    curvy.y = (cos(radians(_angle*2+180)) * segmentLength) + stalk.y;
    
    tip.x = (sin(radians(_angle*3+180)) * segmentLength) + curvy.x;
    tip.y = (cos(radians(_angle*3+180)) * segmentLength) + curvy.y;

    beginShape();
    curveVertex  (root.x, root.y);  //mouseX click if Y greater than 4/5 height
    curveVertex  (root.x, root.y);   //mouseX click if Y greater than 4/5 height
    curveVertex  (stalk.x, stalk.y);  //mouseX, 3/4 prev height 
    curveVertex  (curvy.x, curvy.y);  //mouseX* (2*gust), 1/2 prev height
    curveVertex  (tip.x, tip.y);  //mouseX* (5*gust), 1/2 prev height
    curveVertex  (tip.x, tip.y);  //mouseX* (5*gust), 1/2 prev height
    endShape();

  }
}











