
Bird bird;
int time=0;
float back_offset=0;
int img_count=0;
int salto=30000;
PImage vog1,vog2,vog3,vog4,back,rosa;
PVector p,s;//position and speed of the bird
float rot=0;
void setup() {
  size(709,709);
  frameRate(60);
  rectMode(CENTER);
  imageMode(CENTER);
  vog1=loadImage("vog1.png");
  vog2=loadImage("vog2.png");
  vog3=loadImage("vog3.png");
  vog4=loadImage("vog4.png");
  back=loadImage("allebalken.jpg");//background
  rosa=loadImage("rosa.png");//coloring the plant, when bird passes by
  p=new PVector(200,150,0);//birds position
  s=new PVector(1,0,0);//birds speed
  bird=new Bird(vog1,vog2,vog3,vog4,p,s);
  fill(255);
}

void draw() {

  background(255);
  image(back,1059-back_offset,354);
  if(abs(bird.position.x + back_offset - 1119)<150){//the plant is getting red
    image(rosa,1119-back_offset,171);
  }
  if(abs(bird.position.x + back_offset - 1500)<180){//the eyes follow the bird
    fill(255);
    ellipse(1550-back_offset,160,20,20);
    ellipse(1500-back_offset,160,20,20);
    fill(0);
    ellipse(1550-back_offset + (bird.position.x + back_offset - 1500)/14,155,10,10);
    ellipse(1500-back_offset + (bird.position.x + back_offset - 1500)/14,155,10,10);

  }

  bird.check_black();
  bird.check_border();
  if(back_offset>salto&&back_offset<salto+300){
    pushMatrix();
    translate(bird.position.x,bird.position.y);
    rotate((back_offset-salto)/48);
    translate(-bird.position.x,-bird.position.y);
    bird.animate();
    popMatrix();
  }
  else{
    bird.animate();
  }

  bird.check_offset();
  if (back_offset>2118){
    back_offset=-709;
  }//background starting again

}

class Bird//---------------------------------------------class Bird
{
  PImage vogel1,vogel2,vogel3,vogel4;
  PVector position,speed;
  float r=60;//distance needed for checking collision with black parts of the background
  Bird(PImage vogel1, PImage vogel2, PImage vogel3,PImage vogel4, PVector position, PVector speed){
    this.vogel1=vogel1;
    this.vogel2=vogel2;
    this.vogel3=vogel3;
    this.vogel4=vogel4;
    this.position=position;
    this.speed=speed;
  }

  void check_offset(){
    if(position.x>200){
      back_offset=back_offset+speed.x;
    }

  }
  void check_border(){
    if(position.y<30||position.y>650){
      speed.y=-speed.y;
    }

    if(position.x>600){
      position.x=position.x-1;
      back_offset=back_offset+1;
    }

  }

  void animate(){//----------------------------------Bird.animate()
    position.add(speed);
    if((millis()-time)>200){
      img_count=(img_count+1)%2;
      time=millis(); 
    }
    if(img_count==0){
      image(vogel1,position.x,position.y);
    }
    if(img_count==1){
      image(vogel2,position.x,position.y);
    }


  }

  void check_black(){//------------------------Bird.check_black
    color c= color(255,255,255);
    PVector atract=new PVector(0,0,0);
    boolean crash=false;
    for(int i=0;i<3;i++){
      c=get(int(position.x+r),int(position.y-r+i*r));
      if(c==color(0,0,0)){
        crash=true;
      }//collision detected, when one of the 4 points meets black background
    } 
    if(crash){
      position.sub(speed);
      position.sub(speed);
      speed.set(speed.x+random(-0.5,0),speed.y+random(-2,0),0);
    }
    atract.set(800-position.x,150-position.y,0);
    atract.normalize();
    atract.mult(0.01);
    speed.add(atract);//steering to (800,150)
    speed.normalize();
  }
}//-----------------------------------------end Bird

void mousePressed(){
 salto= int(back_offset);
}










