
float sss=100;
float fff=250;
void setup(){
  size(500,500);
}
void draw(){
 
  if(mouseY< height/2){
  background (0);
}else{
  background(0);
}
  
 sss=sss+0.1;
 fill(145,80,0);
ellipse(sss,fff,sss,sss);
fill(30,130,0);
ellipse(sss*0.1,fff*0.1,sss*0.1,sss*0.1);
fill(0,130,60);
ellipse(sss*0.3,fff*0.3,sss*0.3,sss*0.3);

fill(0,13,60);
ellipse(sss*1.001,fff*1.001,sss*0.03,sss*0.03);



}
