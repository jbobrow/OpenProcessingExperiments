
// Fly Me To The Moon
// programmed by FUKAYA Takashi (F/T) 2009.7.21-
// http://dokokano.com/

int mode = 0;                        // game mode
int score=0;
int fuel=0;
int count=0;

int  keyBefore;
boolean mouseBefore;

float mx = 50,my=150,mxs=0,mys=-.5 ,mspd=0,mdist=0;    // my ship
float ex=0,ey=0,es=30;          // earth (moon)
float g;
float tx,ty,txs,tys;                // target

float vx,vy,vzm=1;                    // view

String msg = "";
PFont f;



int boost_num=100;
boost[] boosts = new boost[boost_num] ;

void setup() 
{
  size(400, 400);
  noStroke();
  ellipseMode(CENTER_DIAMETER); 
  frameRate(30);
  
  f = loadFont("Univers45.vlw.gz");  
  for ( int i=0; i<boost_num; i++ ) {
    boosts[i]= new boost();
  }  
  
  resetGame();
}

void resetGame()
{
  mode=0;
  score=0;
  fuel=1000;
  g=0.05;
  
  mx = 50;my=500;mxs=0;mys=-.5; 
  ex=0;ey=0;es=35;
  
  count=0;
  createTarget();

}


void createTarget()
{
  float d;
  do {
    tx = random(300)+50;
    ty = random(300)+50;
    d = dist( tx,ty,ex,ey);
  }while( d<40 || d>150 );

}

int createBoost( float x,float y,float xs,float ys) {
    int iCreate = -1;
      for ( int i=0; i<boost_num; i++ ) {
        if ( !boosts[i].isValid() ) {
          boosts[i].create(x,y,xs,ys);
          iCreate = i;
          break;
        }
      }
      return iCreate;
}


void actionMyship()
{
  float dist = dist( mx,my,ex,ey);
  mxs += ( ex - mx )*g/(dist*dist);
  mys += ( ey - my )*g/(dist*dist);
  mx+=mxs;
  my+=mys;

  mspd = dist(0,0,mxs,mys);

   mdist = dist - es/2;

   if ( mdist<=0 ) {
    count = 0;
    if ( mspd>0.1 ) {
      // crash
      for ( int i=0; i<50; i++ ) {
        createBoost(mx,my,random(6)-3,random(6)-3);
      }
  
      mode=2;
    }else{
      // clear
      mode=3;
    }
  }
      
//  float vmouseX = ( mouseX ) - vx/ ( vzm !=0 ? vzm : 1) -200;
//  float vmouseY = ( mouseY ) - vy/ ( vzm !=0 ? vzm : 1) -200;
  float vmouseX = ( mouseX  -200 ) / ( vzm !=0 ? vzm : 1)  - vx;
  float vmouseY = ( mouseY  -200  )/ ( vzm !=0 ? vzm : 1) - vy;
  if ( mousePressed  ) {

        
    float d = dist( vmouseX,vmouseY,mx,my);
    float bxs=0,bys=0;
    bxs = (vmouseX-mx)  / d * .01;
    bys = (vmouseY-my)  / d * .01;
    if ( ( bxs!=0 || bys!=0 ) && fuel>0 ) {
      mxs+=bxs;
      mys+=bys;
      fuel--;
      createBoost(mx,my,mxs-bxs*30 + random(.2)-.1,mys-bys*30 + random(.2)-.1);
    }
  }
   
  stroke(200);
  fill(255);
  ellipse( mx,my,1,1);
  
  if ( dist>100 && (count % 60)>30) {
    stroke(255,0,0);
    noFill();
    ellipse( mx,my,20,20);
  }
  
//  fill(0,255,0);
//  ellipse( vmouseX,vmouseY,9,9);
  
  if ( fuel<=0 ) {
    mode=2;
  }
}

void actionTarget()
{    
/*  float distt = calcdist( tx,ty,ex,ey);
  txs += ( ex - tx )/(dist*dist);
  tys += ( ey - ty )/(dist*dist);
*/
  tx+=txs;  txs*=.99;
  ty+=tys;  tys*=.99;
  stroke(0,255,0);
  noFill();
  ellipse( tx,ty,5,5);
  
  if ( dist( tx,ty,mx,my) < 4 ) {
    // Get target
    score++;
    g+=0.1;  es++;
    for ( float f=0; f<PI*2; f+=PI/20 ) {
      createBoost(tx,ty,sin(f)*3,cos(f)*3);      
    }
    createTarget();

  }
}


