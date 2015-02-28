
import traer.physics.*;

public void setup() {
  size(700, 700);
  background(0);

}

float sinVal, cosVal, angle;
int sunWidth, sunHeight;

public class SolarSystem {
  color clr;
  float radius;
  public SolarSystem() {
    clr = color(50);
  } 
  public SolarSystem( color clr, float radi) {
    clr = clr;
    radius = radi;
  }
}
public class Sun extends SolarSystem {
  public Sun(color clr, float radi) {
    super(clr, radi);
  }
  public Sun() {
    fill(0, 255, 255);
    sunWidth = width/3;
    sunHeight = height/2;
    ellipse( sunWidth, sunHeight, 100, 100);
  }
} 
public class Earth extends SolarSystem {
  public Earth( color clr, float radi) {
    super(clr, radi);
  }
 
  float r;
  public Earth(float sine, float cosine, float radi) {
    fill(128,128,128);
    translate(sunWidth, sunHeight);
    ellipse(cosine, sine, radi, radi);//to increase distance rovolve add onto cosine and sine
    r = radi;
    changeSize(r);
  }
}

public class Moon extends SolarSystem {
  public Moon( color clr, float radi) {
    super(clr, radi);
  }
 
  float r;
  public Moon(float sine, float cosine, float radi) {
    fill(128,128,128);
    translate(r, r);
    ellipse(cosine, sine, radi, radi);
    r = radi;
    changeSize(r);
  }
}

void draw() {
  background(0);
  angle += 0.02;
  sinVal = sin(angle) *90;
  cosVal = cos(angle) *90;
  Sun sun = new Sun();
  Earth earth1 = new Earth(sinVal + 50, cosVal , 30);
  Earth earth = new Earth(sinVal, cosVal, 15);

  //Moon moon = new Moon(sinVal, cosVal, 20);

}

public void changeSize(float r) {
  if (keyPressed) {
    if ( key == '+') {//increase size
    System.out.println("Yes?");
       r++;
    } else if ( key == '-') {//decrease size
        r--;
    } else {
    }
  }
}
