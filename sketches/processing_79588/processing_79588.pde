
import ddf.minim.*;
//Tree tree = new Tree();





Minim minim;
AudioSample player;
AudioSample player2;


Stage stage;

EnemyR enemyr;
EnemyL enemyl;
Self self;
Back back;


int x =700;

//つまみの値
float volume;

float rxwin = 300;
float rxlose = 110;
float lxwin = -200;
float lxlose = -60;
float dx = 2;

float dd = 1.2;
int count = 0;

void setup() {
  
   
  //random star locations - global
  s1x = round(random(0,800)); 
  s1y = round(random(0,500));
  s1s = round(random(3,8));
  s2x = round(random(0,800));
  s2y = round(random(0,500));
  s2s = round(random(3,8));
  s3x = round(random(0,800));
  s3y = round(random(0,500));
  s3s = round(random(3,8)); 
  s4x = round(random(0,800));
  s4y = round(random(0,500));
  s4s = round(random(3,8));
  s5x = round(random(0,800));
  s5y = round(random(0,500));
  s5s = round(random(3,8));
  s6x = round(random(0,800));
  s6y = round(random(0,500));
  s6s = round(random(3,8));   
  s7x = round(random(0,800));
  s7y = round(random(0,500));
  s7s = round(random(3,8));
  s8x = round(random(0,800));
  s8y = round(random(0,500));
  s8s = round(random(3,8));
  s9x = round(random(0,800));
  s9y = round(random(0,500));
  s9s = round(random(3,8)); 
  s10x = round(random(0,800));
  s10y = round(random(0,500));
  s10s = round(random(3,8));
  s11x = round(random(0,800));
  s11y = round(random(0,500));
  s11s = round(random(3,8));
  s12x = round(random(0,800));
  s12y = round(random(0,500));
  s12s = round(random(3,8)); 
   background(192);
  size(800, 550);
  smooth();
  
  minim = new Minim(this);  
  player = minim.loadSample("dog01.wav", 2048);
    player2 = minim.loadSample("tsuzumi.wav", 2048);
  
  stage = new Stage();
   back = new Back();
   back.x = -100;
stage.add(back);
  
  enemyr = new EnemyR();
  enemyr.x = 600;
  stage.add(enemyr);
  
  enemyl= new EnemyL();
  enemyl.x = -400;
  stage.add(enemyl);
  
  self = new Self();
  self.x = 100;
  stage.add(self);
  


  
}


void reset() {
  enemyr.x = 900;
  enemyr.speed = -1;
  enemyl.x = -600;
  enemyl.speed = 1;
  self.alive = true;
  x =700;
  }

void draw() {
  noStroke();
  sunY=x; //declare sunY
  if(count>9){
  x = 500;
}
if(count>19){
  x = 400;
}
if(count>29){
  x = 300;
}
if(count>39){
  x = 200;
}
if(count>49){
  x = 100;
}
if(count>59){
  x = 10;
}
if(count>69){
  x = 0;
}


  if(count>129){
  x = 500;
}
if(count>119){
  x = 400;
}
if(count>109){
  x = 300;
}
if(count>99){
  x = 200;
}
if(count>89){
  x = 100;
}
if(count>79){
  x = 10;
}

   

  background(map(sunY,0,600,255,0),map(sunY,0,600,255,30),70);  //sunset bg
 
   //draw stars
  fill(255,255,255,round(map(sunY,0,600,0,255)));
  ellipse(s1x, s1y, s1s, s1s);
  ellipse(s2x, s2y, s2s, s2s);
  ellipse(s3x, s3y, s3s, s3s);
  ellipse(s4x, s4y, s4s, s4s);
  ellipse(s5x, s5y, s5s, s5s);
  ellipse(s6x, s6y, s6s, s6s);
  ellipse(s7x, s7y, s7s, s7s);
  ellipse(s8x, s8y, s8s, s8s);
  ellipse(s9x, s9y, s9s, s9s);
  ellipse(s10x, s10y, s10s, s10s);
  ellipse(s11x, s11y, s11s, s11s);
  ellipse(s12x, s12y, s12s, s12s);
   
  fill(255,150,0);
  ellipseMode(CORNER);
  ellipse(300+sunY/3,sunY-150,150,150); //draw and move sun
   
   
  fill(0,map(sunY,0,600,70,0),20); // change mountain colors
   
 
  triangle(200,600,350,350,500,600);
  triangle(400,600,500,250,700,600);
  quad(0,400,100,200,300,600,0,600);
  triangle(600,600,800,100,800,600); //foreground elements

  
  


    
   //volume = volumePin.value;
  
  //マウス座標から擬似的につまみの値を生成
  //最終的にはfunnelライブラリのコードに置き換える
  volume = map(mouseX, 0, width, 0, 1.0);
  
 //background(255);
    fill(255);
  text(""+nf(count,4),20,20); //counter
  fill(255);
  textSize(18);


  
  //自分キャラ
  // volume(0〜1.0)を２コマに割り振る
  if (self.alive) {
    self.num = int(map(volume, 0, 1, 0, 7.9));
  }
  
  
  //敵キャラ
  enemyr.x += enemyr.speed;
  
  if (enemyr.speed<0) {
    if (enemyr.x<=rxwin) {
      if (self.num>=5) {
       
        println("win r");
        enemyr.speed = -enemyr.speed;
        player.trigger();
        count = count + 1;
         

        dx = dd*dx;
        
      } else {
        if (enemyr.x<=rxlose) {
          if (self.num<5) {
            println("lose r");//I will lose
            self.alive = false;
            enemyr.speed = 0;
            player2.trigger(); //about lose when I lose
           //text("GAME OVER", 55, 200);
          // fill(75,1,37); 
           count = 0;
           
            reset();
          }
        }
      }
    }
  } else {
    if (enemyr.x>400) //if enemy returns out of window, enemy appears again
    {
      enemyr.speed = -random(1,10);//enemy return 
    }
  }
  
  
  enemyl.x += enemyl.speed;
  
  if (enemyl.speed>0) {
    if (enemyl.x>=lxwin) {
      if (self.num<=3) {
        println("win l");
        enemyl.speed = -enemyl.speed;

        player.trigger();
        count = count + 1;
        dx = dd*dx;
      } else {
        if (enemyl.x>=lxlose) {
          if (self.num>3) {
            println("lose l");//I will lose
            self.alive = false;
            enemyl.speed = 0;
            player2.trigger(); //about lose when I lose
            //text("GAME OVER", 55, 200); 
             //fill(75,1,37);
            count = 0;
           
            reset();
          }
        }
      }
    }
  } else {
    if (enemyl.x<-400) //if enemy returns out of window, enemy appears again
    {
      if(count>0){
      enemyl.speed = random(1,10);
      }
      else if(count>9){
      enemyl.speed = random(10,20);
      }
      else if(count>19){enemyl.speed = random(20,30);
        
      }else if(count>29){enemyl.speed = random(30,40);
    }else if(count>39){enemyl.speed = random(40,50);
    
  }
     //enemy return 
    }


  }

  
  //ここからゲームの判定処理
  
  stage.update();
}

