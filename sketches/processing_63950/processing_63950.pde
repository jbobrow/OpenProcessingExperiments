
import ddf.minim.*;

Minim minim;
AudioInput in;

int x;
float angle;
float data;
int speed;


void setup() {
  size(600, 600, P3D);
  background(255);
  minim = new Minim(this);
  minim.debugOn();

  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  background(255);
  stroke(0);
  quad(150, 150, 450, 150, 450, 450, 150, 450);
  quad(0, 0, 600, 0, 450, 150, 150, 150);
  quad(600, 0, 600, 600, 450, 450, 450, 150);
  quad(600, 600, 0, 600, 150, 450, 450, 450);
  quad(0, 0, 150, 150, 150, 450, 0, 600);

  int centerX, centerY;
  ambientLight(100, 100, 100); 		//環境光設定
  directionalLight(126, 126, 126, 0, 0, -1);//ディレクショナル・ライト設定

  centerX = width/2;
  centerY = height/2;
  rectMode(CENTER);
  translate(centerX, centerY, 50);

  mousePressed();

  pushMatrix();
  noStroke(); 
  box(150);
  popMatrix();
}

void mousePressed(){

  if((in.left.get(5)*50)>=5){
    angle = radians(x-width/2);	//Y軸の回転角度
    rotateY(angle); 		//Y軸回転
    data = (in.left.get(5)*50)/1;

    x+=data;  // frameRate
    println(data);
  }
}
  
void stop()
{
  in.close();
  minim.stop();

  super.stop();
}



