
size(400,400);
background(#020AC6);
translate(width/2,height/2);
rotate(PI/6);


for(int i=0;i<6;i++){ 
  stroke(255);
  strokeWeight(1);
  rect(100,10,10,10);
  
  scale(1,-1);
  
  fill(255);
  rect(100,10,10,10);
  
 ellipse(57,70,7,7);
ellipse (32,86,7,7);

strokeWeight(4);
  line(0,0,175,0);
  line(150,0,170,20);
  line(150,0,170,-20);
  line(130,0,148,20);
  line(130,0,148,-20);
  
scale(1,-1);

 rotate(PI/3);
 for(int j=0;j<100;j++){
 stroke(255,random(50,255));
 
 
 point(random (-200,200),random (-200,200));
  
}
}
