
PImage bg;
PImage btn1;
PImage btn1_hover;
PImage btn2;
PImage btn2_hover;
PImage slogan;
PImage topbar;
PImage logo;
PImage signup;
int btnX;
int btnY;
float speed=0;
int value = 0;

void mouseClicked(){
  if(value == 0){
  value= image(btn2,155,680);
  }
  else{value = image(signup,0,0);
}
}

void setup(){
  size(540,960);
  bg = loadImage("bg.png");
  btn1 = loadImage("btn1.png");
  btn1_hover = loadImage("btn1_hover.png");
  btn2 = loadImage("btn2.png");
  btn2_hover = loadImage("btn2_hover.png");
  slogan = loadImage("slogan.png");
  topbar = loadImage("topbar.png");
  logo = loadImage("logo.png");
  signup = loadImage("signup.png");
}



void draw(){
  

    
//    image(bg,0,0);
  
   if(mouseX<=width/2&&speed<=0){
    speed++;
    image(bg,speed,0);
   } 
   else if(speed>=-40){
    speed--;
    image(bg,speed,0);
   }
   

   image(slogan, 143,780);
   image(logo, 135,380);   
   image(topbar,0,0);
   image(btn1, 155,600);
   image(btn2, 155,680);
   
   if(mouseX>155&&mouseX<(width-155)){
     if(mouseY>600&&mouseY<680){
     image(btn1_hover,155,600);}   
   else if(mouseY>680&&mouseY<750){
     image(btn2_hover,155,680);
     mouseClick;}

     
     }
   }








