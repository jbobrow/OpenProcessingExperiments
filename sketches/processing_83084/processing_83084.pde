
class Snow {
  color snowColor=color(255);
  float snowSize=1;
  float posx=0, posy=0;
  float waving=random(-1, 1);
  float windSpeed=0;

  float gravity=1;
  Snow(int _posx, int _posy, color _snowColor, float _snowSize, float _gravity) {
    snowColor=_snowColor;
    snowSize=_snowSize;
    posx=_posx;
    posy=_posy;
    gravity=_gravity;
  }

  void display() {
    fill(snowColor);
    ellipse(posx, posy, snowSize, snowSize);
  }

  void falling() {
    float rad=random(1, 3);
    posy+=gravity; //posy=posy+gravity
    posx=posx+rad*cos(waving)+windSpeed;
    waving+=random(0, 0.05);
    display();
  }

  void windSpeed(float _windSpeed) {
    windSpeed=_windSpeed;
  }

  void resetPosition(int x, int y) {
    posx=x;
    posy=y;
  }

  void resetAttribute(int _posx, int _posy, color _snowColor, float _snowSize, float _gravity) {
    snowColor=_snowColor;
    snowSize=_snowSize;
    posx=_posx;
    posy=_posy;
    gravity=_gravity;
  }
}


