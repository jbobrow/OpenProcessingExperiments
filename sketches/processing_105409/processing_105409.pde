
float posX;
float posY;

float ballattop;
float ballatbottom;
float ballatleft;
float ballatright;

float targetposX;
float targetposY;

color red = color(255,0,0);
color blue = color (0,0,255);
color green = color (0,255,0);
color white = color (255);
color ballColor=(255);

void setup(){
size(500,500);
posX= width/2;
posY=height/2;
targetposX=width/2;
targetposY=500;
}

void draw (){
  background (0);
  
  fill(ballColor);
  noStroke();
  ellipse(posX, posY, 20, 20);
  posX= posX - (posX-targetposX)/8;
  posY= posY - (posY-targetposY)/8;
 
  
  //bottom side
   if ((posX>0) && (posX<500) && (posY>490)){
   ballattop=0;
   ballatleft=0;
   ballatright=0;
   ballatbottom=random(0,3);
   
   ballColor=blue;}
   
   if ((ballatbottom>0)&&(ballatbottom<1.1)){  //ball goes up
     ballatbottom=0;
     targetposX= random(100,400);
     targetposY=0;
    
   }
   
   if ((ballatbottom>1)&&(ballatbottom<2.1)){  //ball goes right
     ballatbottom=0;
     targetposX=500;
     targetposY=random(100,400);
   }
   
   if ((ballatbottom>2)&(ballatbottom<3.1)){  //ball goes left
     ballatbottom=0;
     targetposX=0;
     targetposY=random(100,400);
   }
   
   //right side
   if ((posX>480) && (posY>0) && (posY<500)){
   
   ballattop=0;
   ballatleft=0;
   ballatbottom=0;
   ballatright=random(0,3);
   ballColor=green;}
   
   if ((ballatright>0)&&(ballatright<1.1)){  //ball goes up
     ballatright=0;
     targetposX= random(100,400);
     targetposY=0;
   }
   
   if ((ballatright>1)&&(ballatright<2.1)){  //ball goes down
     ballatright=0;
     targetposX=random(100,400);
     targetposY=500;
   }
   
   if ((ballatright>2)&&(ballatright<3.1)){  //ball goes left
     ballatright=0;
     targetposX=0;
     targetposY=random(100,400);
   }
   
   //top side
   if ((posX>0) && (posX<495) && (posY<5)){
   ballatbottom=0;
   ballatleft=0;
   ballatright=0;
   ballattop=random(0,3);
   ballColor= white;}
   
   if ((ballattop>0)&&(ballattop<1.1)){  //ball goes right
     ballattop=0;
     targetposX= 500;
     targetposY= random(100,400);
   }
   
   if ((ballattop>1)&&(ballattop<2.1)){  //ball goes down
     ballattop=0;
     targetposX=random(100,400);
     targetposY=500;
   }
   
   if ((ballattop>2)&&(ballattop<3.1)){  //ball goes left
     ballattop=0;
     targetposX=0;
     targetposY=random(100,400);
   }
   
   //left side
   if ((posX<5) && (posY>0) && (posY<495)){
   ballatbottom=0;
   ballatright=0;
   ballattop=0;
   ballatleft=random(0,3);
   ballColor=red;}
   
   if ((ballatleft>0)&&(ballatleft<1.1)){  //ball goes up
     ballatleft=0;
     targetposX= random(100,400);
     targetposY=0;
   }
   
   if ((ballatleft>1)&&(ballatleft<2.1)){  //ball goes down
     ballatleft=0;
     targetposX=random(100,400);
     targetposY=500;
   }
   
   if ((ballatleft>2)&&(ballatleft<3.1)){  //ball goes right
     ballatleft=0;
     targetposX=500;
     targetposY=random(100,400);
   }

}


