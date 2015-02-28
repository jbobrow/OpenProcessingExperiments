
/*CONTROLS:
 KEYBOARD:
 UP ARROW = INCREASE JITTERVALUE
 DOWN ARROW = DECREASE JITTERVALUE
 1 = COLOR1
 2 = COLOR2
 */


PVector [] v;// direction vector
PVector jitter;//jitter vector
int n = 500;//number of agents
float jitterVal = 2;//jitter strength and range
color color1, color2;//two colors
int opaq;//opacity factor
int value = 1;//color toggle
int rad = 2;//radius of ellipse
//============================================================================
void setup() {
  size(1200, 300);
  background(255);
  smooth();
  noStroke();

  opaq = 50;//setting opacity
  color1 = color(119, 181, 156, opaq);//setting color1
  color2 = color(255, opaq);//setting color2

  v = new PVector[n];//generates n new vector

  //choose from multiple start modes
  for (int i = 0; i < v.length; i++) {
    v[i] = new PVector(random(20, width - 20), random(20, height - 20));//starts randomly
    //v[i] = new PVector(random(width/2 - 20, width/2 + 20), random(height/2 - 20, height/2 + 20));//starts from center of screen
    //v[i] = new PVector((width/v.length)*i, height/2);//start from center line
  }
}

//============================================================================
void draw() {
  for (int i = 0; i < v.length; i++) {
    jitter = new PVector(random(-jitterVal, jitterVal), random(-jitterVal, jitterVal)); //initiates jitter movement

    v[i].y = v[i].y + jitter.y;// Y component is affected by jitter.y
    v[i].x = v[i].x + jitter.x;//X component is affected by jitter. x

      //graphical output
    if (value == 1) {
      fill(color1);
      ellipse(v[i].x, v[i].y, rad, rad);
    }
    if (value == 2) {
      fill(color2);
      ellipse(v[i].x, v[i].y, rad, rad);
    }
  }
}
//=================================================================================================================================================================
void keyPressed() {
  
  if(key == 'r'){
   saveFrame("snapshot.jpeg"); 
  }
  
  if (key == '2') {
    value = 2;
  }

  if (key =='1') {
    value = 1;
  }

  if (keyCode == UP) {
    jitterVal = jitterVal + 0.5;
  }

  if (keyCode == DOWN) {
    jitterVal = jitterVal - 0.5;
  }
}




