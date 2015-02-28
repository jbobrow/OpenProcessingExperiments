
Particle [] chain;
boolean jiggle = false;
PImage b;
PImage b_border;
int number_of_fixed_chain=12;
boolean border_array[][]=new boolean[160][120];

float STRESS=1;

void setup()
{
  size(640,480);
  smooth();
  frameRate( 30 );  
  PFont font;
  font = loadFont("ArialMT-48.vlw"); 
  textFont(font); 
///make border
  makeborder();
  b = loadImage("back.jpg");   /////////////////////for load image
///  initial state
  chain = new Particle [30];
  for (int i = 0; i < chain.length; i++) {
    chain[i] = new Particle();
  }
  ///////////固定円の場所//////円の大きさ/////toもじ/////////////
  
  chain[0].pos.x=150; chain[0].pos.y=345; chain[0].importance.x=65; chain[0].importance.y=65; chain[0].moji="Square";
  chain[1].pos.x=220; chain[1].pos.y=250; chain[1].importance.x=46; chain[1].importance.y=46; chain[1].moji="Pond";
  chain[2].pos.x=330; chain[2].pos.y=315; chain[2].importance.x=85; chain[2].importance.y=85; chain[2].moji="EntranceHall";
  chain[3].pos.x=370; chain[3].pos.y=190; chain[3].importance.x=78; chain[3].importance.y=78; chain[3].moji="SportsSpace";
  chain[4].pos.x=250; chain[4].pos.y=380; chain[4].importance.x=46; chain[4].importance.y=46; chain[4].moji="BusStop";
  chain[5].pos.x=100; chain[5].pos.y=330; chain[5].importance.x=26; chain[5].importance.y=26; chain[5].moji="Structure1";
  chain[6].pos.x=170; chain[6].pos.y=270; chain[6].importance.x=26; chain[6].importance.y=26; chain[6].moji="Structure2";
  chain[7].pos.x=250; chain[7].pos.y=320; chain[7].importance.x=26; chain[7].importance.y=26; chain[7].moji="Structure3";
  chain[8].pos.x=300; chain[8].pos.y=230; chain[8].importance.x=26; chain[8].importance.y=26; chain[8].moji="Structure4";
  chain[9].pos.x=380; chain[9].pos.y=270; chain[9].importance.x=26; chain[9].importance.y=26; chain[9].moji="Structure5";
  chain[10].pos.x=470; chain[10].pos.y=180; chain[10].importance.x=26; chain[10].importance.y=26; chain[10].moji="Structure6";
  chain[11].pos.x=510; chain[11].pos.y=210; chain[11].importance.x=26; chain[11].importance.y=26; chain[11].moji="Structure7";
  chain[12].pos.x=200; chain[12].pos.y=350; chain[12].importance.x=20; chain[12].importance.y=20; chain[12].moji="CyclePark";
  chain[13].pos.x=220; chain[13].pos.y=250; chain[13].importance.x=20; chain[13].importance.y=20; chain[13].moji="CyclePark";
  chain[14].pos.x=450; chain[14].pos.y=200; chain[14].importance.x=20; chain[14].importance.y=20; chain[14].moji="CycleParkl";
  chain[15].pos.x=450; chain[15].pos.y=190; chain[15].importance.x=20; chain[15].importance.y=20; chain[15].moji="CyclePark";
  chain[16].pos.x=250; chain[16].pos.y=380; chain[16].importance.x=39; chain[16].importance.y=39; chain[16].moji="CarPark";
  chain[17].pos.x=150; chain[17].pos.y=350; chain[17].importance.x=39; chain[17].importance.y=39; chain[17].moji="CarPark";
  chain[18].pos.x=220; chain[18].pos.y=250; chain[18].importance.x=39; chain[18].importance.y=39; chain[18].moji="CarPark";
  chain[19].pos.x=450; chain[19].pos.y=200; chain[19].importance.x=26; chain[19].importance.y=26; chain[19].moji="NoisyRestspace";
  chain[20].pos.x=450; chain[20].pos.y=190; chain[20].importance.x=26; chain[20].importance.y=26; chain[20].moji="NoisyRestspace";
  chain[21].pos.x=250; chain[21].pos.y=380; chain[21].importance.x=20; chain[21].importance.y=20; chain[21].moji="QuietRestspace";
  chain[22].pos.x=200; chain[22].pos.y=350; chain[22].importance.x=20; chain[22].importance.y=20; chain[22].moji="QuietRestspace";
  chain[23].pos.x=220; chain[23].pos.y=250; chain[23].importance.x=26; chain[23].importance.y=26; chain[23].moji="Exhibit";
  chain[24].pos.x=450; chain[24].pos.y=200; chain[24].importance.x=26; chain[24].importance.y=26; chain[24].moji="Exhibit";
  chain[25].pos.x=100; chain[25].pos.y=300; chain[25].importance.x=10; chain[25].importance.y=10; chain[25].moji="Toilet";
  chain[26].pos.x=400; chain[26].pos.y=200; chain[26].importance.x=10; chain[26].importance.y=10; chain[26].moji="Toilet";
  chain[27].pos.x=200; chain[27].pos.y=350; chain[27].importance.x=10; chain[27].importance.y=10; chain[27].moji="Toilet";
  chain[28].pos.x=370; chain[28].pos.y=190; chain[28].importance.x=20; chain[28].importance.y=20; chain[28].moji="tree";
  chain[29].pos.x=250; chain[29].pos.y=380; chain[29].importance.x=20; chain[29].importance.y=20; chain[29].moji="tree";
  
 
 
 
 
 
  //chain[1].react(chain);
 // chain[2].react(chain);
 // chain[3].react(chain);
 // chain[4].react(chain);
  //chain[5].react(chain);
  
}
 
 
 
