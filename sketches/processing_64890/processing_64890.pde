
float _angnoise,_radiusnoise;
float _xnoise,_ynoise;
float _angle = -PI/2;
float _radius;
float _strokeCol = 254;
int _strokeChange = -1;

void setup(){
 
  size(320,320);
  smooth(); 
  frameRate(120);
  background(0);
  noFill();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
     background(255,0,0);

}

void draw(){
 
  
   _radiusnoise += 0.005;
   _radius = (noise(_radiusnoise) * 550 ) + 1;

   _angnoise += 0.005;
   _angle += (noise(_angnoise) * 1 ) - 3;
   if(_angle > 360){ _angle -= 360; }
   if(_angle < 0){ _angle += 360; }

  if( (_angle % 120 ) < 60)
  {
     return; 
  }
  
   _xnoise += 0.05;
   _ynoise += 0.05;
   float centerX = width/2 + (noise(_xnoise) * 100) - 50;
   float centerY = height/2 + (noise(_ynoise) * 100 ) - 50;
 
   float rad = radians(_angle);
   float x1 = centerX + (_radius * cos(rad));
   float y1 = centerY + (_radius * sin(rad));
 
   float opprad;// = rad + PI;
   float x2 = centerX + (_radius/4 * cos(rad));// + ( _radius/4 * cos(opprad));
   float y2 = centerY + (_radius/4 * sin(rad));// + ( _radius/4 * sin(opprad));
 
 /*
   _strokeCol += _strokeChange;
   if(_strokeCol > 254){_strokeChange = -1; }
   if(_strokeCol < 0 ){ _strokeChange = 1; }
*/
   stroke(255,60);
  
   strokeWeight(5);
   line(x1,y1,x2,y2);
  
}
