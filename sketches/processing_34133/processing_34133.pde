
float sleep=8;
float work=13;
float code=1.5;
float web=2;
float computer=4;
float classroom=7;
float go_out=7;
float party=4;
float movie=4;
int p=2;                 //coefficient
int k=6;                 // coef.
float x;                 //to make things easier  curve vertex first
float y;                 //to make things easier
float x2;                //to make things easier  curve vertex last
float y2;                //to make things easier     

float xx;               // Normal life part variables
float yy;
float xx2;
float yy2;

float homework=work-classroom;
float design=homework-code-web;
float paper=homework-computer;
float awake=24-sleep;
float fun=awake-work;

float aw=random(0,30);
float sl=random(50,150);
float wo=random(0,40);
float fu=random(30,100);

float cl=random(25);
float ho=random(25);
float co=random(15);
float pa=random(10,40);
float cod=random(15,30);
float we=random(10,30);
float des=random(5);

float par=random(60,90);
float go=random(10,30);
float mo=random(20,50);


void setup() {
  size(1400,750);
  background(255);
  smooth();
  noLoop();
}

void draw() {
 strokeWeight(3);
 stroke(0);
 line(width/2,30,width/2,60); 
 noFill();
 beginShape();
 curveVertex(width/2-181,100);
 curveVertex(width/2-181,100);
 curveVertex(width/2,60);
 curveVertex(width/2+283,90);
 curveVertex(width/2+283,90);
 endShape();
// line(width/2+283,120,width/2+283,120+50);
// line(width/2-181,170,width/2-181,170+50);
noStroke();
fill (0,0,0);
  ellipse(width/2-181,100+70.5/2*p,70.5*p,70.5*p);   //Black Bootcamp Circle
fill(255,0,0);  
  rect(100-40,height-50,30,10);
  ellipse(width/2+283,90+45/2*p,45*p,45*p);
  graph_key();
  println(randomY(0,120));
  
  
 ///////////////////...........................................................AWAKE and SLEEP
   noFill();
   stroke(0);
   x=width/2-181+xbig(awake,sleep,400) ;
   y=100+70.5*p+aw ;
   x2=width/2-181-xsmall(awake,sleep,400);
   y2=100+70.5*p+sl ;
   beginShape();                           //Draw AWAKE of Bootcamp
   curveVertex(x,y);
   curveVertex(x,y);
   curveVertex(width/2-181,100+70.5*p);
   curveVertex(x2,y2);
   curveVertex(x2,y2);
   endShape(); 
   fill(140,random(125,255),0);
   noStroke();
 //  ellipse(width/2-181+xbig(awake,sleep,400),100+70.5*p+aw+awake*k/2,awake*k,awake*k);
   ellipse(width/2-181-xsmall(awake,sleep,400),100+70.5*p+sl+sleep*k/2,sleep*k,sleep*k);
   rect(100-40+170,height-50,30,10);
   fill(random(256),random(0,255),random(150,205));
//   ellipse(width/2-181-xsmall(awake,sleep,400),100+70.5*p+sl+sleep*k/2,sleep*k,sleep*k);
   ellipse(width/2-181+xbig(awake,sleep,400),100+70.5*p+aw+awake*k/2,awake*k,awake*k);
   rect(100-40+170,height-70,30,10);
   
  ///////////////////............................................................ WORK and FUN 

   noFill();
   stroke(0);
   x2=x+xsmall(work,fun,300);
   y2=y+awake*k+fu;
   x=x-xbig(work,fun,300);
   y=y+awake*k+wo;
  
   beginShape();                         
   curveVertex(x,y);
   curveVertex(x,y);
   curveVertex(x+xbig(work,fun,300),y-wo);
   curveVertex(x2,y2);
   curveVertex(x2,y2);
   endShape(); 
   noStroke();
   fill(random(7,140),random(0,100),45);
   ellipse(x,y+work*k/2,work*k,work*k);
   rect(100-40+170*2,height-50,30,10);
   fill(random(256),random(200,255),255);
   ellipse(x2,y2+fun*k/2,fun*k,fun*k);
   rect(100-40+170*2,height-70,30,10);
   
  
///////////////////............................................................ CLASSROOM and HOMEWORK 

   noFill();
   stroke(0);
   x2=x+xsmall(homework,classroom,300);
   y2=y+work*k+ho;
   x=x-xbig(homework,classroom,300);
   y=y+work*k+cl;
  
   beginShape();                         
   curveVertex(x,y);
   curveVertex(x,y);
   curveVertex(x+xbig(homework,classroom,300),y-cl);
   curveVertex(x2,y2);
   curveVertex(x2,y2);
   endShape(); 
   noStroke();
   fill(random(7,140),random(0,100),random(45,190));
   ellipse(x,y+homework*k/2,homework*k,homework*k);
   rect(100-40+170*3,height-50,30,10);
   fill(random(256),random(170,230),random(0,150));
   ellipse(x2,y2+classroom*k/2,classroom*k,classroom*k);
   rect(100-40+170*3,height-70,30,10);   
  
  
  
  ///////////////////............................................................ COMPUTER and PAPER

   noFill();
   stroke(0);
   x2=x+xsmall(computer,paper,200);
   y2=y+homework*k+pa;
   x=x-xbig(computer,paper,200);
   y=y+homework*k+co;
  
   beginShape();                         
   curveVertex(x,y);
   curveVertex(x,y);
   curveVertex(x+xbig(computer,paper,200),y-co);
   curveVertex(x2,y2);
   curveVertex(x2,y2);
   endShape(); 
   noStroke();
   fill(random(140,180),random(200,256),random(90,180));
 //  ellipse(x,y+computer*k/2,computer*k,computer*k);
   ellipse(x2,y2+paper*k/2,paper*k,paper*k);
   rect(100-40+170*4,height-50,30,10);
   fill(random(156,256),random(12,40),random(0,75));
 //  ellipse(x2,y2+paper*k/2,paper*k,paper*k);
   ellipse(x,y+computer*k/2,computer*k,computer*k);
   rect(100-40+170*4,height-70,30,10); 



  ///////////////////............................................................DESIGN and (CODE and WEB)
  
   noFill();
   stroke(0);
   x2=x+xsmall((web+code),design,150);
   y2=y+computer*k+(we+cod);
   x=x-xbig((web+code),design,150);
   y=y+computer*k+des;
  
   beginShape();                         
   curveVertex(x,y);
   curveVertex(x,y);
   curveVertex(x+xbig((web+code),design,150),y-des);
   curveVertex(x2,y2);
   curveVertex(x2,y2);
   endShape(); 
   noStroke();
   fill(random(0,26),random(100,150),random(70,130));
  // ellipse(x2,y2+design*k/2,design*k,design*k);
 //  rect(100-40+170*6,height-50,30,10);
  // rect(100-40+170*6,height-70,30,10); 
   fill(random(0,200),random(12,120),random(50,75));
  ellipse(x,y+computer*k/2,computer*k,computer*k);
  rect(100-40+170*6,height-70,30,10); 
  
  

 ///////////////////............................................................ CODE and WEB
  
   noFill();
   stroke(0);
 //  x2=x+xsmall(web,code,150);
 //  y2=y+computer*k+cod;
   x=x-xbig(web,code,150);
   y=y+computer*k+we;
  
   beginShape();                         
   curveVertex(x2-xsmall(web,code,150),y2+we);
   curveVertex(x2-xsmall(web,code,150),y2+we);
   curveVertex(x2,y2);
   curveVertex(x2+xbig(web,code,150),y2);
   curveVertex(x2+xbig(web,code,150),y2);
   endShape(); 
   noStroke();
   fill(random(0,26),random(100,150),random(70,130));
   ellipse(x2-xsmall(web,code,150),y2+we,code*k,code*k);
 //  rect(100-40+170*6,height-50,30,10);
   rect(100-40+170*5,height-70,30,10); 
   fill(random(0,200),random(12,120),random(50,75));
   ellipse(x2+xbig(web,code,150),y2,web*k,web*k);
   rect(100-40+170*5,height-50,30,10); 
   
   
  ///////////////////............................................................GO_OUT and (PARTY and MOVIE)
  
   noFill();
   stroke(0);
   xx=width/2+283;
   yy=90+45*p;
   xx2=xx+xsmall(go_out,(party+movie),300);
   yy2=yy+par/2+mo;
  
   beginShape();                         
   curveVertex(xx-xbig(go_out,(party+movie),300),yy+go);
   curveVertex(xx-xbig(go_out,(party+movie),300),yy+go);
   curveVertex(xx,yy);
   curveVertex(xx2,yy2);
   curveVertex(xx2,yy2);
   endShape(); 
   noStroke();
   fill(random(50,78),random(33,100),random(100,230));
   ellipse(xx-xbig(go_out,(party+movie),300),yy+go+go_out/2*k,go_out*k,go_out*k);
   rect(100-40+170*6,height-50,30,10);
  // rect(100-40+170*6,height-70,30,10); 
   fill(random(0,200),random(12,120),random(50,75));
 // ellipse(x,y+computer*k/2,computer*k,computer*k);
 // rect(100-40+170*6,height-70,30,10); 
   
  ///////////////////............................................................PARTY and MOVIE

   noFill();
   stroke(0);
   xx=xx2;
   yy=yy2;
  
   beginShape();                         
   curveVertex(xx-xbig(party,movie,200),yy+par);
   curveVertex(xx-xbig(party,movie,200),yy+par);
   curveVertex(xx2,yy2);
   curveVertex(xx2+xsmall(party,movie,200),yy2+mo);
   curveVertex(xx2+xsmall(party,movie,200),yy2+mo);
   endShape(); 
   noStroke();
   fill(random(0,26),random(100,150),random(70,130));
   ellipse(xx2+xsmall(party,movie,200),yy2+mo+party/2*k,party*k,party*k);
//   rect(100-40+170*6,height-50,30,10);
   rect(100-40+170*7,height-70,30,10); 
   fill(random(150,200),random(100,180),random(50,120));
   ellipse(xx-xbig(party,movie,200),yy+par+movie/2*k,movie*k,movie*k);
   rect(100-40+170*7,height-50,30,10);
  
   
}
 
  
  
  
  
  
void graph_key () {
 fill(0);
 rect(100-40,height-70,30,10);
 text("Bootcamp",100,height-60); 
 text("Normal Life",100,height-40);
 text("Awake",100+170, height-60);
 text("Sleep",100+170, height-40);
 text("Fun",100+2*170,height-60); 
 text("Work",100+2*170,height-40); 
 text("Classroom",100+3*170,height-60); 
 text("Homework",100+3*170,height-40); 
 text("On computer",100+4*170,height-60); 
 text("On paper",100+4*170,height-40); 
 text("Code",100+5*170,height-60); 
 text("Web",100+5*170,height-40); 
 text("Design",100+6*170,height-60); 
 text("Going out",100+6*170,height-40); 
 text("Parties",100+7*170,height-60); 
 text("Movies",100+7*170,height-40); 
 text("Cem Kocyildirim 2011",width-150,height-10);

}


float randomY (int range1, int range2) {
  float x=random(range1,range2);
  return (x);
  
}

float xbig (float big, float small,float line_length) {
  float xbig=  line_length*small/(small+big);
  println(xbig);
  return(xbig);
}

float xsmall (float big, float small, float line_length) {
 float xsmall= line_length*big/(small+big);
 return (xsmall);
}

