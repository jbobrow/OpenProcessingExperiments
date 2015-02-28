
float num = 0;
PVector otomouse = new PVector();
color boxcolor, bgcolor = 0;
float tmp;

void setup(){
  size(500, 500, P3D); 
  //frameRate(30);
  colorMode(HSB, 100);
  boxcolor = color(100, 50);
}

void draw(){
  otomouse.set(mouseX - width/2, height/2 - mouseY);
  otomouse.normalize();
  //processingjs doesn't accept PVector.rotate()
  tmp = otomouse.x;
  otomouse.x = otomouse.y;
  otomouse.y = tmp;
  background(bgcolor);
  num += PI/32;
  stroke(100);
  line(0, height, 0, 0, height, -width);
  line(0, 0, 0, 0, 0, -width);
  line(width, 0, 0, width, 0, -width);
  line(width, height, 0, width, height, -width);
  line(0, 0, -width, 0, height, -width);
  line(0, height, -width, width, height, -width);
  line(width, height, -width, width, 0, -width);
  line(width, 0, -width, 0, 0, -width);
  translate(width/2, height/2, -width/2);
  //processingjs doesn't support the remaining 3 arguments of rotate
  //rotate(num, otomouse.x, otomouse.y, 0);
  //this is a workaround, see below:
  rotateAround(num, otomouse.x, otomouse.y, 0);
  stroke(0);
  fill(boxcolor);
  box(width/3);
}

void mousePressed(){
  boxcolor = color(random(100), 100, 100, 50);
  bgcolor = color(random(100), 100, 50);
}
//taken from http://processing-js.lighthouseapp.com/projects/41284/tickets/1929-rotate-a-x-y-z-missing
void rotateAround (float angle, float v0, float v1, float v2) 
{
    float norm2 = v0 * v0 + v1 * v1 + v2 * v2;
    if (Math.abs(norm2 - 1) > EPSILON) {
        float norm = sqrt(norm2);
        v0 /= norm;
        v1 /= norm;
        v2 /= norm;
    }

    float cx = 0;
    float cy = 0;
    float cz = 0;

    float c = cos(angle);
    float s = sin(angle);
    float t = 1.0f - c;
    float[] m = new float[9];
    m[0] = (t*v0*v0) + c;          // 0, 0
    m[1] = (t*v0*v1) - (s*v2);     // 0, 1
    m[2] = (t*v0*v2) + (s*v1);     // 0, 2

    m[3] = (t*v0*v1) + (s*v2);     // 1, 0
    m[4] = (t*v1*v1) + c;          // 1, 1
    m[5] = (t*v1*v2) - (s*v0);     // 1, 2

    m[6] = (t*v0*v2) - (s*v1);     // 2, 0
    m[7] = (t*v1*v2) + (s*v0);     // 2, 1
    m[8] = (t*v2*v2) + c;          // 2, 2

    applyMatrix( m[0], m[1], m[2], 0, m[3], m[4], m[5], 0, m[6], m[7], m[8], 0, 0, 0, 0, 1 );
}