class Back extends Layer {
  
  PShape back;

 
//    Back(){
//      back = loadShape("back.svg");
//  }
    void draw() {
//        if(count>5){
//      tree = new Tree(mouseX, height, height-mouseY, 5);
//  tree.render(); 
  }
    
    //shape(back, 0, 16);
  }
  
    
  //}
class EnemyR extends Layer {
  
  PShape enemy;
  float speed = -3;
  
  //new EnemyR();の時に実行される
  EnemyR() {
    enemy = loadShape("enemyR.svg");
    
  }
  
  void draw() {
    
    shape(enemy, 100, 16);
  }
  
}

class EnemyL extends Layer {
  
  PShape enemy;
  float speed = 3;
  
  //new EnemyR();の時に実行される
  EnemyL() {
    enemy = loadShape("enemyL.svg");
  }
  
  void draw() {
    shape(enemy, 0, 16);
  }
  
}

class Self extends Layer {
  
  PShape[] self;
  int num=0;
  
  boolean alive = true;
  
  //new Self();の時に実行される
  Self() {
    self = new PShape[8];
    self[0] = loadShape("0001.svg");
    self[1] = loadShape("0002.svg");
        self[2] = loadShape("0003.svg");
            self[3] = loadShape("0004.svg");
                self[4] = loadShape("0005.svg");
                    self[5] = loadShape("0006.svg");
                        self[6] = loadShape("0007.svg");
                            self[7] = loadShape("0008.svg");
                               
  }
  
  void draw() {
    shape(self[num], 100, 0);
  }
}

class Stage extends ArrayList {
  
  void add(Layer s) {
    super.add(s);
  }
  
  void remove(Layer s) {
    for (int i=0; i<this.size(); i++) {
      if (s == (Layer) this.get(i)) {
        super.remove(i);
      }
    }
  }
  
  void update() {
    for (int i=0; i<this.size(); i++) {
      Layer s = (Layer) this.get(i);
      s.update();
    }
  }
  
  Layer get(int i) {
    return (Layer) super.get(i);
  }
  
}

class Layer {
  
  float x = 0.0;
  float y = 0.0;  
  float scaleX = 1.0;
  float scaleY = 1.0;
  float rotation = 0;
  
  Layer() {
  }
  
  void update() {
    pushMatrix();
    pushStyle();
    translate(x, y);
    rotate(radians(rotation));
    scale(scaleX, scaleY);
    draw();
    popStyle();
    popMatrix();
  }
  
  void draw() {
  }
  
}



//EJ Posselius - Processing.0 - 11.10.05

int sunY;
int  s1x, s1y, s1s, s2x, s2y, s2s, s3x, s3y, s3s;
int  s4x, s4y, s4s, s5x, s5y, s5s, s6x, s6y, s6s;
int  s7x, s7y, s7s, s8x, s8y, s8s, s9x, s9y, s9s;
int  s10x, s10y, s10s, s11x, s11y, s11s, s12x, s12y, s12s;
 