void draw()
{
  background(0);

  boolean newMousePressed = ( mousePressed && !mouseBefore ) ;
  mouseBefore = mousePressed;




  float d = dist(ex,ey,mx,my);

  int iCreate = createBoost( random(d*3)-d*1.5,random(d*3)-d*1.5,0,0);
  if (iCreate>=0 )  boosts[iCreate].fix_ = true;

  // viewport to game
 	
  pushMatrix();
  
    float essx = ex + (mx-ex)/d*es/2;
    float essy = ey + (my-ey)/d*es/2;
  
   vzm = (300)/(dist(mx,my,essx,essy)+es/4);
   if (vzm==0 ) vzm=1;
   vx = (-mx+(mx-essx)/2);
   vy = (-my+(my-essy)/2);
   System.out.println("xv=" + str(vx) + "  vy=" + str(vy) );
//  vzm =1;
  scale(1);
  translate(200,200 ); 
  scale( vzm);
  translate(vx,vy ); 

  


  // game object
  if ( mode==1 ) {
    actionMyship();
    actionTarget();
  }

  // draw moon    
  noStroke();
  fill(255,255,100);
  ellipse( ex,ey,es,es);
  
//  fill(255,0,0);
//  ellipse( essx,essy,3,3);
//  fill(255,0,255);
//  ellipse( 0,0,3,3);

     
  // boost action
  for ( int i=0; i<boost_num; i++ ) {
    if ( boosts[i].action() ) {
      boosts[i].draw();
    }
  }


  popMatrix();

  // Score
  if ( mode>0) {
    textFont(f, 25);
    textAlign(LEFT); 
    if ( fuel>100 ) fill(255); else fill(255,0,0);
    msg= "fuel:" + str(fuel);
    text( msg , 10,25);


    fill(0,0,0,150);
    noStroke();
    rect(5,330,120,395);
  
    textFont(f, 20);
    fill(255);
    text( "dist:" + str((int)(mdist*1000)) , 10,365);
    if ( mspd>0.1) fill(255,0,0);
    text( "speed:" + str((int)(mspd*1000)) , 10,390);
  }
  
  if ( mode==0 ) {
    // title
    textFont(f, 40);
    textAlign(CENTER); 
    fill(150,150,255);
    text("Fly Me To The Moon",200,150);
    textFont(f, 16);
    text("programmed by FUKAYA Takashi (F/T) 2009.7.21-",200,250);
    textFont(f, 25);
    fill(255);
    text("click to start",200,350);
      
    createBoost( random(600)-300,random(600)-300,-4,4);
      
    if( newMousePressed  ) {
      mode=1;
      count=0;
    }
  }

  if ( mode==2 ) {
    // game over
    textFont(f, 35);
    textAlign(CENTER); 
    fill( sin((float)count/30)*120+120 );
    text("GAME OVER",200,150);
    textFont(f, 25);
    fill(255);
    text("click to title",200,350);
      
    if( newMousePressed ) {
      resetGame();
    }
  }

  if ( mode==3 ) {
    // seccess
    textFont(f, 35);
    textAlign(CENTER); 
    fill( sin((float)count/40)*120+120 );
    text("SECCESS !!",200,150);
    
    fill(255,0,0);    
    text("RANK : " + char( 65+ (int)(mspd*200)  ) ,200,200);

    
    textFont(f, 25);
    fill(255);
    text("click to title",200,350);
      
    if( newMousePressed && count>30 ) {
      resetGame();
    }
  }




  count++;
  if(keyPressed) {
    keyBefore = key;
  }else{
    keyBefore=0;
  }
}



class boost {
  float x_;
  float y_;
  float xs_;
  float ys_;
  int  life_;
  boolean fix_;
  void boost() {
    life_=0;
    fix_ = false;
  }
  boolean isValid() {
    return life_>0;
  }
  void create( float x , float y , float xs,float ys) {
    x_=x;
    y_=y;
    xs_=xs ;
    ys_=ys;
    life_=40+(int)random(30);
  }
  boolean action() {
    if ( life_==0 ) return false;
    
    if ( !fix_) {
      float dist = dist( x_,y_,ex,ey );
      xs_ += ( ex - x_ )/(dist*dist);
      ys_ += ( ey - y_ )/(dist*dist);
    }
      
    x_+=xs_;
    y_+=ys_;

    life_--;
      
/*    float distt = calcdist( x_,y_,tx,ty);
    if ( distt<4 ) {
      txs+=xs_;
      tys+=ys_;
      life_=0;      
    }
*/  
    return true;
  }
  void draw() {
    strokeWeight(1/vzm);
    stroke(255,life_*4,0);
    line( x_,y_,x_+xs_*2,y_+ys_*2);
  }
};



