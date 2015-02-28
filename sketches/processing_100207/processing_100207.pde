
/**
 * Patterns. 
 * 
 * Move the cursor over the image to draw with a software tool 
 * which responds to the speed of the mouse. 
 */
 
void setup()
{
  size(640, 360);
  background(102);
  smooth();
}

void draw() 
{
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  // ユーザ関数variableEllipse()メソッドを呼び出して、現在のマウス座標と過去のマウス座標をパラメータとして送ります
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  // pmouseX, pmouseYは一つ前のフレームのマウス位置です
}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 
// このユーザ関数variableEllipse()はマウスの速度を算出して、その速度にあわせた円を描きます
void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}
