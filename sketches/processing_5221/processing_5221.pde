
public class Blobbie {
  float x, y;
  color c;
  float speed;
  float angle;
  int eaten;
  boolean deleteMe;

  public Blobbie(float x, float y, color c){
    this.x = (int) x;
    this.y = (int) y;
    this.c = c;
    eaten = 1;
    speed = random(3, 3);
    angle = random(0, 2*PI);
    deleteMe = false;
  }

  void draw(){
    int d = getR()*2;
    color lighter = lerpColor(c, #ffffff, 0.5);
    fill(lighter, 128);
    ellipse(x, y, d+blur, d+blur);
    fill(c);
    ellipse(x, y, d, d);
    
    fill(0);
    if (showEaten){
      textAlign(CENTER);
      text(eaten, x, y+4);
    }
  }

  int getR(){
    return 5 + 2 * (int) (sqrt(eaten) + 0.5);
  }

  void move(){
    float vx = speed * cos(angle);
    float vy = speed * sin(angle);
    x += vx;
    y += vy;

    // bounce off edges? 
    if((x<getR()) || (x>width-getR())){
      vx = -vx;
      x += vx;
    }
    if ((y<getR()) || (y>height-getR())){
      vy = -vy;
      y += vy;
    }

    angle = atan2(vy, vx);
    float onedeg = PI/180.0;
    angle += random(-onedeg, onedeg) * 5.0;

    // move 'em back on track
    x = constrain(x, getR(), width-getR());
    y = constrain(y, getR(), height-getR());

  }

  void eat(Blobbie b2){
    b2.deleteMe = true;
    eaten += b2.eaten;
    c = lerpColor(c, b2.c, 0.5);
  }

  void spawn(int children){
    for (int i=0; i<children; i++){
      int d = getR()*2;
      color c2 = c;

      if (mutationEnabled & random(1000) < 1){
        c2 = randomColor();
      }
      Blobbie b = new Blobbie(x-d+random(2*d), y-d+random(2*d), c2);
      blobbies.add(b);
      eaten--;
    }
  }
}


