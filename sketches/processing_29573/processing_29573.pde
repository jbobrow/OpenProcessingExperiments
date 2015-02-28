
import joons.*;

JoonsRenderer jr;
boolean rendered = false;

float eyeX = 0;
float eyeY = 120;
float eyeZ = 40;
float centerX = 0;
float centerY = 0;
float centerZ = 40;
float upX = 0;
float upY = 0;
float upZ = -1;
float fov = PI / 4; 
float aspect = (float) 1.3333;  
float zNear = 5;
float zFar = 10000;

void setup() {
  size(400,300,P3D);
  jr = new JoonsRenderer(this,width,height);//just declare like this.
  jr.setRenderSpeed(1);//render speed is 1 by default. Set it to 2 for x2 speed. Set it to any number. Lowers quality.
}

void draw() {

  beginRecord("joons.OBJWriter","");//just call like this. Leave the second parameter as "".

  perspective(fov, aspect, zNear, zFar);//call perspective() before camera()!!
  camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);

  translate(0,-10,30);
  rotateZ(PI/8+zNear);
  rotateX(-PI/8);
  box(20);

  ambient(255,255,0);
  translate(0,-10,30);
  rotateZ(PI/6+zNear);
  rotateX(-PI/7);
  box(20);

  endRecord();

//  if(rendered)
    jr.display();
  //}
  //
  //void keyPressed() {
  //  if (key == 'r' || key == 'R' && !rendered) {
  saveFrame("capture"+frameCount+".png");
  jr.setSC("cornell_box.sc");
  rendered=jr.render("bucket");
  zNear++;
  // render using render("ipr") to render quick and rough,
  // and render("bucket") to render slow and smooth
  // if successfully rendered, render() returns true
  //  }
}


