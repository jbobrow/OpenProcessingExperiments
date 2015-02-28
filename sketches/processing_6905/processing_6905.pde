
class Tank { 
  int country,type; 
  float speed, coverage; 
  boolean controlling,showRange,radar; 
  PVector currentPos,destination,velocity,posB; 
  float angleBody, angleTower,a,b,c,angleFire, fireDirection, firingDuration,coverAngle; 
  boolean firing,moving,defensing,triggered,turning,tooClose,realDead; 
  int rotationTime,coolingDownTime,deadTime; 
  boolean survive=true; 
  color C1,C2,C3;
  
      float sweepDirection =1;
      float cc;

  Tank(float _x, float _y, float _angle, int _country, int _type) { 
    this.currentPos = new PVector(_x,_y); 
    this.destination = new PVector(_x,_y); 
    this.posB = new PVector(_x,_y); 
    this.velocity =new PVector(0,0); 
    country =_country;
     type= _type; 
    if (type==0) {
    speed = 1; 
    coverage = 200;
    coverAngle =1.2;
    } 
    if (type==1) {
    speed = 0.5; 
    coverage = 500;
    coverAngle = 0.3;
    }
    angleBody =_angle;
    C1 = color(0,255*(country+1)/5,50,200);
    C2= color(0,255*(country+1)/5,50,170);
    C3= color(0,255*(country+1)/5,50,50);
    firingDuration = coverage/10; 
  
  } 

  void Move() {
    if (survive) { 
      //delay(100); 
      //a =PVector.angleBetween(destination,currentPos); 
      a = (atan2(destination.y-currentPos.y,destination.x-currentPos.x)+TWO_PI)%TWO_PI; 
      b = (angleBody+TWO_PI)%TWO_PI; 
      if ((degrees(a)-1.5 > degrees(b) ||degrees(a)+1.5 < degrees(b))) { 
        moving =false; 
        turning=true;
        c = (a-b +TWO_PI)%TWO_PI; 
        if (c<TWO_PI-c) { 
          angleBody += 0.02;//this seems doesn't work well 
        } 
        else { 
          angleBody -= 0.02; 
        } 

        //println(degrees(a) +" "+ degrees(angleBody)); 


      } 
      else { 
        if(!moving) { 
          angleBody = a; 
          velocity.x = speed * cos(a); 
          velocity.y = speed * sin(a); 
          moving = true; 
          turning=false;
        } 
      } 

      if (moving) { 
        if (PVector.dist(currentPos,destination)>10) { 
          currentPos.add(velocity); 
        } 
        else {
          moving = false;
        }
      } 
    } 
  }
  void Fire(float _firingAngle) {
    if (survive) { 
      triggered=true; 
      fireDirection = _firingAngle; 
      //fireSound.trigger();
    } 
  }

  void Bullet() { 
    //rotate the tower 
    if (triggered) { 

       cc = (angleTower+angleBody+TWO_PI)%TWO_PI; 
      float sfb = (angleBody+coverAngle+TWO_PI)%TWO_PI;
      float bfb = (TWO_PI+angleBody-coverAngle+TWO_PI)%TWO_PI;
      if ((degrees(fireDirection)-2 > degrees(cc) ||degrees(fireDirection)+2 < degrees(cc))) { 

        //coolingDownTime=0;
       if ((fireDirection<sfb &&cc<sfb) ||(fireDirection>bfb &&cc>bfb) ) { 
        if (fireDirection>cc) { 
          angleTower +=0.03; 
        } 
        else { 
          angleTower -=0.03; 
        } 
       }
         if (fireDirection<sfb && cc>bfb){ 
      
          angleTower +=0.03; 
        } 
      if (fireDirection>bfb &&cc<sfb) {
        angleTower -=0.03;
      }
       
       
       
        //Here is some problem
        angleTower =constrain(angleTower,-coverAngle,coverAngle); 
        //if (rotationTime==1) rotation.trigger();
        rotationTime++;
      } 
      else { 
        //triger firing 


        if (coolingDownTime==1) { 
          //angleTower = (fireDirection+TWO_PI)%TWO_PI; 
          angleFire=angleBody+angleTower+random(0.1);//?????????????????????????? 
          posB.x = currentPos.x+40*cos(angleFire); 
          posB.y = currentPos.y+40*sin(angleFire); 

          //fire!!! 
          //Bullet(angleFire,posB.x,posB.y); 
          firing =true; 
          fill(255,206,0,180);
          ellipse(posB.x, posB.y, 10,10);
          rotationTime =0;
          fireSound.trigger(); 
        } 
        //if (coolingDownTime>50) coolingDownTime=0; 
        coolingDownTime++; 
      } 

 
      //Draw the bullet!
      if (firing  &&!turning) { 
        posB.x += 10*cos(angleFire); 
        posB.y += 10*sin(angleFire); 
        //println(posB.x+ " "+posB.y+ " "+cos(angleFire)); 
        fill(0); 
        ellipse(posB.x,posB.y,1.5,1.5); 
        if (coolingDownTime>firingDuration) { 
          stopFiring();

        } 
      } 
    } else if (survive&&type==1){  
      
      angleTower += sweepDirection*0.01;
      if (angleTower>coverAngle ||angleTower<-coverAngle) {
       sweepDirection *=-1;
       
      }
    } 
  } 
  void stopFiring() {
    firing = false; 
    triggered =false; 
    coolingDownTime=0;  

  }