void draw()
{
  //background(255);
  image(b,0,0,640,480);// load image
  ////////////////////////////grid
  line(0,100,width,100);
   line(0,200,width,200);
     line(0,300,width,300);
       line(0,400,width,400);
   line(100,0,100,height);
    line(200,0,200,height);
     line(300,0,300,height);
       line(400,0,400,height);
        line(500,0,500,height);
         line(600,0,600,height);
  /////////////////////////////////
  stroke(200); 
  fill(255);
 
  // for correct physics, react then move
  
///so that keep initial state, the "for" should start from "number _of_fixed_chain" to "chain.length" 
  for (int i = number_of_fixed_chain; i < chain.length; i++) {
    chain[i].react( chain );
  }
  for (int i = number_of_fixed_chain; i < chain.length; i++) {
    chain[i].move();
  }
  // draw springs
  for (int i = 0; i < chain.length; i++) {
    // starting at i+1 only draws springs once
    for (int j = i + 1; j < chain.length; j++) {
      if(!(chain[i].doa[j])){                                                  //lineが切れるかつながるかのスイッチ
        line(chain[i].pos.x, chain[i].pos.y, chain[j].pos.x, chain[j].pos.y);
      }
    }
  }
  // draw particles
  for (int i = 0; i < chain.length; i++) {
    chain[i].draw();
  }
  // respond to a request to jiggle the springs
  if (jiggle) {
    jiggle = false;
    for (int i = 0; i < chain.length; i++) {
      chain[i].jiggle();
    }
  }
}

/////////////////////////////////////////////////////////
void  makeborder(){
  b_border = loadImage("back_copy.jpg");
  for(int yy=0;yy<b_border.height;yy++){
    for(int xx=0;xx<b_border.width;xx++){
      if(b_border.get(xx,yy)==-1){
        border_array[xx][yy]=false;
      } else {
        border_array[xx][yy]=true;
      }
    }
  }
  b_border = null;
}


//////////////////////////////////////////////
void mousePressed() {
  jiggle = true;
}

//////////////////////////////////////////////
class Particle {
  PVector pos;
  PVector vel;
  PVector importance;
  boolean[] doa;
  String moji;
  
  Particle() {
    boolean sw=true;
    while(sw){
      pos = new PVector( random(0,width), random(0,height) );
      if (border_array[(int)(pos.x/4)][(int)(pos.y/4)]){
          sw=false;
      }
    }
    vel = new PVector( random(-1,1), random(-1,1) );
    importance = new PVector(  random(10,50), random(10,50) );
    doa= new boolean[chain.length];
    moji="ji";
  }
  void react(Particle [] chain) {
    for (int i = 0; i < chain.length; i++) {
      if (chain[i] != this) {
        if(!(doa[i])){
          float d = PVector.dist( pos, chain[i].pos ); //d= distance between 2 points
          // force on a spring F = kx is proportional to its displacement from equilibrium
          // our spring has an equilibrium position of 100 units length

          
          float x = d - 100.0-chain[i].importance.x; //weight
                    
          if(abs(x) > STRESS){   //abs = 絶対値
            print("s ");
            doa[i]=true;
          }
          //float x = d - 3*chain[i].importance.x;
          PVector dir = PVector.sub( chain[i].pos, pos );
          dir.normalize();
          // next step in symbols:
          // F = ma -> ma = kx -> dv/dt = kx/m -> dv = kx/m dt
          // i.e., in a short space of time, there's a small change in velocity
          // due to the spring's displacement from equilibrium, x.
          // Much more simply:
          dir.mult( x / 1000.0 );
           //
          vel.add(dir);
        }
      }else{
        doa[i]=true;
      }
    }
    //
    bounce();
    // friction: slow to equilibrium
    vel.mult(0.98);
  }
  void move() {
    pos.add(vel);
    if (!(border_array[(int)(pos.x/4)][(int)(pos.y/4)])){
      vel.x=-vel.x;
      vel.y=-vel.y;
    }
  }
  
  
  
 /////////////////////////////////////////////////////////////////////// 
  void draw() {
     stroke(100); 
    fill(255,255,255,100);
    ellipse( pos.x, pos.y, importance.x, importance.y );
    fill(0);
    textSize(10);
    text(moji,pos.x, pos.y);
    fill(255);
  }
  void bounce() {
    if ((pos.x < 10 && vel.x < 0) || (pos.x > width - 10 && vel.x > 0)) {
      vel.x = -vel.x * 0.95; // non-elastic bounces: some energy lost to the wall
    }
    if ((pos.y < 10 && vel.y < 0) || (pos.y > height - 10 && vel.y > 0)) {
      vel.y = -vel.y * 0.95; // non-elastic bounces: some energy lost to the wall
    }
  }
  void jiggle() {
    vel = new PVector( random(-10,10), random(-10,10) );   
  }
}

