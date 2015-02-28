


class Crystal{
  
//GLOBAL VARIABLES

//~NOTES~ A VECTOR IS JUST A POINT WHICH CONTAINS TWO THINGS - MAGNITUDE AND DIRECTIONALITY

Vec3D loc          = new Vec3D(0,0,0);

Vec3D speed      = new Vec3D(random(-2,2),random(-2,2),0);
Vec3D grav       = new Vec3D(0,-0.2,0);
Vec3D acc        = new Vec3D(0,0,0);

float h1 = 25;
float h2 = 50;
float w  = 30;


  





//CONSTRUCTOR

//~NOTES~ THIS IS WHERE YOU SPECIFIY HOW TO BUILD THE CLASS; WHERE YOU INITILISE/CALL VARIABLES. SIMILAR TO SETUP.
//UNDERSCORE IS JUSE USED FOR CONVENTION
//LOC EQUATION LINKS THE INFOMATION IN CONSTRUCTOR WITH THE INFORMATION IN DISPLAY.

 //Crystal(Vec3D _loc1, Vec3D _loc2, Vec3D _loc3, Vec3D _loc4){
 Crystal(Vec3D _loc){
  
  
  loc = _loc;
  

}

//FUNCTIONS

//~NOTES~ THIS IS WHERE THE BEHAVIOURS OF THE CLASS ARE BROKEN DOWN
//'RUN' WILL BE USED TO STORE ALL OTHER FUNCTIONS

void run(){
  
  display();
  
  move();
  
  bounce();
  
  //gravity();
  
 flock();
  
  followMouse();
  
  //grow();
  
 //newCrystal();
  
  
 
}
 



void grow(){
  

    if(mouseX < (loc.x+(w/2)) && mouseX > (loc.x-(w/2))){
     
    h1++;
    h2++;
    w++;
  
      if (mouseY < (loc.y-h1) && mouseY > (loc.y +h2)){
      
    h1++;
    h2++;
    w++;
    
      }
    } 
    
 
}  
 
    
    
 
void followMouse(){

Vec3D target = new Vec3D(mouseX,mouseY,0);

Vec3D dif = target.sub(loc);

float dis = dif.magnitude();

dif.normalize();

dif.scaleSelf(2/dis);

speed.addSelf(dif);
 
} 
void flock(){
  
  //~NOTES~ DEFINED BY THREE ELEMENTS - THEY ARE ALL BASED ON VECTOR MATH
  //HAVE TO DO WITH HOW THE CRYSTALS REACT TO EACH OTHER
  
  seperate(5);
  cohesion(0.001);
  //align(0.01);
  
}

