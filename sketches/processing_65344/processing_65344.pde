
import java.util.concurrent.CopyOnWriteArrayList; 

class Bullet {
  int bulletOn;
  int bulletX, bulletY;
}
PImage b;
CopyOnWriteArrayList<Bullet> franks=new CopyOnWriteArrayList<Bullet>();

void setup() {
  size(500,500);  
  b = loadImage("bullet-bill.jpg");
}

void draw() {
  background(0xffffffff);
  for (Bullet frank:franks) {
    image(b, frank.bulletX, frank.bulletY);
    frank.bulletY=frank.bulletY-10;
    if (frank.bulletY<=0) franks.remove(frank);
  }  
}
Bullet frank;
void mousePressed() {  
    System.out.println(mouseX+" "+mouseY);
    frank=new Bullet();
    frank.bulletOn=1; frank.bulletX=mouseX; frank.bulletY=height;
    franks.add(frank);
}

