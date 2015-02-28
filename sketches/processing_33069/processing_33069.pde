
int naut_speed=2;
int cat_speed=1;
int shuttle_speed=3;


PImage shuttle;
int shuttle_x =200;
int shuttle_y=400;
int shuttle_w=100;
int shuttle_h=100;

PImage naut;
int naut_x =200;
int naut_y=200;
int naut_w=100;
int naut_h=100;

PImage cat;
int cat_x =100;
int cat_y=100;
int cat_w=100;
int cat_h=100;

void setup(){
  background(#FFFFFF); 
  size (500,500); 
};

void draw(){
 background(#FFfFFF);

cat=loadImage("spacecat.jpg");
image(cat,cat_x,cat_y,cat_w,cat_h);

naut=loadImage("naut.jpg");
image(naut,naut_x,naut_y,naut_w,naut_h);

shuttle=loadImage("shuttle.gif");
image(shuttle,shuttle_x, shuttle_y,shuttle_w,shuttle_h);
//
//shuttle=loadImage("shuttle.jpg");
//image(shuttle,shuttle_x,shuttle_y,shuttle_w,shuttle_h);

cat_x=cat_x+cat_speed;

if ((cat_x>500 )||(cat_x <0 )){
     cat_speed=cat_speed*-1;
 }

naut_x=naut_x+naut_speed;

if ((naut_x >500 )||(naut_x <0 )){
     naut_speed=naut_speed*-1;
 }
 
 shuttle_y=shuttle_y+shuttle_speed;
 if ((shuttle_y >500 )||(shuttle_y <0 )){
     shuttle_speed=shuttle_speed*-1;
 }

//if ((shuttle_x+shuttle_y >500 )||(shuttle_y <0 )){
//     img_speed=img_speed*-1;
//}
  }



