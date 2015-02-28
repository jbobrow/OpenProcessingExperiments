
class Vman {

  float x; //x value 
float y; // y value
float a; //more movement for colors
float fly;
float land;
float bounce;
float absorb;
float gaze; 
float flex;
float z; //movement between 0 and 200
float speed= 5;
float center;
float handW;
float handH;
float forearmW;
float forearmH;
float forearm;
float shoulderDiameter;
float shoulder;
float flatArmHeight;
float bicept;
float leg;
float thighHeight;
float thighW;
float thighH; 
float kneeHeight;
float kneeDiameter; //195 14 8
float calfHeight;
float calfH;
float footHeight;
float footW;
float footH;
float neckDiameter;
float neckHeight;
float peckDiameter;
float peck;
float peckHeight;
float ab;
float abW;
float abH;
float headW;
float headH;
float eye;
float eyeHeight;
float eyeSize;
float mouthHeight;
float diameter;
  
  Vman(float tempX, float tempY, float tempDiameter) {
    x = tempX; 
    y = tempY;
    diameter = tempDiameter;
    center = tempDiameter/2;
      // println(diameter); 

fly = 0;
land = 1;
bounce = 0;
absorb = .7;
gaze= 0; 
flex = 0;
z= 1; //movement between 0 and 200

//float center = diameter/2;
handW = .18*center;
handH = center/10;
forearmW = .22*center;
forearmH = .12*center;
forearm= .41*center;
 shoulderDiameter= .2*center;
 shoulder= .8 * center;
 flatArmHeight = .7*center;
 bicept= .6*center;
 leg = .9*center;
 thighHeight= 1.45*center;
 thighW = .16*center;
 thighH = .37*center; 
 kneeHeight= 1.64*center;
 kneeDiameter= .12*center; //195 14 8
 calfHeight= 1.79*center;
 calfH = .26*center;
 footHeight =  1.95*center;
 footW = .14*center;
 footH= .08*center;
 neckDiameter = center/10;
 neckHeight= .69*center;
 peckDiameter= .22*center;
 peck = .88*center;
 peckHeight= .8*center;
 ab= .92*center;
 abW= .14*center;
 abH= .07*center;
 headW = .23*center;
 headH = .27*center;
 eye = .95*center;
 eyeHeight = .49*center;
 eyeSize= .04*center;
 mouthHeight=  .57*center;
speed = 50;


  }

  void movement (){
    noFill();
    noStroke();   
    quad(x+(.085*diameter),y+(.175*diameter)+fly+land,x+(.085* diameter),y+diameter+fly+land,x+(.915*diameter),y+diameter+fly+land,x+(.915*diameter),y+(.175*diameter)+fly+land);
    //top left, bottom left, bottom right, top right
    if((mouseX>x+(.085*diameter))&&(mouseY>y+(.175*diameter)+fly+land)&&(mouseY<y+diameter+fly+land)&&(mouseX<x+(.915*diameter))        ){
      speed = 0;
    }
    a = a + speed;
    if ((a > diameter) || (a<0)){
      speed = speed * -1;
    }
  }
 
 void display (){
 
  // background(0); 
   noFill();
  //  strokeWeight(2);
  // stroke(abs(a*1.25)); 
   // ellipse(x+center,y+center+fly+land,diameter,diameter);//large outter circle
   // stroke(abs((a-200)*1.25));
   // quad(x+(.085*diameter),y+(.175*diameter)+fly+land,x+(.085* diameter),y+diameter+fly+land,x+(.915*diameter),y+diameter+fly+land,x+(.915*diameter),y+(.175*diameter)+fly+land);//large outter square
    
    if(a > 100){
      stroke(abs(a*1.25));
     // ellipse(x+center,y+center+fly+land,diameter,diameter); 
     } 
   strokeWeight(1);
   fill(255);
   stroke(255);
    ellipse(x+.26*center +(a/40),(y+(-a/6.8)+flatArmHeight)+fly+land,handW,handH); //left hand  
    ellipse(x+forearm +(a/40),y+(flatArmHeight-(a/8.8))+fly+land,forearmW,forearmH);
    ellipse(x+bicept +(a/40),y+(flatArmHeight-(a/12.8))+fly+land,forearmW,forearmH);
    ellipse(x+shoulder,y+(flatArmHeight-(a/25))+fly+land,shoulderDiameter,shoulderDiameter); 
    ellipse(x+diameter-.26*center-(a/40),y+((-a/6.8)+flatArmHeight)+fly+land,handW,handH); //right hand
    ellipse(x+diameter-forearm-(a/40),y+flatArmHeight-(a/8.8)+fly+land,forearmW,forearmH);
    ellipse (x+diameter-bicept-(a/40),y+(flatArmHeight-(a/12.8))+fly+land,forearmW,forearmH);
    ellipse(x+diameter-shoulder,y+(flatArmHeight-(a/25))+fly+land,shoulderDiameter,shoulderDiameter);

//legs
    ellipse(x+leg-(a/14.5),y+(thighHeight-(a/50))+fly+land,thighW,thighH); //inner left leg
    ellipse(x+leg-(a/8.7),y+(kneeHeight-(a/40))+fly+land, kneeDiameter,kneeDiameter);
    ellipse(x+leg-(a/6.5),y+(calfHeight-(a/25))+fly+land, kneeDiameter,calfH);
    ellipse(x+leg-(a/5.5),y+(footHeight-(a/17))+fly+land,footW,footH); 
    ellipse(x+diameter-leg +(a/14.5),y+(thighHeight-(a/50))+fly+land,thighW,thighH); //inner right leg
    ellipse(x+diameter-leg+(a/8.7),y+(kneeHeight-(a/40))+fly+land, kneeDiameter,kneeDiameter);
    ellipse(x+diameter-leg+(a/6.5),y+(calfHeight-(a/25))+fly+land, kneeDiameter,calfH);
    ellipse(x+diameter-leg+(a/5.5),y+(footHeight-(a/17))+fly+land,footW,footH);  

 //torso  
    ellipse(x+center,y+neckHeight+fly+land,neckDiameter,neckDiameter); //neck
    ellipse(x+peck,y+peckHeight+fly+land,peckDiameter,peckDiameter); //left peck
    ellipse(x+diameter-peck,y+peckHeight+fly+land,peckDiameter,peckDiameter); //right peck
    ellipse(x+ab,y+.98*center+fly+land,abW,abH);
    ellipse(x+diameter-ab,y+.98*center+fly+land,abW,abH);
    ellipse(x+ab,y+1.08*center+fly+land,abW,abH);
    ellipse(x+diameter-ab,y+1.08*center+fly+land,abW,abH);
    ellipse(x+ab,y+1.18*center+fly+land,abW,abH);
    ellipse(x+diameter-ab,y+1.18*center+fly+land,abW,abH);    
    ellipse(x+center,y+center/2+fly+land+bounce,headW,headH); //head 
  println(center); 
//face
  fill(0);
    ellipse(x+eye,y+eyeHeight+fly+land-gaze,eyeSize,eyeSize); //left eye
    ellipse(x+diameter-eye,y+eyeHeight+fly+land-gaze,eyeSize,eyeSize);//right eye
    stroke(0);  
    line(x+center -.02*center,y+mouthHeight+fly+land-gaze,x+center+.02*center,y+mouthHeight+fly+land-gaze);//mouth
   } 


 }

