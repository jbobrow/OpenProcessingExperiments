
float easing = 0.005;
float foot_y = 0;
float foot_easing = .005;
float arm_y=0;
boolean right_step = true;
boolean right_arm=true;
float x=100;
float color_1;
float color_2;
float color_3;
float clover_count;
float omar_scale;
float new_x;
float omar_x;
float arm_x;
float eye_x;
float back_y;

PShape back;
PShape body;
PShape chin;
PShape hair;
PShape larm;
PShape rarm;
PShape leye;
PShape reye;
PShape lbrow;
PShape rbrow;
PShape lfoot;
PShape rfoot;
PShape lpupil;
PShape rpupil;
PShape mouth;
PShape lglove;
PShape rglove;
PShape clover;
PShape magnet;

void setup(){
  size(480, 320);
  smooth();

  back=loadShape("back.svg");
  body=loadShape("body.svg");
  chin=loadShape("chin.svg");
  hair=loadShape("hair.svg");
  larm=loadShape("larm.svg");
  rarm=loadShape("rarm.svg");
  leye=loadShape("leye.svg");
  reye=loadShape("reye.svg");
  lbrow=loadShape("leyebrow.svg");
  rbrow=loadShape("reyebrow.svg");
  lfoot=loadShape("lfoot.svg");
  rfoot=loadShape("rfoot.svg");
  lpupil=loadShape("lpupil.svg");
  rpupil=loadShape("rpupil.svg");
  mouth=loadShape("mouth.svg");
  lglove=loadShape("lglove.svg");
  rglove=loadShape("rglove.svg");
  clover=loadShape("clover.svg");
  magnet=loadShape("magnet.svg");
}

void draw(){



  if(mouseX < 100)
  {
    x = x + (100-x)*easing;
  }
  else if(mouseX > 380)
  {
    x = x + (380-x)*easing;
  }
  else{
    x = x + (mouseX-x)*easing;
  }

  //////////FootSteps/////////
  if(right_step)
  {
    if(foot_y > 2)
    {
      right_step = false;
    }
    else{

      foot_y = foot_y + (abs(mouseX-x))*foot_easing;
    }
  }
  else{
    if(foot_y < -2)
    {
      right_step = true;
    }
    else{
      foot_y = foot_y - (abs(mouseX-x))*foot_easing;
    }
  }

  ///////arms//////
  if(mouseY<200){
    arm_x=map(mouseY,0,320,10,0);

    if(right_arm)
    {
      if(arm_y > 10)
      {
        right_arm = false;
      }
      else{

        arm_y = arm_y+1;
      }
    }
    else{
      if(arm_y < -10)
      {
        right_arm = true;
      }
      else{
        arm_y = arm_y-1;
      }
    }
  }

  back_y=map(mouseY,0,320,55,0);
  shape(back,-60,-10+back_y);
  shape(magnet,257,107+back_y);

  pushMatrix();
  omar_scale = map(mouseY,0,320,.25,1);
  translate((3*x/4+75)*(1-omar_scale),0);
  scale(omar_scale);
  omarBody();
  popMatrix();





}

void omarBody(){
  omar_x = map(mouseY,0,320,1000,0);
  new_x = x;
  color_1 = map(mouseY,0,320,232,155);
  color_2 = map(mouseY,0,320,12,79);
  color_3 = map(mouseY,0,320,102,159);
  larm.disableStyle();
  fill(color_1,color_2,color_3);
  shape(larm,new_x-100,-20-arm_y);
  rarm.disableStyle();
  fill(color_1,color_2,color_3);
  shape(rarm,new_x-100,-20+arm_y);
  shape(lglove,new_x-100,-20-arm_y);
  shape(rglove,new_x-100,-20+arm_y);
  shape(lfoot,new_x-100,-20+foot_y);
  shape(rfoot,new_x-100,-20-foot_y);
  body.disableStyle();
  fill(color_1,color_2,color_3);
  shape(body,new_x-100,-20);
  shape(hair,new_x-100,-17);
  shape(leye,new_x-100,-30);
  shape(reye,new_x-100,-30);
  shape(lbrow,new_x-97,-25);
  shape(rbrow,new_x-97,-25);
  eye_x=map(mouseX,0,480,-6,6);
  shape(lpupil,new_x-100+eye_x,-30);
  shape(rpupil,new_x-100+eye_x,-30);
  draw_clover();

  shape(mouth,new_x-100,-23);
  shape(chin,new_x-100,-23);
}