  void DrawBody() { 
    //detect real death
    if(!survive) deadTime++;
    if(deadTime>60) realDead =true;
    
    pushMatrix(); 
    translate(currentPos.x,currentPos.y); 


    if (controlling && survive) { 
      stroke(180); 
      noFill(); 
      strokeWeight(1); 
      ellipse(0,0,75,75); 
      ellipse(destination.x-currentPos.x,destination.y-currentPos.y,5,5); 
      if (radar) {
        for (int i=myNum; i<Num&&Tanks[i]!=null; i++) {
          if (Tanks[i].survive) {
            float angleME = atan2((Tanks[i].currentPos.y-currentPos.y),(Tanks[i].currentPos.x-currentPos.x));
            float distME = dist(currentPos.x,currentPos.y,Tanks[i].currentPos.x,Tanks[i].currentPos.y);
            pushMatrix();
            rotate(angleME);
            translate(65,0);
            fill(0,0,0,70);
            textFont(font2);
            text(distME,0,0);
            popMatrix();
          }
        }
      }   
      //line(0,0,destination.x-currentPos.x,destination.y-currentPos.y); 
    } 


    /*debugging the heading 
     stroke(255,0,0);//heading 
     line(0,0,100*cos(a), 100*sin(a)); 
     
     stroke(0,255,0);//destination 
     line(0,0,100*cos(angleBody),100*sin(angleBody)); 
     */

    rotate(angleBody); 


    noStroke(); 
/*
    if (controlling&& survive) { 
      fill(140); 
    } 
    else {
      fill(160);
    }
 */   
    if (survive) { 
    fill(C1);
    }else {
    fill(C3);
    }
    rect(18,-15,-43,5); 
    rect(17,-10,-41,20); 
    rect(18,10,-43,5);
    /*
   if (survive) { 
     image(tankBody,-33,-16);
     }else{
     image(brokenTankBody,-33,-16);
     }
     */
    //?????
    if (showRange&& survive) {
      stroke(180);
      strokeWeight(1);
      noFill();
      arc(0, 0, coverage*2, coverage*2, -coverAngle, coverAngle);
      arc(0, 0, 84, 84, -coverAngle, coverAngle);
      /*
  for (int i =0; i<(coverage-45)/5; i++) {
       arc(0, 0, 95+i*10, 95+i*10, 1.15, 1.2);
       arc(0, 0, 95+i*10, 95+i*10, -1.2,-1.15);
       }*/
      line(42*cos(coverAngle),42*sin(coverAngle), coverage*cos(coverAngle),coverage*sin(coverAngle));
      line(42*cos(-coverAngle),42*sin(-coverAngle), coverage*cos(-coverAngle),coverage*sin(-coverAngle));


      noStroke();
    }

    pushMatrix(); 
    rotate(angleTower); 
    noStroke(); 

    /*
     if (survive) {
     image(tankTower,-17,-14);
     } else {
     image(brokenTankTower,-17,-14);
     }
     */
   
     if (survive) { 
    fill(C2);
    }else {
    fill(C3);
    }
   if (type==0) { 
    ellipse(0,0,20,20); 
    rect(10,-1,20,2);
   } 
   if (type==1) { 
    //rect(-10,-8,16,6); 
    //rect(0,3,6,6); 
    rect(-10,-2,35,5);
   }

    popMatrix(); 
    popMatrix(); 

  } 


} 



