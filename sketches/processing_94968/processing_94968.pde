
int heli=-400;//integer
float dir=-1;//float
float tinto=255;//tinto
void setup(){//start setup
  size(300,550);//size
  background(50);//background
  frameRate(20);//repeat rate
}//end setup
void draw(){//start draw
  background(50);//background fill
  helicopter();//call function
  ground();//call function
}//end draw
void helicopter(){//start function
  stroke(0);//black
  strokeWeight(1);//thin
  heli=heli+1;//move
  heli=min(0, heli);//stop
  fill(240);//body color
  ellipse(170,405+heli,100,50);//body
  fill(200);//blade color
  rect(105,360+heli,125,5);//top blade
  ellipse(70,400+heli,30,30);//rear blade
  fill(240);//other color
  rect(165,365+heli,10,20);//spining thing
  rect(70,400+heli,60,10);//tail
  fill(200,200,255);//window color
  triangle(194,383+heli,214,383+heli,220,403+heli);//window
  noFill();//no fill
  strokeWeight(3);//thick
  quad(140,420+heli,120,440+heli,220,440+heli,200,420+heli);//legs
  strokeWeight(1);//stroke
  fill(220);//grey
  rect(205,415+heli,20,5);//flashlight part
  tinto=tinto+dir*5;//change
  if (tinto < 180){//when dark
    dir=1;//brighter
  }//end if
  if(tinto > 255){//when bright
    dir=-1;//darker
  }//end if
  fill(tinto,tinto,50);//yellow
  triangle(225,417+heli,300,410+heli,300,424+heli);//light beam
  ellipse(170,400+heli,20,20);//flash dot
}//end function
void ground(){//ground
  fill(200);//light gray
  rect(-1,440,500,110);//floor
}//end

