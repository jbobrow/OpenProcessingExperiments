
Backdrop sky = new Backdrop();
slim player = new slim();
object[] boxes = new object[8];
float speed = 1;
PImage cupBox;




class object {
  PVector hitLoc = new PVector(0, 0);
  float timer = 2;
  float arc = 0;
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  PImage img;//generic image container for assigning image at instantiation 

  /*void setup() {// use for unique instances, ie: bonus items
   }*/

  object() {

    this.img = cupBox;
  }
  object(float x, float y) {
    this.img = cupBox;
    this.pos.x=x;
    this.pos.y=y;
  }
  object(PImage image) {
    this.img = image;
  }
  void draw() {
    //image(this.img,this.pos.x,this.pos.y);
    image(this.img, this.pos.x, this.pos.y);
    if (this.hit&&timer>1.7) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (player.pos.x + 64 > this.pos.x 
      && player.pos.x -64 < this.pos.x 
      && player.pos.y -64 < this.pos.y
      && player.pos.y +64 > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
        // boxSnd.load();
        //  boxSnd.play();
        //  player.boxCount++;
      }
      this.hit = true;
    }
    //move boxes
    if (this.hit) {
      timer-=.1;
      if (this.timer>1) {
        this.pos.y-=30*(this.timer-1);
      }
      if (this.timer<1) {
        this.pos.y+=30*(1-this.timer);
      }
    }
    if (this.pos.x > -128) {
      this.pos.x-=12*speed;//move at same rate as scroll
    }
    if (this.pos.x<-128||this.pos.y<-16||this.pos.y>512) {
      this.pos.x = 1024+random(2048);//stagger boxes starting pos to the right of the screen
      this.pos.y=340;
      this.timer=2;
      this.hit=false;
    }
  }
}


class slim {
  // int boxCount = 0;
  //  int health = 3;
  float gravity = 0;
  float floor=380;
  float timer = 2;
  Boolean jump =false;
  PVector pos = new PVector(512, floor);
  float frame = 1;
  PImage[] slimOld = new PImage[10];
  void setup() {

    for (int i=0;i<10;i++) {
      slimOld[i] = requestImage("slimOld"+(i)+".png");
    }
  }
  slim() {
  }
  void draw() {

    //if (this.frame<9&&this.frame>=0) {
    imageMode(CENTER);
    image(slimOld[int(frame)], this.pos.x, this.pos.y, 256, 128);
    imageMode(CORNER);

    //}
  }
  void update() {
    if (this.frame<10&&this.frame>=0) {
      this.frame+=speed;//move to next frame
    }
    if (!(this.frame<10&&this.frame>=0)) {
      this.frame=0;
    }
    if (!this.jump) {
      // this.pos.y=this.floor;
    }
    if (this.floor>380||this.pos.y>380) {
      this.floor = 380;
      this.pos.y=380;
    }
    if (this.jump == true) {

      timer-=.07;
      if (this.timer>1) {
        this.pos.y-=30*(this.timer-1);
      }
      if (this.timer<1&&this.pos.y<=this.floor) {
        this.pos.y+=30*(1-this.timer);
      }
      if (this.timer<=0||this.pos.y>=this.floor) {
        //this.pos.y=this.floor;
        this.jump=false;
        this.timer=2;
      }
    }

    if (this.pos.y<this.floor&&!this.jump) {
      //this.floor=380;
      this.pos.y+=45*this.gravity;
      this.gravity+=.05;
      //this.jump=true;
      /*}
       else if (this.pos.y>=this.floor) {
       this.pos.y=this.floor;
       this.jump=false;
       this.timer=2;
       }*/

      if (this.floor!=380) {
        this.floor=380;
      }
    }
    else if (!this.jump) {

      this.gravity=0;
    }
  }
}



class Backdrop {
  PImage ground;
  float x_pos = 0;


  void draw() { 
    if (x_pos<48) {
      this.x_pos+=12*speed;

      for (int i=0;i<width+this.x_pos;i+=48) {
        image(ground, i-this.x_pos, 0, 48, 480);
      }
      if (this.x_pos>47) {
        this.x_pos=0;
      }
    }
  }
  Backdrop() {
    this.ground = requestImage("tile.png");
  }
}  

void setup() {

  cupBox = requestImage("box.png");

  for (int i=0;i<boxes.length;i++) {//setup boxes initial positions
    boxes[i] = new object();
    boxes[i].pos.x = 1024+random(1024);//stagger boxes starting pos to the right of the screen
    boxes[i].pos.y = 320;
  }
  //box.setup(); had to be moved to global? setup to accomidate array of boxes
  player.setup();
  size(1024, 480);
  frameRate(30);
}
void draw() {

  sky.draw();

  player.update();
  player.draw();
  for (int i=0;i<boxes.length;i++) {//update boxes: move and check for collisions, see object.update
    boxes[i].update();
    boxes[i].draw();
  }
  //boxes.draw();
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode==UP&&player.jump==false) {
      player.jump=true;
    }
  }
}



