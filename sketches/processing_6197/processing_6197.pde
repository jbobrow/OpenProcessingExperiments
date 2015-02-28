
Omar  om1, om2;
Heart h1, h2, h3, h4, h5, h6, h7, h8;
//Baby b1,b2;
Baby [] b;  /// declare array


float foot_easing = .005;
float color_1;
float color_2;
float color_3;
float new_x;
float omar_x;
float arm_y=0;
float foot_y = 0;
float eye_x;
boolean right_step = true;

PShape back;
PShape lprint;
PShape heart;
int kiss_count=0;
float heartY = 0;
float r;
boolean k;



void setup(){
  size(480, 320);
  smooth();

  back=loadShape("back.svg");
  lprint=loadShape("print.svg");
  heart=loadShape("heart.svg");


  om2 = new Omar(0,-25, .005,-15, false);
  om1 = new Omar(200,-25,.05,175, true);

  h1 = new Heart(om1.x,10,100,-2,.5,175,.05);
  h2 = new Heart(om1.x,0,70,-1.75,1,175,.05);
  h3 = new Heart(om1.x,20,90,-3,.75,175,.05);
  h4 = new Heart(om1.x,30,80,-1.5,.6,175,.05);

  h5 = new Heart(om1.x,-190,100,-2,.5,175,.05);
  h6 = new Heart(om1.x,-200,70,-1.75,1,175,.05);
  h7 = new Heart(om1.x,-180,90,-3,.75,175,.05);
  h8 = new Heart(om1.x,-170,80,-1.5,.6,175,.05);

  b = new Baby[20]; ///// construct





  for( int i=0; i< 20; i++){
    float r = random(0,1.0);
    boolean k = false;
    if(r > .5){
      k = true;
    }
    b[i] = new Baby(random(-550,-130),random(60,80), k);
  }


}




void draw(){


  shape(back,-60,-10);



  //b1.display();
  //b2.display();




  pushMatrix();


  om1.easing();
  om1.display();
  om2.easing();
  om2.display();

  popMatrix();
  heart_timer();
  kiss();


}



void flee(){
  if (dist(om1.x,-25,om2.x, -25)<(om1.diameter/6 + om2.diameter/6)){
    om2.easing = -5;
    kiss_count = kiss_count +1;
  }
}

void kiss(){
  if (dist(om1.x,-25,om2.x, -25)<(om1.diameter/5 + om2.diameter/5)){
    shape(lprint,new_x+50,200);
    flee();
  }
}

void heart_timer(){
  if(kiss_count >=2){
    stroke(0);
    om1.in_love = 2;
    om2.in_love = 2;
    om2.x = om1.x -200;
    h5.display();
    h6.display();
    h7.display();
    h8.display();
    h5.easing();
    h6.easing();
    h7.easing();
    h8.easing();
    for( int i=0; i< 20; i++){
      b[i].display();
    }

  }
  if(kiss_count >= 1){
    h1.display();
    h2.display();
    h3.display();
    h4.display();
    h1.easing();
    h2.easing();
    h3.easing();
    h4.easing();
  }


}




