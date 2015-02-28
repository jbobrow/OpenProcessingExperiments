
//background setting
size(500,500);
background(#FFEC1A);
smooth();

//assigning 
int snumber=5;
int number=25;
int space=width/number;

//1st condition (oblique)
for(int x=0;x<=width;x+=space){
  if(x%(space*snumber)==0){
    stroke(125);
    strokeWeight(3);
  }
  else{
    stroke(255);
    strokeWeight(5);
  }
  line(0,x,width,x+500);
  line(x,0,x+500,height);
}

//2nd condition (vertical ln)
for(int x=0;x<=width;x+=space){
  if(x%(space*snumber)==0){
    stroke(#000000);
    strokeWeight(2);
  }
  else if(x%40==0){
    strokeWeight(4);
  }
  else{
    strokeWeight(6);
  }
  line(x,0,x,height);
}

//3rd condition (horizontal ln)
stroke(#0F7DFF);
for(int y=0;y<=width;y+=space){
  if(y%(space*snumber)==0){
    strokeWeight(2);
  }
  else if(y%40==0){
    strokeWeight(4);
  }
line(0,y,width,y);
}

