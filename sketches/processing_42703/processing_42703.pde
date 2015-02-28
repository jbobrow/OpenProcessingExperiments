
float px, py;
float x, y;
float easing = 0.09;
float easedx, easedy;
float ppx,ppy;

void setup()
{
  size(800, 800);
  smooth();
  background(255);
}

void draw()
{

  if (keyPressed) {
    if ( key=='s'||key=='S') {
      float targetX=mouseX;
      float targetY=mouseY;

      easedx += ( targetX-easedx)*easing;
      easedy += (targetY-easedy)*easing;

      float speed = dist(easedx, easedy, px, py);
      strokeWeight(speed*3);
      fill(0, 255);
      line(easedx, easedy, px, py);

      px=easedx;
      py=easedy;
    }
  
    if (key=='r'||key=='R'){
      stroke(255,0,0);
    }
    if (key=='g'||key=='G'){
      stroke(0,255,0);
    }
    if (key=='b'||key=='B'){
      stroke(0,0,255);
    }
    if (key=='k'||key=='K'){
      stroke(0);
    }
    if (key=='a'||key=='A'){
      float targetX=mouseX;
      float targetY=mouseY;
    

      easedx += ( targetX-easedx)*easing;
      easedy += (targetY-easedy)*easing;

      float speed = dist(easedx, easedy, px, py);
      strokeWeight(3);
      fill(0, 255);
      point(mouseX,mouseY);
      px=easedx;
      py=easedy;
    }
    if(key=='d'||key=='D'){
    strokeWeight(2);
    fill(0,255);
    line(mouseX,mouseY,ppx,ppy);
    ppx=mouseX;
    ppy=mouseY;
    }
    if(key=='w'||key=='W'){
    stroke(255);
    strokeWeight(10);
        fill(0,255);
    line(mouseX,mouseY,ppx,ppy);
    ppx=mouseX;
    ppy=mouseY;
    }
  }
  else {
  }
}

void mousePressed()
{
  if (mouseButton==LEFT){
  background(255);
  }
  else{
    saveFrame("paint-##.jpg");
  }
}


