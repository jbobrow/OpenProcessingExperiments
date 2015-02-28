


class Curver{
  Vec3D position;
  Vec3D prevPosition;
  Vec3D heading;
  Vec3D prevHeading;
  float step;
  float age;
  float turnPerStep;
  float newTurnPerStep;
  boolean overEdge;
  boolean shrinking;
  float ageStep;
  boolean inactive;
  boolean polarity;

  Curver(){
    position = new Vec3D(random((float)mouseX),random((float)mouseY),0f);
    prevPosition=new Vec3D(position);
    heading = new Vec3D(random(-1f,1f),random(-1f,1f),0f);
    heading.normalize();
    prevHeading = new Vec3D(heading);
    age=1.0f;
    step=1.0f;//step=1.0f;
    newTurnPerStep=turnPerStep=0.10f*(random(100f)<50f?-1f:1f);
    overEdge=false;
    ageStep=0.01f;
    inactive=false;
    shrinking=false;
    polarity=(random(100f)<50f)?true:false;
  }

  Curver(Vec3D position, Vec3D heading){
    this.position = new Vec3D(position);
    prevPosition=new Vec3D(position);
    this.heading = new Vec3D(heading);
    heading.normalize();
    prevHeading = new Vec3D(heading);
    age=1.0f;
    step=1.0f;
    //el primero de todos!
    newTurnPerStep=turnPerStep=random(0.01f,0.05f)*(random(100f)<50f?-1f:1f);
    
    overEdge=false;
    ageStep=0.01f;
    inactive=false;
    shrinking=false;
    polarity=(random(100f)<50f)?true:false;
  }

  void reset(){

    heading = new Vec3D(random(-1f,1f),random(-1f,1f),0f);
    position = new Vec3D(random(width),random(height),0f);
    heading.normalize();
    prevPosition.set(position);
    prevHeading.set(heading);
    overEdge=false;
    age=1.0f;
    step=1.0f;
    ageStep*=0.9f;
    //newTurnPerStep=turnPerStep=random(0.01f,0.05f)*(random(100f)<50f?-1f:1f);
    newTurnPerStep=turnPerStep=0.10f*(random(100f)<50f?-1f:1f);
    inactive=false;
    shrinking=false;
    polarity=(random(100f)<50f)?true:false;


  }
  void update(int[][] Grid){
    prevPosition.set(position);
    prevHeading.set(heading);
    overEdge=false;
    position.addSelf(heading.scale(step));
    if(position.x<2){ 
      position.x+=width-4;
      overEdge=true;
    }
    if(position.x>=width-2){ 
      position.x-=width-4;
      overEdge=true;
    }
    if(position.y<2){ 
      position.y+=height-4;
      overEdge=true;
    }
    if(position.y>=height-2){ 
      position.y-=height-4;
      overEdge=true;
    }

    if (shrinking){
      age-=4*ageStep;
      if (age<1.0f) inactive=true;
    }
    else{
      age+=ageStep;
    }

    Vec3D newHeading = new Vec3D(heading.x*cos(turnPerStep)-heading.y*sin(turnPerStep),heading.y*cos(turnPerStep)+heading.x*sin(turnPerStep),0f);
//       Vec3D newHeading = new Vec3D(heading.x*cos(turnPerStep)-heading.y*sin(turnPerStep),heading.y*cos(turnPerStep)+heading.x*sin(turnPerStep),0f);
    heading.set(newHeading);

    if(shrinking){
      turnPerStep=0.99f*turnPerStep+newTurnPerStep;
    }
    else{
      if(random(100f)<1f) newTurnPerStep=random(0.001f,0.005f)*(random(100f)<50f?-1f:1f);
       turnPerStep=0.99f*turnPerStep+0.01f*newTurnPerStep;
    }


    if(overEdge){

      inactive=true;
    }
    if(grid[(int)(position.x+step*heading.x)][(int)(position.y+step*heading.y)]>0){
      shrinking=true;

    }
   grid[(int)position.x][(int)position.y]++;





  }

  void drawFrill(color[][] colorGrid){
   
    if(!shrinking){
      fill(colorGrid[(int)position.x][(int)position.y]);
     noStroke();
     // noFill();
      float randomL = (polarity)?random(age*10.0f):-random(age*10.0f);
      //line(position.x,position.y,position.x+randomL*heading.y,position.y-randomL*heading.x);
      
      if(age>2.5f){
        randomL = (polarity)?random(age*3.0f-7.0f):-random(age*3.0f-7.0f);
        
        ellipse(position.x-randomL*heading.y,position.y+randomL*heading.x,0.5f*age,0.5f*age);
      }
    }
    else{
      if(age>1.5f){
        fill(random(120f,256f));

        ellipse(position.x-random(-20f,20f)*heading.y,position.y+random(-20f,20f)*heading.x,1.5f*age,1.5f*age);

      }

    }

  }

 void drawCenter(){
 
    ellipse(position.x,position.y,age,age);

  }






}

