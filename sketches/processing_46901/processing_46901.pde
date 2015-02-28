
//carta para mi novia...
PFont tex;
float px=100, py=80, inc=30;
int escoge, lon, renglon, cambio=0, brake=0, s1, s2, s3, s4;

char abc[]= {
  'a', 'b', 'c', 'd', 'e', 'f', ' ', ' ', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ', 'o', 'p', 'q', 'r', 's', 't', 'q', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', ' '
};
String letras = new String(abc);

void setup() {
  size(800, 400);
  background(0);
  smooth();

  tex = loadFont("CourierNew36.vlw"); 
  textFont(tex);
  lon=letras.length();
  s1=int(random(3, 15));
  s2=int(random(3, 15));
  s3=int(random(3, 15));
  s4=int(random(3, 15));
}

void draw() {
  // frameRate(15);
  strokeWeight(5);
  scale(0.25);
  fill(255);
  escoge = int(random(lon));

  text(letras.charAt(escoge), px, py);
  px+=inc;

  if (px>width*4-50) {
    px=100;
    py=py+60+brake;
    renglon=renglon+1;
  }
  brake=0;
  if (py>height*4) {
    exit();
  }
  if (s1==renglon) {
    brake=60;
  }
  if (s2==renglon) {
    brake=60;
  }
  if (s3==renglon) {
    brake=60;
  }
  if (s4==renglon) {
    brake=60;
  }
}


