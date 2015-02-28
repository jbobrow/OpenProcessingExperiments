
/**
 * Moving On Curves. 
 * 
 * In this example, the circles moves along the curve y = x^4.
 * Click the mouse to have it move to a new position.
 */

float beginX = 20.0;  // Initial x-coordinate
float beginY = 10.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path //ここで何ステップ使って追従するか決定します
float pct = 0.0;      // Percentage traveled (0.0 to 1.0) //アニメーションの進行度合いを0.0→1.0で扱っています

void setup() 
{
  size(640, 360);
  noStroke();
  smooth();
  distX = endX - beginX;
  distY = endY - beginY;
}

void draw() 
{
  fill(0, 2); //この2番目の引数が透明度(alpha) で残像をつくっています。いろんな値にしてみましょう。
  rect(0, 0, width, height);
  pct += step; //ここでstepの分だけアニメーションを進行させます
  if (pct < 1.0) {
    //X方向は目標座標までの距離を進行度にあわせて加算します
    x = beginX + (pct * distX);
    //Y方向は目標座標までの距離に進行度のべき乗(サンプルでは4乗)をかけて加算します
    //たとえば進行度10%なら0.1*0.1*0.1*0.1=0.0001となり非常に少ない値ですが、
    //進行度90%なら0.6561になり、グッと近づいてきます。
    // exponentはサンプルでは4ですが、20ぐらいにすると驚きの速さに。
    y = beginY + (pow(pct, exponent) * distY);
  }
  fill(255);
  ellipse(x, y, 20, 20);
}

//マウスが押されたときに呼ばれる関数です(mousePressed()は予約されています)
//現在のマウスのXY座標を目標座標にして距離を算出します
void mousePressed() {
  pct = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}
