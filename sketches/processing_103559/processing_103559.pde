
int m;
int n;
PImage img1;
PImage img2;
PImage img3;

int  mouseClick ;

void setup(){
  size(1000,694);
  img1=loadImage("img1.png");
  img2=loadImage("img2.png");
  img3=loadImage("img3.png");
  smooth();
  m=616;
  n=469;
}

void draw(){
  image(img1,0,0);
   if((mouseX<m+50)&&(mouseX>m-50)
  &&(mouseY>n-50)&&(mouseY>n-50)){
   image(img2,0,0);}
if(mouseClick==1 || mouseClick ==2){
   image(img2,0,0);
  if(mouseClick==2){
      image(img3,0,0);
      stroke(255);
      strokeWeight(1);
      for (int a=514;a<m;a++){
        float k1=(n-440)/(m-514);
        float b1=(a-514)*k1+440;
        line(514,440,a,b1);
      }
          for (int b=576;b<m;b++){
        float k2=(n-384)/(m-576);
        float b2=(b-576)*k2+384;
        line(576,384,b,b2);
      }
        for (int c=660;c>m;c--){
        float k3=(n-356)/(m-660);
        float b3=(c-660)*k3+356;
        line(660,356,c,b3);
      }
       for (int d=704;d>m;d--){
        float k4=(n-418)/(m-704);
        float b4=(d-418)*k4+704;
        line(418,704,d,b4);
      }
        for (int e=709;e>m;e--){
        float k5=(n-445)/(m-709);
        float b5=(e-709)*k5+445;
        line(709,445,e,b5);
      }
       for (int f=720;f>m;f--){
        float k6=(n-261)/(m-720);
        float b6=(f-720)*k6+261;
        line(720,261,f,b6);
      }
       for (int g=636;g>m;g--){
        float k7=(n-540)/(m-636);
        float b7=(g-636)*k7+540;
        line(636,540,g,b7);
      }
   }
  }
}

void mouseClicked() {
    if((mouseX<m+50)&&(mouseX>m-50)
  &&(mouseY>n-50)&&(mouseY>n-50)){
 mouseClick ++;
 if(mouseClick >2) mouseClick =0;
  }
}


