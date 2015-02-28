
class enemy1 {

  Float x,y;

  enemy1() {
  }

  void init() {

    x=1.0*width+100;
    y=random(90,height-90);

  }

  void update() {
    x-=4;
    
 //   fill(255,0,0);
 //   ellipse(x,y,75,75);
    imageMode(CENTER);
    image(jellyfish, x-jellyfish.width/3, y-jellyfish.height/3);
  }
}


