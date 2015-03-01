
size(400,400);
background(0);


//a performer on stage

noStroke();//this makes the gradient clear

//first, i need to create the spotlight
for(int i = 0; i<=width; i+=1){
  
  fill(230,245,i);
  ellipse(i,i,i*1.35,i);
}

//then, i create a small stage
stroke(3);
fill(167,68,10,220);

quad(310,340,
370,340,
400,380,
280,380);

rect(280,380,10,19);
rect(390,380,9,19);



//then, i have to create the performer in the spotlight
int h = 340;
int t = 350;
stroke(3);
fill(255);
//head and neck
ellipse(h,280,30,30);
line(h,295,340,t);
//legs
line(h,t,330,370);
line(h,t,t,370);
//arms
line(h,320,360,315);
line(h,320,320,315);


//then i create the sound waves from his voice


//arc(x,y,height,width,start,stop);


  for(int a =10; a<=800; a+=30){
  
 noFill();
  
  arc(325,280,a,a,radians(120),radians(260));
  }