  void align(float magnitude){
    
   Vec3D steer = new Vec3D ();
  int count = 0;
 
  for(int i = 0; i < crystalCollection.size(); i++){
    
//WE CREATE AN INSTANCE OF CLASS CRYSTAL CALLED OTHER; REPRESENTING ANY OTHER CRYSTAL
    Crystal other = (Crystal) crystalCollection.get(i);
//THE 'OTHER' INSTANCE HAS A GLOABAL VARIABLE CALLED LOC WHICH WE ACCESS BY USING '.'    
    float dis = loc.distanceTo(other.loc);
  
  if(dis>0 && dis<40){//SAYING, IF THE DISTANCE IS GREATER THAN ZERO AND LESS THAN 40 WE DO SOMETHING
  
    steer.addSelf(other.speed); // WE ARE TRYING TO MIMIC THE DIRECTIONALITY - SPEED IS DIRECTIONLAITY ON CRYSTAL AT ANY GIVEN TIME - WE WANT TO MIMIC THIS
    count++;
    
    }
  
  }
 
 if(count>0){
   
   steer.scaleSelf(1.0/count);
   
   acc.addSelf(steer);
 }
 
   steer.scaleSelf(magnitude);
   
  }

  


void cohesion(float magnitude){
  
  //~NOTES~ CRYSTALS WILL HAVE A SLIGHT ATTRACTION TOWARDS NEIGHBOURING CRYSTALS/ OPPOSITE TO SEPERATE
  
  Vec3D sum = new Vec3D ();
  int count = 0;
 
  for(int i = 0; i < crystalCollection.size(); i++){
    
//WE CREATE AN INSTANCE OF CLASS CRYSTAL CALLED OTHER; REPRESENTING ANY OTHER CRYSTAL
    Crystal other = (Crystal) crystalCollection.get(i);
//THE 'OTHER' INSTANCE HAS A GLOABAL VARIABLE CALLED LOC WHICH WE ACCESS BY USING '.'    
    float dis = loc.distanceTo(other.loc);
  
  if(dis>0 && dis<60){//SAYING, IF THE DISTANCE IS GREATER THAN ZERO AND LESS THAN 180 WE DO SOMETHING
  
  sum.addSelf(other.loc);
  count++;
  
    }
    
  }
  
if(count>0){
  
  sum.scaleSelf(1.0/count);
}

Vec3D steer = sum.sub(loc);
steer.scaleSelf(magnitude);

acc.addSelf(steer);



}








void seperate(float magnitude){
  
//~NOTES~ IF TWO CRYSTALS COME TO CLOSE THEY WILL SEPERATE 
 
  Vec3D steer = new Vec3D ();
  int count = 0;
  
//WE NEED TO CALCULATE THE DISTANCE BETWEEN THE LOCATION OF THE CRYSTAL AND THE LOCATION OF ANY OTHER CRYSTAL
  
  for(int i = 0; i < crystalCollection.size(); i++){
    
//WE CREATE AN INSTANCE OF CLASS CRYSTAL CALLED OTHER; REPRESENTING ANY OTHER CRYSTAL
    Crystal other = (Crystal) crystalCollection.get(i);
//THE 'OTHER' INSTANCE HAS A GLOABAL VARIABLE CALLED LOC WHICH WE ACCESS BY USING '.'    
    float dis = loc.distanceTo(other.loc);// WE ARE SAYING DIS = THE DISTANCE BETWEEN THE LOCATION OF OUR CRYSTAL AND THE ANOTHER CRYSTAL
    
    if(dis>0 && dis<40){
      
      Vec3D diff = loc.sub(other.loc);//THIS DIFFERENCE IS THE VECTOR BETWEEN OUR CRYSTAL AND ANOTHER CRYSTAL
      diff.normalizeTo(1.0/dis);//WE ARE GIVING THE 'DIFF' VECTOR A CERTIAN STRENGTH BY SCALING IT UP - THIS CREATES MORE OF A SMOOTH MOTION - GIVES US CONTROL OVER STRENGTH OF FORCE
      steer.addSelf(diff);//ADD TO THIS EMPTY VECTOR 'STEER' TO THE 'DIFF' VECTOR
      count++; //WE NEED COUNT TO SCALE THE VECTORS DOWN -SEE BELOW FOR MORE CLARIFICATION
      
    }
    
  }
  
     if(count>0){
       
       steer.scaleSelf(1.0/count); 
     }
    
  steer.scaleSelf(magnitude);//this allows modification
  acc.addSelf(steer);
  
}

void gravity(){

//~NOTES~ GRAVITY IS JUST A SPEED VECTOR GOING DOWN

speed.addSelf(grav);

}

void bounce(){
  
  //~NOTES~ THIS FUNCTION IS RESPONSIBLE FOR CONTAINING THE CRYSTAL IN SCREEN
  
  if(loc.x+(w/2) > width){
    speed.x *= -1;
  }
 
  if(loc.x-(w/2) < 0){
    speed.x *= -1;
  }
  
  if(loc.y+h2 > height){
    speed.y *= -1;
  }
  
  if(loc.y-h1 < 0){
    speed.y *= -1;
  }
 

}


void move(){

//~NOTES~ THIS FUNCTION IS RESPONSIBLE FOR THE MOVEMENT OF THE CRYSTAL
// THIS FUNCTION IS A SERIES OF EVENTS RAN EVERY FRAME:
//STEP ONE - STORE ACCELERATION 
//STEP TWO - PASS ACCELERATION TO SPEED
//STEP THREE - PASS SPEED TO LOCATIONS
//STEP FOUR - THEN RESET ACC TO 0

//STEP ONE

  speed.addSelf(speed);
  
//STEP TWO

  speed.limit(5);

//STEP THREE

  loc.addSelf(speed);
  

//STEP FOUR

  acc.clear();




}

void display(){
  
//~NOTES~ THIS FUNCTION IS RESPONSIBLE FOR DISPLAYING THE CRYSTAL


noStroke();
quad(loc.x, loc.y-h1,    loc.x-(w/2), loc.y,    loc.x, loc.y+h2,    loc.x+(w/2), loc.y);

    }

}

  
 

  