void draw_clover(){
  clover_count = map(mouseX,0,420,0,55);
  if(clover_count > 1) clover(new_x-10,110);
  if(clover_count > 2) clover(new_x+60,240);
  if(clover_count > 3) clover(new_x+10,220);
  if(clover_count > 4) clover(new_x+45,180);
  if(clover_count > 5) clover(new_x-45,200);
  if(clover_count > 6) clover(new_x-5,140);
  if(clover_count > 7) clover(new_x-20,250);
  if(clover_count > 8) clover(new_x+45,130);
  if(clover_count > 9) clover(new_x+35,170);
  if(clover_count > 10) clover(new_x+10,190);
  if(clover_count > 11) clover(new_x-50,170);
  if(clover_count > 12) clover(new_x+30,235);
  if(clover_count > 13) clover(new_x+20,130);
  if(clover_count > 14) clover(new_x-35,150);
  if(clover_count > 15) clover(new_x-20,220);
  if(clover_count > 16) clover(new_x,205);
  if(clover_count > 17) clover(new_x-20,250);
  if(clover_count > 18) clover(new_x+45,130);
  if(clover_count > 19) clover(new_x+35,170);
  if(clover_count > 20) clover(new_x-5,183);
  if(clover_count > 21) clover(new_x+50,220);
  if(clover_count > 22) clover(new_x-25,200);
  if(clover_count > 23) clover(new_x+28,110);
  if(clover_count > 24) clover(new_x+40,210);
  if(clover_count > 25) clover(new_x+53,150);
  if(clover_count > 26) clover(new_x+13,232);
  if(clover_count > 27) clover(new_x-1,255);
  if(clover_count > 28) clover(new_x+45,130);
  if(clover_count > 29) clover(new_x+74,207);
  if(clover_count > 30) clover(new_x+61,202);
  if(clover_count > 31) clover(new_x-17,179);
  if(clover_count > 32) clover(new_x-20,139);
  if(clover_count > 33) clover(new_x+28,110);
  if(clover_count > 34) clover(new_x+34,198);
  if(clover_count > 35) clover(new_x-40,227);
  if(clover_count > 36) clover(new_x-24,170);
  if(clover_count > 37) clover(new_x-11,227);
  if(clover_count > 38) clover(new_x,123);
  if(clover_count > 39) clover(new_x+27,224); 
  if(clover_count > 40) clover(new_x+24,194);
  if(clover_count > 41) clover(new_x-42,183);
  if(clover_count > 42) clover(new_x-21,124);
  if(clover_count > 43) clover(new_x+19,247);
  if(clover_count > 44) clover(new_x+52,192);
  if(clover_count > 45) clover(new_x+34,151);
  if(clover_count > 46) clover(new_x+46,104);
  if(clover_count > 47) clover(new_x-9,197);
  if(clover_count > 48) clover(new_x+59,174);
  if(clover_count > 49) clover(new_x-27,241); 
  if(clover_count > 50) clover(new_x-36,209);
  if(clover_count > 51) clover(new_x+40,233);
  if(clover_count > 52) clover(new_x+31,246);
  if(clover_count > 53) clover(new_x+45,249);
  if(clover_count > 54) clover(new_x,244);
  if(clover_count > 55) clover(new_x+17,110);/*
  */
}

void clover(float clover_x,float clover_y){
  shape(clover,clover_x,clover_y);
}















