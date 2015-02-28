
void setup(){
  size(600,1000);
  background(0);
  smooth();
  stroke(255);
  line(width/2,0,width/2,height);
  frameRate(6);
//////red circle
 noFill();
stroke(55,20,147,205);
 for (int i = 0; i <= 600; i+= 10) {
  ellipse(300,100,200-i,random(300));
ellipse(300,600,200-i,700-i);
 }
// noFill();
//     stroke(205);
//     for (int i = 0; i <= 550; i+= 10) {
//     ellipse(300,100,300-i,300);
//     ellipse(300,600,200-i,700-i);
//     }

//greenline/beginshape
    stroke(0,255,0,90);
    for (int i = 0; i <= 200; i+= 10) {
line(300,500,200+i,400);
   // line(300,500,200,400);
    //line(300,500,400,400);
   ellipse(200+i,400,3,3);
    //ellipse(200,400,3,3);
    //ellipse(400,400,3,3);
    }
    
//   stroke(200,0,0,75);
//   line(300,500,150,500);
//   line(300,500,450,500);
//   ellipse(150,500,3,3);
//   ellipse(450,500,3,3);
   
   for (int i = 0; i < 200; i+= 10) {

line(300,500,200+i,400);
   // line(300,500,200,400);
    //line(300,500,400,400);
   ellipse(200+i,400,3,3);
    //ellipse(200,400,3,3);
    //ellipse(400,400,3,3);
    }

//white
   stroke(255,78);
    //for (int i = 0; i <= 600; i+= 10) {
   bezier(300,100,200,100,200,300,100,300);
   bezier(300,100,400,100,400,300,500,300);
   ellipse(100,300,3,3);
   ellipse(500,300,2,2);
   //}
//    for (int i = 0; i <= 50; i+= 10) {
//    bezier(300,100,200,500-i,200,200-i,300,200-i);
//    bezier(300,100,200,500+i,200,200+i,300,200+i);
//    ellipse(300,200-i,30,30);
//    ellipse(300,200+i,20,20);
//    }
//light
   //stroke(255,75);
       //for( int x=0 ;x<100; x+=10){ 
     //line(300,800,random(200,400),random(400,1000));
//dotdot 
 for (int i = 0; i < 1000; i+= 10) {
 ellipse(random(100,500),random(200,800),1,1);     
   }}
