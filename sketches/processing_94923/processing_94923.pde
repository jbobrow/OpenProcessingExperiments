
int i;//variable
void setup(){//start setup
  size(500,500);//seze
  background(200);//gray
  frameRate(6);//rate
  strokeWeight(1);//thick
}//end setup
void draw(){//start draw
  if (random(0,10) <= 5){//if
    stroke(0,255,0);//green
    fill(220,random(100,200),random(100,200));//random red
  } else{//if not
    stroke(222,0,0);//red
    fill(random(100,200),random(100,200),255);//random blue
  }//end if
  for(i=0; i<1; i=i+1){//loop
    arc(random(1,499),random(1,499),50,20,0,PI);//arcs
   
  }//end loop
}  //end draw

