
float x = 0.0;
float y = 0.0;
float beginnspeed = 0.00001; //handle with care
float endspeed = 0.0001;
float storeX;
float storeY;
float distX;
float distY;
float dx;
float dy;
int dxi;
int dyi;
boolean dance = false;
float i = 0.0;
float turbo = 5.6;
float speed = 1.0;


void setup(){
  size(340,340);
  smooth();
}


void draw(){
  
   background(40);

   dx = storeX - x;
   dxi = int(constrain(distX,-1,+1));   
   dy = storeY - y;
   dyi = int(constrain(distY,-1,+1));
   
   if (abs(dx) > 1.0){
     x += dx*300*speed*(map(abs(dx),abs(distX),1,beginnspeed,endspeed));
   }
   if (abs(dy) > 1.0){
     y += dy*300*speed*(map(abs(dy),abs(distY),1,beginnspeed,endspeed));
   }
   
pushMatrix();
//nimmt sich den winkel zwischen position des männchen
//und gespeichertem Ziel in eine Variable (bevor der translation)
float angle = atan2(storeX-x,storeY-y);
//bewegt das männchen von 0,0 zu seinen ausgerechneten koordinaten
translate(x,y);
//rotiert das männchen um den berechneten winkel
rotate(HALF_PI+angle*-1);
scale(2);
if(dance == true){ //Wenn der Boolean dance wahr ist dann prüfe
  if (i <= TWO_PI*2){ //ob i kleiner als zwei PI ist (ganze drehung)
    rotate(i); //wenn das wahr ist, drehe
    i+=0.5;    //und mache i größer, damit es nicht aufhört

    //lustiger scale-effekt - basierend auf der y-position des männchens
    ///scale(map(y,0,height,1,4));
    //Der Körper mit weißer Farbe
    fill(255,255,255);
    rect(-2,-12,8,24); //hände
    rect(-8,-8,16,16); //rumpf
    rect(8,-7,14,2);
    //roter kopf
    fill(255,0,0);
    if (abs(dx) > 100.0){
      //Wenn der mann geht, bewegt sich der kopf
      rect(random(-2,2),-4,8,8);
    }else{
      //Wenn er steht dann nicht
      rect(0,-4,8,8);
    }
  }else{ //Wenn i größer als 2 PI ist, hört der Tanz auf
    i=0.0; // iwird wieder zu 0
    dance = false; //dance wird wieder false
  }
}else{ // wenn dance false sein sollte, dann bitte nochmal das männchen ohne drehung
      //lustiger scale-effekt - basierend auf der y-position des männchens
    //scale(map(y,0,height,1,4));
    //Der Körper mit weißer Farbe
    fill(255,255,255);
    rect(-2,-12,8,24); //hände
    rect(-8,-8,16,16); //rumpf
    //roter kopf
    fill(255,0,0);
    if (abs(dx) > 100.0){
      //Wenn der mann geht, bewegt sich der kopf
      rect(random(-2,2),-4,8,8);
    }else{
      //Wenn er steht dann nicht
      rect(0,-4,8,8);
    }
}
popMatrix(); 

if(dance == true){println("swosshhhhh!");}
if(dxi < 0){println("left!");}
if(dxi > 0){println("right!");}
}


void mousePressed(){
  if(mouseButton == LEFT){
    storeX = mouseX;
    storeY = mouseY;
    distX = storeX - x;
    distY = storeY - y;
  }
  //rechtsklick = tanzen
  if(mouseButton == RIGHT){
    dance = true;  
  }
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == 16){
      speed = turbo;
    }else
      speed = 1.0;
  }
}
