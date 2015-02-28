
class Cupcake extends Object_ {
  PImage img;
  Cupcake () { 
    super();
  }
//constructor
  Cupcake (float x_, float y_, PImage img_) {
    this.x = x_;
    this.y = y_;
    this.width = 50;
    this.height = 50;
    this.children = new ArrayList();
    this.isCollidable = true;
    this.life = 255;
    this.img=img_;

  }

  void draw(){
      image(img, this.x,this.y,this.width,this.height);
      }

  void run () {
    this.x+=2;
    this.draw();
}

  void onCollision(){
    this.life = 0;
  }

}

